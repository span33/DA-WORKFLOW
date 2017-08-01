package com.da.activiti.document;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.da.activiti.document.dao.ProcessDao;
import com.da.activiti.model.document.ProcessInfo;
import com.da.activiti.model.document.TaskInfo;
import com.google.common.collect.Lists;

/**
 \* @author Santosh Pandey
 *         Date: 5/18/14
 */
@Service("processService")
public class ProcessService  {
    private static final Logger LOG = LoggerFactory.getLogger(ProcessService.class);
   
    @Autowired protected ProcessDao processDao;
    @Transactional(readOnly = true)
    public List<Map<String, Object>> processesListByTraskMappingId(int mappingId) {
        return processDao.getProcessListByTaskMappingId(mappingId);
    }
    @Transactional(readOnly = true)
    public List<Map<String, Object>> taskListByProcessId(int processId) {
        return processDao.getTaskListByProcessId(processId);
    }
    
    @Transactional(readOnly = true)
    public List<TaskInfo> listTaskByProcessId(int processId) {
        return processDao.readTaskByProcessId(processId);
    }
    
	@Transactional(readOnly = true)
	public List<Map<String, Object>> allProcesses() {
		List<Map<String, Object>> processRows = processDao.getProcesList();
		processRows.forEach(index -> {
			if ((Integer) index.get("isleaf") == 0) {
				index.put("isleaf", false);
			}else if((Integer) index.get("isleaf") == 1) {
				index.put("isleaf", true);
			}
			if ((Integer) index.get("expanded") == 0) {
				index.put("expanded", false);
			}else if ((Integer) index.get("expanded") == 1) {
				index.put("expanded", true);
			}
			
		});

		return processRows;

	}
	
	@Transactional(readOnly = true)
	public List<Map<String, Object>> allSubProcessesByProcessId(int processId) {
		List<Map<String, Object>> processRows = processDao.getSubProcesListByProcessId(processId);
		processRows.forEach(index -> {
			if ((Integer) index.get("isleaf") == 0) {
				index.put("isleaf", false);
			}else if((Integer) index.get("isleaf") == 1) {
				index.put("isleaf", true);
			}
			if ((Integer) index.get("expanded") == 0) {
				index.put("expanded", false);
			}else if ((Integer) index.get("expanded") == 1) {
				index.put("expanded", true);
			}
			
		});

		return processRows;

	}
    
	
    @Transactional(readOnly = true)
    public List<ProcessInfo>  listAllProcesses() {
    	 List<ProcessInfo> processList = Lists.newArrayList();
         processList = this.processDao.readAll();
         return processList;
       
    }
    
    @Transactional(readOnly = true)
    public List<ProcessInfo>  listAllSubProcesses(int processId) {
    	 List<ProcessInfo> processList = Lists.newArrayList();
         processList = this.processDao.readAllSubprocess(processId);
         return processList;
       
    }
    
    @Transactional(readOnly = true)
    public List<Map<String, Object>> processTaskMappingList() {
        
        return processDao.getProcessTaskMappingList();
       
    }
    

    
    @Transactional(readOnly = true)
    public List<Map<String, Object>> taskList() {
        
        return processDao.getTaskList();
       
    }
    
    @Transactional(readOnly = true)
    public List<Map<String, Object>> taskListById(int id) {
        
        return processDao.getTaskListByProcessId(id);
       
    }
    
    @Transactional(readOnly = true)
    public List<Map<String, Object>> taskActorMappingList() {
        
        return processDao.getTaskActorMappingList();
       
    }
    
    @Transactional(readOnly = true)
    public List<Map<String, Object>> taskActorMappingListById(int id) {
        
        return processDao.getTaskActorMappingListById(id);
       
    }
    
    @Transactional
    public String createTask(TaskInfo taskInfo){
    	return processDao.create(taskInfo);
    }
   
    
    @Transactional
    public String createProcess(ProcessInfo processInfo){
    	return processDao.create(processInfo);
    }
    
    @Transactional
    public void editProcess(ProcessInfo processInfo){
    	 processDao.update(processInfo);
    }
   
    @Transactional
    public void deleteProcess(int  processId){
    	 processDao.delete(processId);
    }

    @Transactional(readOnly = true)
    public List<Map<String, Object>> departMentList() {
        
        return processDao.getDepartmentList();
       
    }
    
    @Transactional(readOnly = true)
    public List<Map<String, Object>> userListByDepatmentId(List <String> departmentList) {
        return processDao.getUserByDepartmentId(departmentList);
       
    }
   
}
