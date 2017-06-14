package com.da.activiti.document.dao;

import java.util.List;
import java.util.Map;

import com.da.activiti.dao.IBaseDao;
import com.da.activiti.model.document.ProcessInfo;

public interface TaskDao extends IBaseDao<ProcessInfo> {
	
	List<Map<String,Object>> getProcesList();
	
	List<Map<String, Object>> getTaskMappingList() ;

}
