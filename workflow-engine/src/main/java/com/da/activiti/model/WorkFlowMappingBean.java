package com.da.activiti.model;

public class WorkFlowMappingBean {
	private String  filedName ; 
	private String  fieldValue ; 
	private String  workflowId ; 
	public WorkFlowMappingBean(String filedName, String fieldValue, String workflowId) {
		super();
		this.filedName = filedName;
		this.fieldValue = fieldValue;
		this.workflowId = workflowId;
	}
	public String getFiledName() {
		return filedName;
	}
	public void setFiledName(String filedName) {
		this.filedName = filedName;
	}
	public String getFieldValue() {
		return fieldValue;
	}
	public void setFieldValue(String fieldValue) {
		this.fieldValue = fieldValue;
	}
	public String getWorkflowId() {
		return workflowId;
	}
	public void setWorkflowId(String workflowId) {
		this.workflowId = workflowId;
	}
	

}
