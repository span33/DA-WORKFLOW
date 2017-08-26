package com.da.activiti.document.dao;

import java.sql.Types;
import java.util.Collections;
import java.util.HashMap;
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
import com.da.activiti.document.TaskRowMapper;
import com.da.activiti.exception.BusinessException;
import com.da.activiti.model.document.ProcessInfo;
import com.da.activiti.model.document.TaskInfo;
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
	public int getCount(String processName) {
		String sql = "SELECT count(*) FROM PROCESS where process_name=:processName";
		Map<String, String> params = ImmutableMap.of("processName", processName);
		int count = this.namedJdbcTemplate.queryForObject(sql, params, Integer.class);
		LOG.debug("Got count: {} of book reports", count);
		return count;
	}
	@Override
	public List<ProcessInfo> readAll() {
		// TODO Auto-generated method stub
		/* this.ds.getConnection() */
		String sql = "SELECT * FROM Process ORDER BY dt_created ASC";
		List<ProcessInfo> processInfos = this.namedJdbcTemplate.query(sql, new ProcessRowMapper());
		LOG.debug("got all book reports: {}", processInfos.size());
		return processInfos;
	}
	@Override
	public List<ProcessInfo> readAllSubprocess(int processId) {
		// TODO Auto-generated method stub
		/* this.ds.getConnection() */
		String sql = "SELECT * FROM Process where process_parent_id=:processId ORDER BY dt_created ASC";
		Map<String, Integer> params = ImmutableMap.of("processId", processId);
		List<ProcessInfo> processInfos = this.namedJdbcTemplate.query(sql, params, new ProcessRowMapper());
		LOG.debug("got all book reports: {}", processInfos.size());
		return processInfos;
	}
	@Override
	public List<ProcessInfo> readPage(PagingCriteria criteria) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String create(ProcessInfo obj) throws BusinessException {
		LOG.debug("Inserting  ProcessInfo into SQL backend: {}", obj);
		
		if(readByName(obj.getProcessName()) ) {
			throw new BusinessException("Duplicate process::::"+obj.getProcessName());
		}

		String sql = "INSERT INTO PROCESS (process_name, process_description,process_owner, process_type, process_template_id, process_level, process_parent_id, process_hasSibling, created_by,doc_type,group_Id,department_id) "
								+ "VALUES (:processName, :processDescription,:processOwner,:processType, :processTemplateId, :processLevel,   :parent          ,:processHasSibling, :createdBy,:docType,:groupId,:departmentId)";
		KeyHolder keyHolder = new GeneratedKeyHolder();
		BeanPropertySqlParameterSource source = new BeanPropertySqlParameterSource(obj);
		source.registerSqlType("docType", Types.VARCHAR);
		this.namedJdbcTemplate.update(sql, source, keyHolder);
		String processId = Long.toString(keyHolder.getKey().longValue());
		if(obj.getDepartmentList()!= null) 
		creatProcessDepartmentMapping(processId, obj.getDepartmentList());
		return processId;
	}
	
	public void creatProcessDepartmentMapping(String processId, List<String> departments) {
		String sql = "INSERT INTO process_department_mapping (process_id, department_id) "
				+ "VALUES (:processId, :department)";
		departments.forEach(index -> {
			Map<String, String> params = new HashMap<>();
			params.put("processId", processId);
			params.put("department", index);
			this.namedJdbcTemplate.update(sql, params);
		
		});
	
	}

	public String create(TaskInfo obj) {
		LOG.debug("Inserting  TaskInfo into SQL backend: {}", obj);

		String sql = "INSERT INTO Task (task_name, task_description, task_owner, task_type,  task_status, task_actor,process_id) "
				+ "VALUES (:taskName, :taskDescription, :taskOwner, :taskType, :taskStatus, :actorId,:processId)";
		KeyHolder keyHolder = new GeneratedKeyHolder();
		BeanPropertySqlParameterSource source = new BeanPropertySqlParameterSource(obj);
		this.namedJdbcTemplate.update(sql, source, keyHolder);
		return Long.toString(keyHolder.getKey().longValue());
	}
	
	public boolean update(TaskInfo obj) {
		LOG.debug("Updating  TaskInfo into SQL backend: {}", obj);

		String sql = "update  Task set task_name =:taskName, task_description =:taskDescription, task_owner =:taskOwner, task_type =:taskType,  task_status =:taskStatus, task_actor =:actorId,process_id =:processId "
				+ " where task_id=:id";
		BeanPropertySqlParameterSource source = new BeanPropertySqlParameterSource(obj);
		return namedJdbcTemplate.update(sql, source) > 0 ;
	}
	
	public boolean delete(TaskInfo obj) {
		LOG.debug("Deleting  TaskInfo into SQL backend: {}", obj);
		String sql = "delete from   Task where task_id=:id  ";
		BeanPropertySqlParameterSource source = new BeanPropertySqlParameterSource(obj);
		return this.namedJdbcTemplate.update(sql, source) > 0 ;
	}

	@Override
	public void createWithId(ProcessInfo obj) {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(ProcessInfo obj) {

		LOG.debug("Updating  ProcessInfo into SQL backend: {}", obj);

		String sql = "update PROCESS set process_name=:processName, process_description=:processDescription, process_type=:processType, process_template_id=:processTemplateId, process_level=:processLevel, process_parent_id=:parent, process_hasSibling=:processHasSibling,doc_type =:docType,group_Id=:groupId,process_owner=:processOwner ,process_act_name=:processActName where process_Id=:id ";

		BeanPropertySqlParameterSource source = new BeanPropertySqlParameterSource(obj);
		source.registerSqlType("docType", Types.VARCHAR);
		int updated = this.namedJdbcTemplate.update(sql, source);
		LOG.debug("updated: {} Process", updated);
	}

	@Override
	public void delete(int id) {
		String sql = "DELETE FROM Process WHERE process_Id = :id";
		Map<String, Integer> params = ImmutableMap.of("id", id);
		int deleted = this.namedJdbcTemplate.update(sql, params);
		LOG.debug("Deleted: {} Process", deleted);

	}

	@Override
	public List<TaskInfo> readTaskByProcessId(int id) {
		String sql = "SELECT * FROM task  where process_id = :id";
		Map<String, Integer> params = ImmutableMap.of("id", id);
		List<TaskInfo> processInfos = this.namedJdbcTemplate.query(sql, params, new TaskRowMapper());
		return processInfos;
	}

	@Override
	public ProcessInfo read(String id) {
		String sql = "SELECT * FROM Process where process_Id = :id";
		Map<String, String> params = ImmutableMap.of("id", id);
		ProcessInfo processInfo = this.namedJdbcTemplate.queryForObject(sql, params, new ProcessRowMapper());
		return processInfo;
	}
	
	@Override
	public boolean readByName(String processName) {
		return getCount(processName) > 0;
	}

	@Override
	public List<Map<String, Object>> getProcesList() {
		String sql = "SELECT process_id  as 'processId' ,process_name as 'processName',department_id as 'departmentId', doc_type as 'docType', group_Id as 'groupId',process_description  as 'processDescription' ,"
				+ "process_owner as 'processOwner' ,"
				+ "process_type as 'processType' ,process_template_id as 'processTemplateId' ,process_level as 'level' ,process_parent_id as parent ,"
				+ "process_hasSibling as processHasSibling ,'Addprocess' as 'Addprocess' ,'Actions' as 'Actions' ,  isleaf ,  expanded   FROM Process where process_parent_id is null ORDER BY dt_created ASC;";

		return executeDynamicNativeQuery(sql);
	}

	public List<Map<String, Object>> getSubProcesListByProcessId(int processId) {
		String sql = "SELECT process_id  as 'processId' ,process_name as 'processName' ,process_description  as processDescription ,"
				+ "process_owner as 'processOwner' ,"
				+ "process_type as 'processType' ,process_template_id as 'processTemplateId' ,process_level as 'level' ,process_parent_id as parent ,"
				+ "process_hasSibling as processHasSibling ,'Addprocess' as 'Addprocess' ,'Actions' as 'Actions' ,  isleaf ,  expanded   FROM Process where process_parent_id = ? ORDER BY dt_created ASC;";

		Map<String, Object> parameters = new LinkedHashMap<String, Object>();
		parameters.put("process_parent_id", processId);
		return executeDynamicNativeQueryWithParameter(sql, parameters);
	}

	@Override
	public List<Map<String, Object>> getTaskByProcessId(String processName) {
		// TODO Auto-generated method stub
		String sql = "select ta.ID_ as Id ,ta.NAME_ as Name ,ta.DESCRIPTION_  as Description,ta.OWNER_ as Owner ,ta.ASSIGNEE_ as Actor from act_ru_task ta  where ta.PROC_DEF_ID_ =  ?";
		Map<String, Object> parameters = new LinkedHashMap<String, Object>();
		parameters.put("PROC_DEF_ID_", processName);
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
	public List<Map<String, Object>> getTaskListByProcessId(int id) {
		String sql = "select task_id as taskId ,task_name as taskName, task_description as taskDescription, task_owner as taskOwner, task_type as taskType,  task_status as taskStatus, task_actor as actorId,process_id as processId from task where process_id =?";
		Map<String, Object> parameters = new LinkedHashMap<String, Object>();
		parameters.put("process_id", id);
		return executeDynamicNativeQueryWithParameter(sql, parameters);
	}

	@Override
	public List<Map<String, Object>> getTaskList() {
		return executeDynamicNativeQuery(
				"select  task_name , task_description, task_owner, task_type,  task_status, task_actor from task ");

	}

	@Override
	public List<Map<String, Object>> getTaskActorMappingListById(int id) {
		String sql = "select  taskactor_mapping_id as 'Task actor mapping id' , task_id as 'Task Id' from task_actor_mapping where task_id =?";
		Map<String, Object> parameters = new LinkedHashMap<String, Object>();
		parameters.put("task_id", id);
		return executeDynamicNativeQueryWithParameter(sql, parameters);
	}

	@Override
	public List<Map<String, Object>> getTaskActorMappingList() {
		// TODO Auto-generated method stub
		return executeDynamicNativeQuery(
				"select taskactor_mapping_id as 'Task actor mapping id' , task_id as 'Task Id' from task_actor_mapping  ");
	}

	@Override
	public List<Map<String, Object>> getDepartmentList() {
		String sql = "SELECT department_id,department_name FROM department ";
		return executeDynamicNativeQuery(sql);
	}

	@Override
	public List<Map<String, Object>> getUserByDepartmentId(List<String> departments) {
		String wdata = "";
		for (String department : departments) {
			wdata = wdata + department + "OR";
		}
		String sql = " SELECT ID_ FROM act_id_user where department_id= " + wdata;
		return executeDynamicNativeQuery(sql);
	}

	@Override
	public List<Map<String, Object>> getProcessListByTaskMappingId(int taskMappingId) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub

	}

}
