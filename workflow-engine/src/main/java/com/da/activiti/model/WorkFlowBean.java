package com.da.activiti.model;

import java.io.Serializable;

import com.da.activiti.model.document.DocState;
import com.da.activiti.model.document.Document;

public class WorkFlowBean extends Document implements Serializable {
	private static final long serialVersionUID = 2373548153419149617L;
	private String  userProcessFormId ; 
	private String  createdBy ; 
	public WorkFlowBean(String docType, String userProcessFormId, DocState docState, String createdBy) {
		super();
		this.docType = docType;
		this.userProcessFormId = userProcessFormId;
		this.docState = docState;
		this.createdBy = createdBy;
	}
	
	public WorkFlowBean() {
		
	}
	
	
	public String getUserProcessFormId() {
		return userProcessFormId;
	}
	public void setUserProcessFormId(String userProcessFormId) {
		this.userProcessFormId = userProcessFormId;
	}
	
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	
	

}
