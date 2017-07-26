package com.da.activiti.FormBuilder;

import static com.google.common.base.Preconditions.checkArgument;

import java.sql.Types;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.activiti.engine.identity.Group;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.da.activiti.dao.BaseDao;
import com.da.activiti.model.WorkFlowBean;
import com.da.activiti.model.WorkFlowMappingBean;
import com.da.activiti.web.PagingCriteria;
import com.google.common.collect.ImmutableMap;

import JdbcWorkFlowDao.WorkFlowRowMapper;

@Repository
@Component("workFlowDao")
public class JdbcWorkFlowDao extends BaseDao implements WorkFlowDao {
	private static final Logger LOG = LoggerFactory.getLogger(JdbcWorkFlowDao.class);


	@Override
	public String createWorkFlow(WorkFlowBean workFlowBean) {
		String sql = "INSERT INTO workflow (doc_type,process_userform_id,DOC_STATE,created_by,GROUP_ID)"
				+ "VALUES (:docType, :userProcessFormId, :docState,:createdBy,:groupId)";
		BeanPropertySqlParameterSource source = new BeanPropertySqlParameterSource(workFlowBean);
		source.registerSqlType("docState", Types.VARCHAR);
        source.registerSqlType("docType", Types.VARCHAR);
		KeyHolder keyHolder = new GeneratedKeyHolder();
		this.namedJdbcTemplate.update(sql, source, keyHolder);
		return  Long.toString(keyHolder.getKey().longValue());
	}

	@Override
	public void createWorkFlowMapping(Map<String, String[]> collect, String workflowId) {
		List<SqlParameterSource> parameters = new ArrayList<SqlParameterSource>();
		String sql = "INSERT INTO workflow_mapping (field_name, field_value,workflow_id) "
				+ "VALUES (:filedName, :fieldValue, :workflowId)";
		collect.forEach((key, value) -> {

			for (String data : value) {
				WorkFlowMappingBean workFlowMappingBean = new WorkFlowMappingBean(key, data, workflowId);
				parameters.add(new BeanPropertySqlParameterSource(workFlowMappingBean));

			}
		});
		this.namedJdbcTemplate.batchUpdate(sql, parameters.toArray(new SqlParameterSource[0]));

	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<WorkFlowBean> readAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<WorkFlowBean> readPage(PagingCriteria criteria) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String create(WorkFlowBean obj) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void createWithId(WorkFlowBean obj) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(WorkFlowBean obj) {
		checkArgument(StringUtils.isNotBlank(obj.getId()), "document id cannot be blank");
        String sql = "UPDATE workflow SET  doc_state=:docState WHERE id=:id";

        BeanPropertySqlParameterSource source = new BeanPropertySqlParameterSource(obj);
        source.registerSqlType("docState", Types.VARCHAR);
        int results = this.namedJdbcTemplate.update(sql, source);
        LOG.debug("Updated: {} journals", results);
		
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public WorkFlowBean read(String id) {
		String sql = "SELECT * FROM workflow where id = :id";
        Map<String, String> params = ImmutableMap.of("id", id);
        WorkFlowBean WorkFlowBean = this.namedJdbcTemplate.queryForObject(sql, params, new WorkFlowRowMapper());
       
        return WorkFlowBean;
	}
	
	
	


}
