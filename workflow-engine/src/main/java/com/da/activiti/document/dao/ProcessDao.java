package com.da.activiti.document.dao;

import java.util.List;
import java.util.Map;

import com.da.activiti.dao.IBaseDao;
import com.da.activiti.model.document.ProcessInfo;

public interface ProcessDao extends IBaseDao<ProcessInfo> {
	
	List<Map<String,Object>> getProcesList();
	
	List<Map<String, Object>> getProcessTaskMappingList() ;
	
	List<Map<String, Object>> getProcessTaskMappingListByTaskId(int taskid) ;
	
	List<Map<String, Object>> getProcessListByTaskMappingId(int taskMappingId) ;
	
	List<Map<String, Object>> getTaskListById(int id) ;
	
	List<Map<String, Object>> getTaskList() ;
	
	List<Map<String, Object>> getTaskActorMappingListById(int id) ;
	
	List<Map<String, Object>> getTaskActorMappingList() ;

}
