package com.da.activiti.FormBuilder;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.da.activiti.FormBuilder.gen.models.Field;
import com.da.activiti.dao.IBaseDao;
import com.da.activiti.document.ProcessUserfomInfo;
import com.da.activiti.model.FormTemplateInfo;
import com.da.activiti.model.document.ProcessInfo;

public interface FormsDao extends IBaseDao<FormTemplateInfo> {

	List<ProcessUserfomInfo> userFormsListByUserId(String userId);

	List<Field> getFormFields(int processUserFormId);

	Map<String, Object> getWorkFlowDataById(String workFlowId);

	List<Map<String, Object>> getUserFormList();

	boolean updateProcessUserMapping(ProcessInfo processInfo);

	List<ProcessUserfomInfo> userFormsListByGroups(Set<String> groups);

	List<ProcessUserfomInfo> userFormsListById(int id);
	
	int duplicateCheck(String formName) ; 
	
	void deleteMapping(String id) ;
	
	String updateExistingForm (FormTemplateInfo obj , String id) ;

}
