package com.da.activiti.FormBuilder.gen.models;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Field implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8592153099330595278L;

	@JsonProperty(value = "values")
	private List<Value> values;

	private String name;
	@JsonProperty(value = "class")
	private String className;

	private String label;

	private String required;

	private String type;
	
	private String value ;
	
	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	private transient String fieldId ;

	public String getFieldId() {
		return fieldId;
	}

	public void setFieldId(String fieldId) {
		this.fieldId = fieldId;
	}

	public String getSubtype() {
		return subtype;
	}

	public void setSubtype(String subtype) {
		this.subtype = subtype;
	}

	private String subtype;

	private transient String jsonData;

	public String getUserFromId() {
		return userFromId;
	}

	public void setUserFromId(String userFromId) {
		this.userFromId = userFromId;
	}

	private transient String userFromId;

	public String getJsonData() {
		return jsonData;
	}

	public void setJsonData(String jsonData) {
		this.jsonData = jsonData;
	}

	public List<Value> getValues() {
		return values;
	}

	public void setValues(List<Value> values) {
		this.values = values;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getRequired() {
		return required;
	}

	public void setRequired(String required) {
		this.required = required;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
