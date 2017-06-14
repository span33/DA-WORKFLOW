package com.da.activiti.document;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.da.activiti.document.dao.ProcessDao;
import com.da.activiti.model.document.Document;
import com.da.activiti.model.document.ProcessInfo;
import com.google.common.collect.Lists;

/**
 \* @author Santosh Pandey
 *         Date: 5/18/14
 */
@Service("processService")
public class ProcessService {
    private static final Logger LOG = LoggerFactory.getLogger(ProcessService.class);
   
    @Autowired protected ProcessDao processDao;
    @Transactional(readOnly = true)
    public List<Map<String, Object>> processesListByTraskMappingId(int mappingId) {
        return processDao.getProcessListByTaskMappingId(mappingId);
    }
    @Transactional(readOnly = true)
    public List<Map<String, Object>> processesTraskMappingListByTaskId(int mappingId) {
        return processDao.getProcessTaskMappingListByTaskId(mappingId);
    }
    
    @Transactional(readOnly = true)
    public List<Map<String, Object>> allProcesses() {
        
        return processDao.getProcesList();
       
    }
    
    @Transactional(readOnly = true)
    public List<ProcessInfo>  listAllProcesses() {
        
    	 List<ProcessInfo> processList = Lists.newArrayList();
         processList = this.processDao.readAll();
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
        
        return processDao.getTaskListById(id);
       
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
    public String createProcess(ProcessInfo processInfo){
    	return processDao.create(processInfo);
    }
   

   
}
