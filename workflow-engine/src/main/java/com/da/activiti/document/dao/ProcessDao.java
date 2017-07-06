package com.da.activiti.document.dao;

import java.util.List;
import java.util.Map;

import com.da.activiti.dao.IBaseDao;
import com.da.activiti.model.document.ProcessInfo;
import com.da.activiti.model.document.TaskInfo;

public interface ProcessDao extends IBaseDao<ProcessInfo> {
	
	List<Map<String,Object>> getProcesList();
	
	List<Map<String, Object>> getProcessTaskMappingList() ;
	
	List<Map<String, Object>> getTaskByProcessId(String processId) ;
	
	List<Map<String, Object>> getProcessListByTaskMappingId(int taskMappingId) ;
	
	List<Map<String, Object>> getTaskListByProcessId(int id) ;
	
	List<Map<String, Object>> getTaskList() ;
	
	List<Map<String, Object>> getTaskActorMappingListById(int id) ;
	
	List<Map<String, Object>> getTaskActorMappingList() ;
	
	List<Map<String, Object>> getSubProcesListByProcessId(int processId) ;

	String create(TaskInfo obj) ;
	
	List<TaskInfo> readTaskByProcessId(int id) ;
	
	List<ProcessInfo> readAllSubprocess(int processId);
}
