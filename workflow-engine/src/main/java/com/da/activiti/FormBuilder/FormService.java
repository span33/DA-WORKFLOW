package com.da.activiti.FormBuilder;

import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import org.activiti.engine.IdentityService;
import org.activiti.engine.identity.Group;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.da.activiti.FormBuilder.gen.models.Field;
import com.da.activiti.FormBuilder.gen.models.Value;
import com.da.activiti.document.ProcessUserfomInfo;
import com.da.activiti.exception.BusinessException;
import com.da.activiti.model.FormTemplateInfo;
import com.da.activiti.model.WorkFlowBean;
import com.da.activiti.model.document.DocState;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;

@Service("formService")
public class FormService {

	@Autowired protected FormsDao formsDao ;
	
	@Autowired protected WorkFlowDao workFlowDao ;
	
	@Autowired protected IdentityService identityService ;
	
	
	@Transactional
	public String   saveFormData(FormTemplateInfo obj) throws BusinessException {
		obj.getFields().forEach(field -> {field.setJsonData(convertListToJson(field.getValues()));
		if(field.getType().equalsIgnoreCase("radio-group")) {
			field.setType("radio");
		}
		});
		obj.setJsonData(convertListToJson(obj.getFields()));
		return formsDao.create(obj);
	}
	
	private static String convertListToJson(List<?> data) {
		final ObjectMapper mapper = new ObjectMapper();
		String jsonInString ="";
		try {
			jsonInString = mapper.writeValueAsString(data);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return jsonInString;
	}
	
	public List<ProcessUserfomInfo>  userFormsByUserId (String userName) {
		List<ProcessUserfomInfo>  retList = formsDao.userFormsListByUserId(userName) ;
		retList.forEach(index->{
			index.setFormLink("userProcessFormId="+index.getId()+"&docType="+index.getDocType());
		}) ;
		return retList ;
	}
	
	public List<ProcessUserfomInfo>  userFormsByCurrentUserRoleType (String userName) {
		 List<Group> groups = this.identityService.createGroupQuery().groupMember(userName).groupType("security-role").list();
		Set <String> groupIds = new HashSet<>() ;
		 groups.forEach(index -> groupIds.add(index.getId()));
		 List<ProcessUserfomInfo>  retList = formsDao.userFormsListByGroups(groupIds) ;
		retList.forEach(index->{
			index.setFormLink("userProcessFormId="+index.getId()+"&docType="+index.getDocType());
		}) ;
		return retList ;
	}
	
	private List<Value> converJsonToList(String jsonString) {
		final ObjectMapper mapper = new ObjectMapper();
		List<Value> list = null ;
		try {
			 list = mapper.readValue(jsonString, 
					TypeFactory.defaultInstance().constructCollectionType(List.class, Value.class));
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list ;
	}
	public List<Field> fetchFormFields(int processUserFormId) {
		List<Field> fieldList =  formsDao.getFormFields(processUserFormId);
		fieldList.forEach(index->index.setValues(converJsonToList(index.getJsonData())));
		return fieldList ;
	}
	
	@Transactional
	public String  saveWorkFlowFormData(Map<String,String []> formData,DocState docState,String userName) {
		Map<String, String> workflowmap = new HashMap<>();
		String docType =formData.get("docType")[0] ;
		WorkFlowBean workFlowBean  = new WorkFlowBean(docType, formData.get("userProcessFormId")[0], docState, userName);
		List<Group> groups = this.identityService.createGroupQuery().groupMember(userName).groupType("security-role").list();
		workFlowBean.setGroupId(groups.get(0).getId());
		workflowmap.put("docType",formData.get("docType")[0]);
		workflowmap.put("userProcessFormId",formData.get("userProcessFormId")[0]);
		workflowmap.put("docState",docState.name());
		workflowmap.put("createdBy",userName);
		Map<String, String[]> collect = formData.entrySet().stream()
				.filter(map -> !(workflowmap.containsKey(map.getKey())))
				.collect(Collectors.toMap(p -> p.getKey(), p -> p.getValue()));
		String workFlowId  = workFlowDao.createWorkFlow(workFlowBean);
		workFlowDao.createWorkFlowMapping(collect, workFlowId);
		return workFlowId ;
		
	}
	
	@Transactional
	public List<Field>  fetchWordFlowDataById(String workFlowId,int processUserFormId) {
		List<Field> fieldList = fetchFormFields(processUserFormId);
		fieldList.forEach(index-> index.setJsonData(null));
		System.out.println("fieldList::::"+convertListToJson(fieldList));
		Map<String, Object>   rowMap = formsDao.getWorkFlowDataById(workFlowId);
		fieldList.forEach(index->index.setValue((String)rowMap.get(index.getName())));
		fieldList.forEach(index -> System.out.println(index.getName() + ":::::"+index.getValue()));
		return fieldList;
		
	}
	
	@Transactional
	public List<Map<String, Object>> fetchUserFormList() {
		return formsDao.getUserFormList();
	}
}
