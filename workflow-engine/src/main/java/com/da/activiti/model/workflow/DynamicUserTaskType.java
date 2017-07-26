package com.da.activiti.model.workflow;

import java.util.Arrays;
import java.util.List;

/**
 \* @author Santosh Pandey
 */
public enum DynamicUserTaskType {
    COLLABORATION,
    APPROVE_REJECT,
	DOC_SUBMIT,
	BACKEND_TASK;
	
	
	
	public static DynamicUserTaskType findByTasktype(String tasktype){
		
		if(tasktype == null || tasktype.length() == 0  ) {
			return null;
		}
	    for(DynamicUserTaskType v : values()){
	        if( v.COLLABORATION.name().equals(tasktype)){
	            return v.COLLABORATION;
	        }else if(v.APPROVE_REJECT.name().equals(tasktype)) {
	        	return v.APPROVE_REJECT;
	        }else if(v.DOC_SUBMIT.name().equals(tasktype)) {
	        	return v.DOC_SUBMIT;
	        }else {
	        	return BACKEND_TASK;
	        	}
	        }
	    return null;
	}

    public static List<DynamicUserTaskType> asList(){
        return Arrays.asList(DynamicUserTaskType.values());
    }
}
