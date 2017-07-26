package com.da.activiti.model;

import java.io.Serializable;
import java.util.List;

import com.da.activiti.FormBuilder.gen.models.Field;
import com.da.activiti.FormBuilder.gen.models.FormTemplate;
import com.da.activiti.model.document.DocType;
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
	private DocType docType ;
	private String jsonData ;
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
	public DocType getDocType() {
		return docType;
	}
	public void setDocType(DocType docType) {
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
