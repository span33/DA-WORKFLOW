package com.da.activiti.document.dao;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.da.activiti.dao.BaseDao;
import com.da.activiti.document.ProcessRowMapper;
import com.da.activiti.model.document.ProcessInfo;
import com.da.activiti.web.PagingCriteria;
import com.google.common.collect.ImmutableMap;

@Repository
@Component("processDao")
public class JdbcProcessDao extends BaseDao implements ProcessDao {
	private static final Logger LOG = LoggerFactory.getLogger(JdbcProcessDao.class);
	@Override
	public int getCount() {
		String sql = "SELECT count(*) FROM PROCESS";
        @SuppressWarnings("unchecked")
        int count = this.namedJdbcTemplate.queryForObject(sql, Collections.EMPTY_MAP, Integer.class);
        LOG.debug("Got count: {} of book reports", count);
        return count;
	}

	@Override
	public List<ProcessInfo> readAll() {
		// TODO Auto-generated method stub
		/*this.ds.getConnection()*/
		 String sql = "SELECT * FROM Process ORDER BY dt_created ASC";
	        List<ProcessInfo> processInfos = this.namedJdbcTemplate.query(sql, new ProcessRowMapper());
	        LOG.debug("got all book reports: {}", processInfos.size());
	        return processInfos;
	
	}

	@Override
	public List<ProcessInfo> readPage(PagingCriteria criteria) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String create(ProcessInfo obj) {
		LOG.debug("Inserting  ProcessInfo into SQL backend: {}",obj);
      

    
        String sql = "INSERT INTO PROCESS (process_name, process_description, process_type, process_template_id, process_level, process_parent_id, process_hasSibling, created_by) " +
                				  "VALUES (:processName, :processDescription, :processType, :processTemplateId, :processLevel, :processParentId, :processHasSibling, :createdBy)";
        KeyHolder keyHolder = new GeneratedKeyHolder(); 
        BeanPropertySqlParameterSource source = new BeanPropertySqlParameterSource(obj);
        this.namedJdbcTemplate.update(sql, source,keyHolder);
        return  Long.toString(keyHolder.getKey().longValue());
     
   
	}

	@Override
	public void createWithId(ProcessInfo obj) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(ProcessInfo obj) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(String id) {
		 String sql = "DELETE FROM Process WHERE id = :id";
	        Map<String, String> params = ImmutableMap.of("id", id);
	        int deleted = this.namedJdbcTemplate.update(sql, params);
	        LOG.debug("Deleted: {} BookReports", deleted);
		
	}

	@Override
	public ProcessInfo read(String id) {
		 String sql = "SELECT * FROM Process where id = :id";
	        Map<String, String> params = ImmutableMap.of("id", id);
	        ProcessInfo processInfo = this.namedJdbcTemplate.queryForObject(sql, params, new ProcessRowMapper());
	        return processInfo;
	}

	@Override
	public List<Map<String, Object>> getProcesList() {
		// TODO Auto-generated method stub
		 String sql = "SELECT process_id  as 'Process Id' ,process_name as 'Process Name' ,process_description  as Description ,"
		 		+ "process_owner as 'Owner' ,"
		 		+ "process_type as 'Type' ,process_template_id as 'Template Id' ,process_level as 'Level' ,process_parent_id as Parent ,"
		 		+ "process_hasSibling as HasSibling , process_task_mapping_process_task_mapping_id  as 'Mapping Id',created_by as 'Created By'"
		 		+ " ,updated_by as 'Updated By' ,dt_created as 'Created Date' ,dt_updated as 'Updated Date' FROM Process ORDER BY dt_created ASC;";
		return executeDynamicNativeQuery(sql);
	}
	

	
	@Override
	public List<Map<String, Object>> getProcessTaskMappingListByTaskId(int id) {
		// TODO Auto-generated method stub
		 String sql = "select process_task_mapping_id as 'Process Task Mapping Id ', process_id as 'Process Id '  from process_task_mapping where task_id =?";
		 Map <String,Object> parameters = new LinkedHashMap<String,Object> () ;
		 parameters.put("rocess_task_mapping_id", id);
		return executeDynamicNativeQueryWithParameter(sql, parameters);
	}
	
	@Override
	public List<Map<String, Object>> getProcessTaskMappingList() {
		// TODO Auto-generated method stub
		 String sql = "select process_task_mapping_id as 'Process task mapping ', process_id as 'Process Id ' , "
		 		+ "task_id as 'Task Id ' from process_task_mapping";
		 
		return executeDynamicNativeQuery(sql);
	}

	@Override
	public List<Map<String, Object>> getTaskListById(int id) {
		 String sql = "select task_id as 'Task id' , task_name as 'Task Name' from task where task_id =?";
		 Map <String,Object> parameters = new LinkedHashMap<String,Object> () ;
		 parameters.put("task_id", id);
		 return executeDynamicNativeQueryWithParameter(sql, parameters);
	}

	@Override
	public List<Map<String, Object>> getTaskList() {
		return executeDynamicNativeQuery("select task_id as 'Task id' , task_name as 'Task Name' from task ") ;
		
	}

	@Override
	public List<Map<String, Object>> getTaskActorMappingListById(int id) {
		 String sql = "select  taskactor_mapping_id as 'Task actor mapping id' , task_id as 'Task Id' from task_actor_mapping where task_id =?";
		 Map <String,Object> parameters = new LinkedHashMap<String,Object> () ;
		 parameters.put("task_id", id);
		 return executeDynamicNativeQueryWithParameter(sql, parameters);
	}

	@Override
	public List<Map<String, Object>> getTaskActorMappingList() {
		// TODO Auto-generated method stub
		return executeDynamicNativeQuery("select taskactor_mapping_id as 'Task actor mapping id' , task_id as 'Task Id' from task_actor_mapping  ") ;
	}

	@Override
	public List<Map<String, Object>> getProcessListByTaskMappingId(int taskMappingId) {
				 String sql = "select Process_id as 'Process Id ',Process_name as 'Process Name' from process where process_task_mapping_process_task_mapping_id =?";
				 Map <String,Object> parameters = new LinkedHashMap<String,Object> () ;
				 parameters.put("process_task_mapping_process_task_mapping_id", taskMappingId);
				return executeDynamicNativeQueryWithParameter(sql, parameters);
	}

}
