package com.da.activiti.exception;

public class BusinessException extends RuntimeException {
	
	String message ;
	
	public BusinessException(String message) {
		super(message);
}
}