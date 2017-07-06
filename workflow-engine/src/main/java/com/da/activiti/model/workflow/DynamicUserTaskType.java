package com.da.activiti.model.workflow;

import java.util.Arrays;
import java.util.List;

/**
 \* @author Santosh Pandey
 */
public enum DynamicUserTaskType {
    COLLABORATION,
    APPROVE_REJECT;
	
	public static DynamicUserTaskType findByTasktype(String tasktype){
		
		if(tasktype == null || tasktype.length() == 0  ) {
			return null;
		}
	    for(DynamicUserTaskType v : values()){
	        if( v.COLLABORATION.name().equals(tasktype)){
	            return v.COLLABORATION;
	        }else if(v.APPROVE_REJECT.name().equals(tasktype)) {
	        	return v.APPROVE_REJECT;
	        }else {
	        	return null;
	        	}
	        }
	    return null;
	}

    public static List<DynamicUserTaskType> asList(){
        return Arrays.asList(DynamicUserTaskType.values());
    }
}
