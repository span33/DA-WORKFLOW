package com.da.activiti.model.document;

public class ProcessDepartmentInfo extends Document {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6202402876080084935L;

	private int processId;
	private String departmentId;

	public int getProcessId() {
		return processId;
	}

	public void setProcessId(int processId) {
		this.processId = processId;
	}

	public String getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}

}
