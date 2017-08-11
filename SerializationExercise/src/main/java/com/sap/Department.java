package com.sap;

import java.io.Serializable;

public class Department implements Serializable ,Mapping {
	/**
	 * 
	 */
	private static final long serialVersionUID = 509169588786842096L;
	private String deptName;
	private Employee emp;
	private int deptId;
	public int getDeptId() {
		return deptId;
	}
	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public Employee getEmp() {
		return emp;
	}
	public void setEmp(Employee emp) {
		this.emp = emp;
	}
	
	

	
	
}
