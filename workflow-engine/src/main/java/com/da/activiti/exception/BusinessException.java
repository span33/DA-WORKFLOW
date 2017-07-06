package com.da.activiti.exception;

public class BusinessException extends Exception {
	
	String message ;
	
	public BusinessException(String message) {
		super(message);
}
}