package com.da.activiti.document;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.activiti.engine.IdentityService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.identity.Group;
import org.activiti.engine.identity.User;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.Execution;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.da.activiti.FormBuilder.FormService;
import com.da.activiti.FormBuilder.WorkFlowDao;
import com.da.activiti.alert.AlertService;
import com.da.activiti.document.dao.BookReportDao;
import com.da.activiti.document.dao.InvoiceDao;
import com.da.activiti.document.dao.JournalDao;
import com.da.activiti.model.Alert;
import com.da.activiti.model.JournalDetail;
import com.da.activiti.model.WorkFlowBean;
import com.da.activiti.model.document.BookReport;
import com.da.activiti.model.document.DocState;
import com.da.activiti.model.document.DocType;
import com.da.activiti.model.document.Document;
import com.da.activiti.model.document.Invoice;
import com.da.activiti.user.InvalidAccessException;
import com.da.activiti.user.UserService;
import com.da.activiti.workflow.WorkflowService;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

/**
 \* @author Santosh Pandey
 *         Date: 5/18/14
 */
@Service("documentService")
public class DocumentService {
    private static final Logger LOG = LoggerFactory.getLogger(DocumentService.class);
    @Autowired protected IdentityService identityService;
    @Autowired protected RuntimeService runtimeService;
    @Autowired protected TaskService taskService;
    @Autowired protected UserService userService;
    @Autowired protected InvoiceDao invoiceDao;
    @Autowired protected BookReportDao bookReportDao;
    @Autowired protected JournalDao journalDao;
    @Autowired protected WorkflowService workflowService;
    @Autowired protected AlertService alertService;
    @Autowired protected WorkFlowDao workFlowDao ;
    @Autowired protected FormService formService ;

    @Transactional(readOnly = true)
    public List<Document> getGroupDocumentsByUser(String userId) {
        List<Document> docs = Lists.newArrayList();
        List<Group> groups = this.userService.getAssignmentGroups(userId);
        List<String> groupIds = Lists.newArrayList();
        for (Group group : groups) {
            groupIds.add(group.getId());
        }
        for (Document doc : this.invoiceDao.readAll()) {
            if (groupIds.contains(doc.getGroupId())) {
                docs.add(doc);
            }
        }
        for (Document doc : this.bookReportDao.readAll()) {
            if (groupIds.contains(doc.getGroupId())) {
                docs.add(doc);
            }
        }
        
        for (Document doc : this.journalDao.readAll()) {
            if (groupIds.contains(doc.getGroupId())) {
                docs.add(doc);
            }
        }
        Collections.sort(docs);
        return docs;
    }
    
    @Transactional(readOnly = true)
    public List<Document> getDocumentsByUser(String userId) {
        List<Document> docs = Lists.newArrayList();
        
        User user =  identityService.createUserQuery().memberOfGroup("Approver").userId(userId).singleResult() ;
        for (Document doc : this.journalDao.readAll()) {
            if (doc.getAuthor().equals(userId) || user!= null) {
                docs.add(doc);
            }
        }
        Collections.sort(docs);
        return docs;
    }

    @Transactional
    public String createDocument(Document document) {
        String id = document.getId();
       if (!("TEMP".equals(id) || StringUtils.isBlank(id))) {
        
            throw new IllegalArgumentException("Can't save new doc with id already set");
        }
        document.setId(null);
        String newId = null;
        if (DocType.BOOK_REPORT.equals(document.getDocType())) {
            newId = this.bookReportDao.create((BookReport) document);
        } else if (DocType.INVOICE.equals(document.getDocType())) {
            newId = this.invoiceDao.create((Invoice) document);
        }else if(DocType.JOURNAL.equals(document.getDocType()) ){
        	newId = this.journalDao.create((JournalDetail)document);
        }else {
            throw new IllegalArgumentException("Unknown doc type: " + document.getDocType());
        }
        return newId;
    }

    @Transactional
    public void submitToWorkflow(DocType DocType ,String workFlowId,int processUserFormId) {
        Document doc = this._getDocument(workFlowId);
        LOG.debug("beginning (or continuing) doc workflow for doc {}. ", doc.getId());
        UserDetails userDetails = this.userService.currentUser();
        
        
        if (!StringUtils.equals(userDetails.getUsername(), doc.getAuthor())) {
            throw new InvalidAccessException("Only the author of a doc can submit for approval");
        }

        try {
            identityService.setAuthenticatedUserId(userDetails.getUsername());
            DocType docType = doc.getDocType();
            String group = doc.getGroupId();

            ProcessDefinition procDef = this.workflowService.findProcDef(docType, group);
            if (procDef == null) {
                throw new IllegalArgumentException("No workflow exists for doctype=" + docType.name() + " and group=" + group);
            }

            ProcessInstance current = workflowService.findProcessInstanceByBusinessKey(workFlowId);
            if (current == null){
                current = runtimeService.startProcessInstanceByKey(procDef.getKey(), workFlowId);
            }

            List<Task> tasks = taskService.createTaskQuery().processInstanceId(current.getProcessInstanceId()).list(); //.singleResult();
           
            tasks.forEach(task -> {System.out.println(task.getAssignee());
            taskService.setAssignee(task.getId(), userDetails.getUsername());

            /*if (DocType.BOOK_REPORT.equals(doc.getDocType())) {
                this.bookReportDao.update((BookReport) doc);
            } else if (DocType.INVOICE.equals(doc.getDocType())) {
                this.invoiceDao.update((Invoice) doc);
            } else if (DocType.JOURNAL.equals(doc.getDocType())) {
                this.journalDao.update((JournalDetail) doc);
            }else {
                throw new IllegalArgumentException("Unknown doc type: " + doc.getDocType());
            }*/
            workFlowDao.update((WorkFlowBean)doc);
            taskService.setVariableLocal(task.getId(), "taskOutcome", task.getTaskDefinitionKey());
            Map<String, Object> processVariables = Maps.newHashMap();
            processVariables.put("initiator", doc.getAuthor());
            processVariables.put("businessKey", doc.getId());
            processVariables.put("docAuthor", doc.getAuthor());
            processVariables.put("docType", doc.getDocType());
            processVariables.put("processUserFormId", processUserFormId);
            processVariables.put("workFlowId",workFlowId);
            taskService.setVariables(task.getId(), processVariables);
            taskService.complete(task.getId());
            });
        }
        finally {

        	
        	identityService.setAuthenticatedUserId(null);
        }
    }
    
    @Transactional
    public void submitToWorkflow(DocType DocType ,String docId) {
        Document doc = this._getDocument(docId);
        LOG.debug("beginning (or continuing) doc workflow for doc {}. ", doc.getId());
        UserDetails userDetails = this.userService.currentUser();
        
        
        if (!StringUtils.equals(userDetails.getUsername(), doc.getAuthor())) {
            throw new InvalidAccessException("Only the author of a doc can submit for approval");
        }

        try {
            identityService.setAuthenticatedUserId(userDetails.getUsername());
            DocType docType = doc.getDocType();
            String group = doc.getGroupId();

            ProcessDefinition procDef = this.workflowService.findProcDef(docType, group);
            if (procDef == null) {
                throw new IllegalArgumentException("No workflow exists for doctype=" + docType.name() + " and group=" + group);
            }

            ProcessInstance current = workflowService.findProcessInstanceByBusinessKey(docId);
            if (current == null){
                current = runtimeService.startProcessInstanceByKey(procDef.getKey(), docId);
            }

            List<Task> tasks = taskService.createTaskQuery().processInstanceId(current.getProcessInstanceId()).list(); //.singleResult();
           
            tasks.forEach(task -> {System.out.println(task.getAssignee());
            taskService.setAssignee(task.getId(), userDetails.getUsername());

            /*if (DocType.BOOK_REPORT.equals(doc.getDocType())) {
                this.bookReportDao.update((BookReport) doc);
            } else if (DocType.INVOICE.equals(doc.getDocType())) {
                this.invoiceDao.update((Invoice) doc);
            } else if (DocType.JOURNAL.equals(doc.getDocType())) {
                this.journalDao.update((JournalDetail) doc);
            }else {
                throw new IllegalArgumentException("Unknown doc type: " + doc.getDocType());
            }*/
            workFlowDao.update((WorkFlowBean)doc);
            taskService.setVariableLocal(task.getId(), "taskOutcome", "Submitted");
            Map<String, Object> processVariables = Maps.newHashMap();
            processVariables.put("initiator", doc.getAuthor());
            processVariables.put("businessKey", doc.getId());
            processVariables.put("docAuthor", doc.getAuthor());
            processVariables.put("docType", doc.getDocType());
            taskService.setVariables(task.getId(), processVariables);
            taskService.complete(task.getId());
            });
        }
        finally {

        	
        	identityService.setAuthenticatedUserId(null);
        }
    }


    @Transactional
    public void updateDocument(Document document) {
        this._updateDocument(document);
    }
    
    @Transactional
    public void updateDocumentLocation(Document document) {
    	if (DocType.BOOK_REPORT.equals(document.getDocType())) {
            this.bookReportDao.update((BookReport) document);
        } else if (DocType.INVOICE.equals(document.getDocType())) {
            this.invoiceDao.update((Invoice) document);
        } else if (DocType.JOURNAL.equals(document.getDocType())) {
            this.journalDao.updateFileLocation((JournalDetail) document);
        }else {
            throw new IllegalArgumentException("Unknown doc type: " + document.getDocType());
        }
        this._updateDocument(document);
    }

    /**
     * Pseudo publish task (doesn't actually do anything except change the docState = PUBLISHED.
     *
     * @param execution
     */
    @Transactional
    public void publish(Execution execution) {
        String pId = execution.getProcessInstanceId();
        LOG.debug("doc being published - procId={}", pId);
        ProcessInstance pi = runtimeService.createProcessInstanceQuery().
                processInstanceId(execution.getProcessInstanceId()).singleResult();
        String docId = pi.getBusinessKey();
        Document doc = this._getDocument(docId);
        doc.setDocState(DocState.PUBLISHED);
        String message = String.format("%s entitled '%s' has been successfully published ", doc.getDocType().name(), doc.getTitle());
        this.alertService.sendAlert(doc.getAuthor(), Alert.SUCCESS, message);
        this._updateDocument(doc);
    }

    /**
     * Pseudo email task (doesn't actually do anything except change the docState = EMAILED.
     *
     * @param execution
     */
    @Transactional
    public void email(Execution execution) {
        String pId = execution.getProcessInstanceId();
        LOG.debug("doc being emailed - procId={}", pId);
        ProcessInstance pi = runtimeService.createProcessInstanceQuery().
                processInstanceId(execution.getProcessInstanceId()).singleResult();
        String docId = pi.getBusinessKey();
        Document doc = this._getDocument(docId);
        doc.setDocState(DocState.EMAILED);
        String message = String.format("%s entitled '%s' has been successfully emailed ", doc.getDocType().name(), doc.getTitle());
        this.alertService.sendAlert(doc.getAuthor(), Alert.SUCCESS, message);
        this._updateDocument(doc);
    }

    @Transactional(readOnly = true)
    public Document getDocument(DocType docType,String id) {
        return this._getDocument(id);
    }

    /**
     * We use a private method here to enable internal calls without messing with spring proxies.
     *
     * @param id
     * @return document with given id
     */
    private Document _getDocument(String id) {
    	Document document = workFlowDao.read(id);
    	/*Document document = null ;
    	if (DocType.BOOK_REPORT.equals(docType)) {
    		document = this.bookReportDao.read(id);
        } else if (DocType.INVOICE.equals(docType)) {
        	document = this.invoiceDao.read(id);
        }else if(DocType.JOURNAL.equals(docType) ){
        	document = this.journalDao.read(id);
        }else {
        	document = workFlowDao.read(id);
            
        }*/
        return document;
    }


    /**
     * We use a private method here to enable internal calls without messing with spring proxies.
     *
     * @param document
     */
    private void _updateDocument(Document document) {
       /* if (DocType.BOOK_REPORT.equals(document.getDocType())) {
            this.bookReportDao.update((BookReport) document);
        } else if (DocType.INVOICE.equals(document.getDocType())) {
            this.invoiceDao.update((Invoice) document);
        } else if (DocType.JOURNAL.equals(document.getDocType())) {
            this.journalDao.update((JournalDetail) document);
        }else {
            throw new IllegalArgumentException("Unknown doc type: " + document.getDocType());
        }*/
    	workFlowDao.update((WorkFlowBean)document);
    }
    
    
}
