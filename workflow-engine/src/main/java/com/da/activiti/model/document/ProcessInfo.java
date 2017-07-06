package com.da.activiti.model.document;

import java.util.List;

public class ProcessInfo extends Document {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6202402876080084935L;

	private int processId;

	private String processName;

	private String processDescription;

	private String processOwner;

	private String processType;

	private String processTemplateId;

	private List<ProcessInfo> subProcessList;

	private String processLevel;

	private String parent;

	private String processHasSibling;

	private String createdBy;

	private List<TaskInfo> taskList;
	
	private int processTaskMappingId;

	public List<TaskInfo> getTaskList() {
		return taskList;
	}

	public void setTaskList(List<TaskInfo> taskList) {
		this.taskList = taskList;
	}

	

	@Override
	public String toString() {
		return "ProcessInfo [processId=" + processId + ", processName=" + processName + ", processDescription="
				+ processDescription + ", processOwner=" + processOwner + ", processType=" + processType
				+ ", processTemplateId=" + processTemplateId + ", subProcessList=" + subProcessList + ", processLevel="
				+ processLevel + ", parent=" + parent + ", processHasSibling=" + processHasSibling + ", createdBy="
				+ createdBy + ", taskList=" + taskList + ", processTaskMappingId=" + processTaskMappingId + "]";
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}



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
	
	public String getParent() {
		return parent;
	}

	public void setParent(String parent) {
		this.parent = parent;
	}
	
	public List<ProcessInfo> getSubProcessList() {
		return subProcessList;
	}

	public void setSubProcessList(List<ProcessInfo> subProcessList) {
		this.subProcessList = subProcessList;
	}

}
