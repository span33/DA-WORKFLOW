package com.da.activiti.FormBuilder;

import java.util.List;
import java.util.Map;

import com.da.activiti.FormBuilder.gen.models.Field;
import com.da.activiti.dao.IBaseDao;
import com.da.activiti.document.ProcessUserfomInfo;
import com.da.activiti.model.FormTemplateInfo;

public interface FormsDao extends IBaseDao<FormTemplateInfo> {

	List<ProcessUserfomInfo> userFormsListByUserId(String userId);

	List<Field> getFormFields(int processUserFormId);
	
	public Map<String, Object> getWorkFlowDataById(String workFlowId);
	
}
