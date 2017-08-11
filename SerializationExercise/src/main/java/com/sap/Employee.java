package com.sap;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;

public class Employee implements Serializable , Mapping, Cloneable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1553423120741629222L;
	private String firstName;
	private String lastName;
	private String address;
	private int empId;
	private Collection <Department> dept = new ArrayList<Department>();

	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getEmpId() {
		return empId;
	}
	public void setEmpId(int empId) {
		this.empId = empId;
	}
	public Collection<Department> getDept() {
		return dept;
	}
	public void setDept(Collection<Department> dept) {
		this.dept = dept;
	}
	
	protected  Object clone() throws CloneNotSupportedException {
		return super.clone();
	}
	
	
}
