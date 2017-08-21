package com.da.activiti.model;

public class CodeLookUp {
	
	private String id ;

	private String codeType;

	private String keyCode;

	private String keyValue;

	private String dateCreated;

	public String getCodeType() {
		return codeType;
	}

	public void setCodeType(String codeType) {
		this.codeType = codeType;
	}

	public String getKeyCode() {
		return keyCode;
	}

	public void setKeyCode(String keyCode) {
		this.keyCode = keyCode;
	}

	public String getKeyValue() {
		return keyValue;
	}

	public void setKeyValue(String keyValue) {
		this.keyValue = keyValue;
	}

	public String getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(String dateCreated) {
		this.dateCreated = dateCreated;
	}
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
