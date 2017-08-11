package com.da.activiti.FormBuilder;

import java.sql.Types;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.activiti.engine.identity.Group;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.da.activiti.FormBuilder.gen.models.Field;
import com.da.activiti.dao.BaseDao;
import com.da.activiti.document.ProcessUserfomInfo;
import com.da.activiti.document.ProcessUserfomRowMapper;
import com.da.activiti.document.UserFormRowMapper;
import com.da.activiti.model.FormTemplateInfo;
import com.da.activiti.model.document.ProcessInfo;
import com.da.activiti.web.PagingCriteria;
import com.google.common.collect.ImmutableMap;

@Repository
@Component("formsDao")
public class JdbcFormsDao extends BaseDao implements FormsDao {
	private static final Logger LOG = LoggerFactory.getLogger(JdbcFormsDao.class);

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<FormTemplateInfo> readAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FormTemplateInfo> readPage(PagingCriteria criteria) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public boolean  updateProcessUserMapping(ProcessInfo processInfo) {
		String sql = "update process_userfom  set process_id=:id, doctype=:docType, group_id =:groupId ,user_Id=:processOwner where id =:processTemplateId " ;
		BeanPropertySqlParameterSource source = new BeanPropertySqlParameterSource(processInfo);
		return this.namedJdbcTemplate.update(sql, source) > 0 ;

	}

	@Override
	public List<ProcessUserfomInfo> userFormsListByUserId(String userId) {
		String sql = "SELECT * FROM process_userfom where user_id = :userId";
		Map<String, String> params = ImmutableMap.of("userId", userId);
		List<ProcessUserfomInfo> processUserfomInfoList = this.namedJdbcTemplate.query(sql, params,
				new ProcessUserfomRowMapper());
		return processUserfomInfoList;

	}

	@Override
	public String create(FormTemplateInfo obj)  {
		String sql = "INSERT INTO process_userfom (process_id,doctype,user_Id,json_data,userform_name) "
				+ "VALUES (:processId, :docType,:createdBy,:jsonData,:userformName)";
		KeyHolder keyHolder = new GeneratedKeyHolder();
		BeanPropertySqlParameterSource source = new BeanPropertySqlParameterSource(obj);
		source.registerSqlType("docType", Types.VARCHAR);
		this.namedJdbcTemplate.update(sql, source, keyHolder);
		String userFromId = Long.toString(keyHolder.getKey().longValue());
		create(obj.getFields(), userFromId);
		return userFromId;
	}

	private void create(List<Field> fieldList, String userFromId) {
		fieldList.forEach(field -> {
			String sql = "INSERT INTO user_from_mapping (name, type,subtype,required,label,class,process_userform_id,data) "
					+ "VALUES (:name, :type, :subtype, :required, :label, :className,:userFromId,:jsonData)";
			KeyHolder keyHolder = new GeneratedKeyHolder();
			field.setUserFromId(userFromId);
			BeanPropertySqlParameterSource source = new BeanPropertySqlParameterSource(field);
			this.namedJdbcTemplate.update(sql, source, keyHolder);
		});
	}

	public List<Field> getFormFields(int processUserFormId) {

		String sql = "SELECT * FROM user_from_mapping where process_userform_id = :processUserFormId";
		Map<String, Integer> params = ImmutableMap.of("processUserFormId", processUserFormId);
		List<Field> fieldList = this.namedJdbcTemplate.query(sql, params, new UserFormRowMapper());
		return fieldList;

	}

	/*private String convertListToJson(List<Serializable> list) {
		final ObjectMapper mapper = new ObjectMapper();
		StringWriter sw = null;
		try {
			sw = new StringWriter();
			mapper.writeValue(sw, list);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		;
		return sw.toString();
	}*/

	@Override
	public void createWithId(FormTemplateInfo obj) {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(FormTemplateInfo obj) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub

	}

	@Override
	public FormTemplateInfo read(String id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public Map<String, Object> getWorkFlowDataById(String workFlowId) {
		// TODO Auto-generated method stub
		String sql = "SELECT field_name,field_value FROM demo_da.workflow_mapping where workflow_id=?";
		Map<String, Object> parameters = new LinkedHashMap<String, Object>();
		parameters.put("workflow_id", workFlowId);
		return getRowMap(sql, parameters);
	}

	@Override
	public List<Map<String, Object>> getUserFormList() {
		String sql = "SELECT id,userform_name FROM demo_da.process_userfom";
	return  executeDynamicNativeQuery(sql);
		
	}

	@Override
	public List<ProcessUserfomInfo> userFormsListByGroups(Set<String> groups) {
		MapSqlParameterSource parameters = new MapSqlParameterSource();
		parameters.addValue("groups", groups);
		String sql = "SELECT * FROM process_userfom where group_id in(:groups)";
		return this.namedJdbcTemplate.query(sql, parameters,new ProcessUserfomRowMapper());
	}

}
