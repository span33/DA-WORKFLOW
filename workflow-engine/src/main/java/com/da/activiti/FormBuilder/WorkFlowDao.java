package com.da.activiti.FormBuilder;

import java.util.Map;

import com.da.activiti.dao.IBaseDao;
import com.da.activiti.model.WorkFlowBean;

public interface WorkFlowDao extends IBaseDao<WorkFlowBean> {

	String createWorkFlow(WorkFlowBean workFlowBean);

	void createWorkFlowMapping(Map<String, String[]> collect, String workflowId);
}
