package com.da.activiti.model;

import java.io.Serializable;
import java.util.List;

import com.da.activiti.FormBuilder.gen.models.Field;
import com.da.activiti.FormBuilder.gen.models.FormTemplate;
import com.da.activiti.model.document.Document;

public class FormTemplateInfo  extends Document implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1555912555024806639L;
	private String processId ;
	private FormTemplate formTemplate ;
	private List<Field> fields ;
	private String formTemplateStr ;
	private String createdBy ;
	private String docType ;
	private String jsonData ;
	private String userformName;
	public String getUserformName() {
		return userformName;
	}
	public void setUserformName(String userformName) {
		this.userformName = userformName;
	}
	
	public String getJsonData() {
		return jsonData;
	}
	public void setJsonData(String jsonData) {
		this.jsonData = jsonData;
	}

	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public String getProcessId() {
		return processId;
	}
	public void setProcessId(String processId) {
		this.processId = processId;
	}
	public FormTemplate getFormTemplate() {
		return formTemplate;
	}
	public void setFormTemplate(FormTemplate formTemplate) {
		this.formTemplate = formTemplate;
	}
	public String getDocType() {
		return docType;
	}
	public void setDocType(String docType) {
		this.docType = docType;
	}
	public String getFormTemplateStr() {
		return formTemplateStr;
	}
	public void setFormTemplateStr(String formTemplateStr) {
		this.formTemplateStr = formTemplateStr;
	}
	public List<Field> getFields() {
		return fields;
	}
	public void setFields(List<Field> fields) {
		this.fields = fields;
	}

}
