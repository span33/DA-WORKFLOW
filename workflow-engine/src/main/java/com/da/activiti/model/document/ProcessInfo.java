package com.da.activiti.model.document;

public class ProcessInfo extends Document {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6202402876080084935L;
	
	private int processId ;
	
	private String processName ;
	
	private String processDescription ;
	
	private String processOwner ;
	
	private String processType ;
	
	private String processTemplateId ;
	
	@Override
	public String toString() {
		return "ProcessInfo [processName=" + processName + ", processDescription=" + processDescription
				+ ", processOwner=" + processOwner + ", processType=" + processType + ", processTemplateId="
				+ processTemplateId + ", processLevel=" + processLevel + ", processParentId=" + processParentId
				+ ", processHasSibling=" + processHasSibling + ", createdBy=" + createdBy + ", processTaskMappingId="
				+ processTaskMappingId + "]";
	}

	private String processLevel ;
	
	private String processParentId ;
	
	private String processHasSibling ;
	
	private String createdBy ;
	
	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	private int processTaskMappingId ;
	

	public int getProcessId() {
		return processId;
	}

	public void setProcessId(int processId) {
		this.processId = processId;
	}

	public String getProcessName() {
		return processName;
	}

	public void setProcessName(String processName) {
		this.processName = processName;
	}

	public String getProcessDescription() {
		return processDescription;
	}

	public void setProcessDescription(String processDescription) {
		this.processDescription = processDescription;
	}

	public String getProcessOwner() {
		return processOwner;
	}

	public void setProcessOwner(String processOwner) {
		this.processOwner = processOwner;
	}

	public String getProcessType() {
		return processType;
	}

	public void setProcessType(String processType) {
		this.processType = processType;
	}

	public String getProcessTemplateId() {
		return processTemplateId;
	}

	public void setProcessTemplateId(String processTemplateId) {
		this.processTemplateId = processTemplateId;
	}

	public String getProcessLevel() {
		return processLevel;
	}

	public void setProcessLevel(String processLevel) {
		this.processLevel = processLevel;
	}

	public String getProcessParentId() {
		return processParentId;
	}

	public void setProcessParentId(String processParentId) {
		this.processParentId = processParentId;
	}

	public String getProcessHasSibling() {
		return processHasSibling;
	}

	public void setProcessHasSibling(String processHasSibling) {
		this.processHasSibling = processHasSibling;
	}

	public int getProcessTaskMappingId() {
		return processTaskMappingId;
	}

	public void setProcessTaskMappingId(int processTaskMappingId) {
		this.processTaskMappingId = processTaskMappingId;
	}

}
