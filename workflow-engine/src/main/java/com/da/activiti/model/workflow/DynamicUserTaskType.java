package com.da.activiti.model.workflow;

import java.util.Arrays;
import java.util.List;

/**
 \* @author Santosh Pandey
 */
public enum DynamicUserTaskType {
    COLLABORATION,
    APPROVE_REJECT;

    public static List<DynamicUserTaskType> asList(){
        return Arrays.asList(DynamicUserTaskType.values());
    }
}
