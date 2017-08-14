package com.da.activiti.workflow;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.activiti.bpmn.BpmnAutoLayout;
import org.activiti.bpmn.model.BpmnModel;
import org.activiti.bpmn.model.EndEvent;
import org.activiti.bpmn.model.Process;
import org.activiti.bpmn.model.StartEvent;
import org.activiti.bpmn.model.UserTask;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.impl.RepositoryServiceImpl;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.activiti.image.impl.DefaultProcessDiagramGenerator;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import com.da.activiti.model.document.ProcessInfo;
import com.google.common.collect.Lists;

/**
 * Various methods to find process definitions by group and {@link com.da.activiti.model.document.DocType1}.
 * Be aware that all BPMN docs must have a namepsace equal to {@code da.com} or whatever is set in the
 * {@code WFConstants} class.
 *
 \* @author Santosh Pandey
 *         Date: 5/29/14
 */
@Service("workflowService")
public class WorkflowService {
    private static final Logger LOG = LoggerFactory.getLogger(WorkflowService.class);

    @Autowired protected RuntimeService runtimeService;
    @Autowired protected RepositoryService repoSrvc;
    @Autowired TaskService taskService;
    @Autowired ApplicationContext appContext;

    /**
     * @param processId the process <strong>Definition</strong> Id - NOT the process Instance Id.
     * @return png image of diagram - nothing highlighted since this is the process definition - not a specific instance.
     */
    public byte[] getProcessDefinitionDiagram(String processId) throws IOException {
        ProcessDefinition pd =
                this.repoSrvc.createProcessDefinitionQuery().processDefinitionKey(processId).latestVersion().singleResult();
        LOG.debug("Getting process diagram for processId: {}", pd.getId());
        BpmnModel bpmnModel = repoSrvc.getBpmnModel(pd.getId());
        new BpmnAutoLayout(bpmnModel).execute();
        InputStream in = new DefaultProcessDiagramGenerator().generatePngDiagram(bpmnModel);

        //InputStream in = new DefaultProcessDiagramGenerator().generatePngDiagram(model);
        byte[] bytes = IOUtils.toByteArray(in);
        IOUtils.closeQuietly(in);
        LOG.debug("Got bytes of size: {}", bytes.length);
        return bytes;
    }

    /**
     * @param docId The document id.
     * @return png image of diagram with current activity highlighted.
     */
    public byte[] getActiveDocumentDiagram(String docId) throws IOException {
        LOG.debug("getting active diagram for doc: {}", docId);
        //http://forums.activiti.org/content/process-diagram-highlighting-current-process
        ProcessInstance pi =
                runtimeService.createProcessInstanceQuery().processInstanceBusinessKey(docId).singleResult();

        RepositoryServiceImpl impl = (RepositoryServiceImpl) repoSrvc;
        ProcessDefinitionEntity pde = (ProcessDefinitionEntity) impl.getDeployedProcessDefinition(pi.getProcessDefinitionId());
        BpmnModel bpmnModel = repoSrvc.getBpmnModel(pde.getId());
        new BpmnAutoLayout(bpmnModel).execute();
        InputStream in = new DefaultProcessDiagramGenerator().generateDiagram(bpmnModel, "png", runtimeService.getActiveActivityIds(pi.getProcessInstanceId()));
//        InputStream in = this.appContext.getResource("classpath:800x200.png").getInputStream();
        byte[] bytes = IOUtils.toByteArray(in);
        IOUtils.closeQuietly(in);
        LOG.debug("Got bytes of size: " + bytes.length);
        return bytes;
    }

    /**
     * @param docType
     * @param group
     * @return true if the specific {@code DocType} and Group workflow exists, false if not
     * e.g. process Id of deployed definition would equal {@code BOOK_REPORT_engineering}
     */
    public boolean groupWorkflowExists(String docType, String group) {
        LOG.debug("Checking for workflow exists of doctype={} and group={}", docType, group);
        String processIdStr = WFConstants.createProcId(docType, group);
        return (this.repoSrvc.createProcessDefinitionQuery().processDefinitionCategory(WFConstants.NAMESPACE_CATEGORY).
                processDefinitionKey(processIdStr).latestVersion().singleResult()) != null;
    }

    /**
     *
     * @return the list (possibly empty) of DocTypes that have at least a base type (i.e. group = NONE) defined.
     */
    public List<String> findExistingBaseDocTypes() {
        List<String> docTypes = Lists.newArrayList();
        String likeQuery = String.format("%s%s", "%", WFConstants.PROCESS_GROUP_DIVIDER);
        LOG.debug("using likeQuery for baseTypes = {}", likeQuery);
                List < ProcessDefinition > processDefinitions = this.repoSrvc.createProcessDefinitionQuery().
                        processDefinitionCategory(WFConstants.NAMESPACE_CATEGORY).
                        latestVersion().
                        processDefinitionKeyLike(likeQuery).list();
        LOG.debug("Base type = {}", String.valueOf(docTypes));
        for (ProcessDefinition processDefinition : processDefinitions) {
            String[] parsed = this.parseProcessId(processDefinition.getKey());
            docTypes.add(parsed[0]);
         /*   DocType docType = null;
            try {
                docType = DocType.valueOf(parsed[0]);

            }
            catch(Exception e) {
                LOG.error("Invalid docType detected in workflow (ignoring): {}", parsed[0]);
            }
            if (docType != null){
                docTypes.add(docType);

            }*/
        }
        LOG.debug("Found baseDocTypes: {}", docTypes);
        return docTypes;
    }



    /**
     * @param docType
     * @return true if the base workflow for the {@code DocType} exists. Essentially, this is a process definition
     * with the {@code processId=DOC_TYPE_NONE} and the namespace set to default namespace
     * @see {@link com.da.activiti.workflow.WFConstants#NAMESPACE_CATEGORY}
     */
    public boolean baseDocTypeWorkflowExists(String docType ,String groupName) {
        LOG.debug("Checking for base workflow exists of doctype={}.", docType);
        if(StringUtils.isBlank(groupName)) {
        	groupName = WFConstants.WORKFLOW_GROUP_NONE ;
        }
        String processIdStr = WFConstants.createProcId(docType, groupName);
        LOG.info("search for base doc workflow using processId={}", processIdStr);
        return this.repoSrvc.createProcessDefinitionQuery().processDefinitionCategory(WFConstants.NAMESPACE_CATEGORY).
                processDefinitionKey(processIdStr).latestVersion().singleResult() != null;
    }

    /**
     * @param docType
     * @return latest process definition for the given doc type and group or null if none exits.
     */
    public ProcessDefinition findProcDefByDocTypeAndGroup(String docType, String group) {
        LOG.debug("Checking for workflow exists of doctype={} and group={}", docType, group);
        String processIdStr = WFConstants.createProcId(docType, group);
        ProcessDefinition pd = this.repoSrvc.createProcessDefinitionQuery().processDefinitionCategory(WFConstants.NAMESPACE_CATEGORY).
                processDefinitionKey(processIdStr).latestVersion().singleResult();
        return pd;
    }

    /**
     * @param docType
     * @return the base workflow for a given document type (i.e. the process id of the process is {@code DocType_NONE})
     * or null if no base document exists.
     */
    public ProcessDefinition findBaseProcDef(String docType,String groupName) {
        LOG.debug("Checking for base workflow exists of doctype={}", docType);
        String processIdStr = WFConstants.createProcId(docType, groupName);
        ProcessDefinition pd = this.repoSrvc.createProcessDefinitionQuery().processDefinitionCategory(WFConstants.NAMESPACE_CATEGORY).
                processDefinitionKey(processIdStr).latestVersion().singleResult();
        return pd;
    }

    /**
     * <p/>
     * This is a convenience method that will try for the most specific workflow (group and docType),
     * but will fall back to just general docType if no group workflow exists.
     *
     * @param docType
     * @return latest process definition for the given group and/or docType or null if neither (i.e. no group and also no docType) exits.
     */
    public ProcessDefinition findProcDef(String docType, String group ) {
        ProcessDefinition pd = this.findProcDefByDocTypeAndGroup(docType, group);
        if (pd == null) {
            LOG.debug("no group workflow exists of doctype={} and group={} -> checking for base wf.", docType, group);
            pd = this.findBaseProcDef(docType,group);
        }
        return pd;
    }

    /**
     * @param onlyLatestVersion retrieve only the latest version of each Process Definition
     * @return all process definitions in the Activiti workflow
     */
    //TODO this should be protected by admin only
    public List<ProcessDefinition> getAllProcDefs(boolean onlyLatestVersion) {
        LOG.debug("Lookign up all process definitions with latestVersion={}", onlyLatestVersion);
        ProcessDefinitionQuery query = repoSrvc.createProcessDefinitionQuery().processDefinitionCategory(WFConstants.NAMESPACE_CATEGORY);
        if (onlyLatestVersion) {
            query.latestVersion();
        }
        List<ProcessDefinition> definitions = query.list();
        LOG.debug("Found {} definitions.", definitions.size());
        return definitions;
    }

    public void updateWorkflow(BpmnModel model, String group) {
        String modelName = String.format("%s-doc-approve-model.bpmn", group);
        String deployName = String.format("Group %s Document Approve", group);

        LOG.info("updating doc approval for group: {}", group);
        Deployment deployment = this.repoSrvc.createDeployment()
                .addBpmnModel(modelName, model).name(deployName)
                .deploy();
    }

    /**
     * @param businessKey the document Id as returned from DAO classes
     * @return the associated ProcessInstance or null if one does not exist
     */
    public ProcessInstance findProcessInstanceByBusinessKey(String businessKey) {
        return runtimeService.createProcessInstanceQuery().processInstanceBusinessKey(businessKey).singleResult();
    }


    protected String[] parseProcessId(String processId) {
        if (!processId.contains(WFConstants.PROCESS_GROUP_DIVIDER)) {
            throw new IllegalArgumentException("Invalid processId (must be in form: <DocType>_<group|NONE> ");
        }
        int index = processId.lastIndexOf(WFConstants.PROCESS_GROUP_DIVIDER);

        String docType = processId.substring(0, index);
        String group = processId.substring(index + 1, processId.length());
        LOG.debug("{} - {}", docType, group);
        Assert.hasText(docType);
        Assert.hasText(group);
        return new String[]{docType, group};
    }
    /**
     * @param docType
     * @return returns the matching {@code ProcessDefinition} based on the namespace (i.e. category) which must
     * be a valid {@link com.da.activiti.model.document.DocType} or null if no definition exists.
     */
    /*public ProcessDefinition findDefinitionByDocType(DocType docType) {
        LOG.debug("searching for process definition for docType={}", docType);
        ProcessDefinition pd = repoSrvc.createProcessDefinitionQuery().processDefinitionCategory(docType).singleResult();
        return pd;

    }
    */
    /**
     * @param group - If no {@code Group} is passed, the default document approval workflow will be used.
     * @return a sorted list of approvals contained in the workflow associated with the given group
     */
    /*public List<UserTask> getDocApprovalsByGroup(String group) {
        String base = "FOO";//TODOWorkflow.PROCESS_ID_DOC_APPROVAL;
        String procId = StringUtils.isBlank(group) ? base : base + "-" + group;
        LOG.debug("building approval list for procDef: " + procId);
        ProcessDefinition pd =
                this.repoSrvc.createProcessDefinitionQuery().processDefinitionKey(procId).latestVersion().singleResult();
        BpmnModel model = this.repoSrvc.getBpmnModel(pd.getId());
        org.activiti.bpmn.model.Process process = model.getProcesses().get(0);

        SubProcess sub = (SubProcess) process.getFlowElement(Workflow.SUBPROCESS_ID_DYNAMIC);
        LOG.debug(sub.getName());
        Collection<FlowElement> flowElements = sub.getFlowElements();
        List<org.activiti.bpmn.model.UserTask> userTasks = Lists.newArrayList();
        for (FlowElement el : flowElements) {
            if (el.getClass().equals(org.activiti.bpmn.model.UserTask.class)) {
                userTasks.add((org.activiti.bpmn.model.UserTask) (el));
            }
        }

        List<UserTask> approvals = Lists.newArrayList();
        int i = 1;
        for (org.activiti.bpmn.model.UserTask userTask : userTasks) {
            approvals.add(fromUserTask(userTask, i));
            i++;
        }
        return approvals;
    }
*/
    protected UserTask createUserTask(String id, String name, String assignee) { 
        UserTask userTask = new UserTask(); 
        userTask.setName(name); 
        userTask.setId(id); 
        userTask.setAssignee(assignee); 
        return userTask; 
       } 
    
    public Process createProcess(String processName,List <ProcessInfo> subprocess) throws IOException {
    	 // 1. Build up the model from scratch
        BpmnModel model = new BpmnModel();
        Process process = new Process();
        model.addProcess(process);
        model.setTargetNamespace("da.com");
       // String deploymentId = processName+"___NONE";
        String deploymentId = processName+"___NONE";
        process.setId(deploymentId);

        process.addFlowElement(createStartEvent());
        
        process.addFlowElement(createUserTask("task1", "First task", "fred"));
        process.addFlowElement(createUserTask("task2", "Second task", "john"));
        process.addFlowElement(createEndEvent());

        process.addFlowElement(WorkflowBuilder.createSequenceFlow("start", "task1"));
        process.addFlowElement(WorkflowBuilder.createSequenceFlow("task1", "task2"));
        process.addFlowElement(WorkflowBuilder.createSequenceFlow("task2", "end"));

        // 2. Generate graphical information
        new BpmnAutoLayout(model).execute();

        // 3. Deploy the process to the engine
        Deployment deployment = this.repoSrvc.createDeployment()
                .addBpmnModel(deploymentId+"dynamic-model.bpmn", model).name("Dynamic process deployment")
                .deploy();


        ProcessDefinition processDefinition = this.repoSrvc.createProcessDefinitionQuery().
                processDefinitionKey(deploymentId).latestVersion().singleResult();

        ProcessInstance processInstance = runtimeService
                .startProcessInstanceByKey(deploymentId);
        
       

        // 5. Check if task is available
        List<Task> tasks = taskService.createTaskQuery()
                .processInstanceId(processInstance.getId()).list();


        // 6. Save process diagram to a file
        InputStream processDiagram = repoSrvc
                .getProcessDiagram(processInstance.getProcessDefinitionId());
        FileUtils.copyInputStreamToFile(processDiagram, new File("target/diagram.png"));
        // 7. Save resulting BPMN xml to a file
        InputStream processBpmn = repoSrvc
                .getResourceAsStream(deployment.getId(), deploymentId+"dynamic-model.bpmn");
        FileUtils.copyInputStreamToFile(processBpmn,
                new File("target/"+deploymentId+"process.bpmn20.xml"));
        
        return process;
     }
   
    
    
    /*public Process createProcess(String processName,List <ProcessInfo> subprocess) throws IOException {
   	 // 1. Build up the model from scratch
       BpmnModel model = new BpmnModel();
       Process process = new Process();
       model.addProcess(process);
       model.setTargetNamespace("da.com");
      // String deploymentId = processName+"___NONE";
       String deploymentId = processName+"___NONE";
       process.setId(deploymentId);

       process.addFlowElement(createStartEvent());
       process.addFlowElement(createUserTask("task1", "First task", "fred"));
       process.addFlowElement(createUserTask("task2", "Second task", "john"));
       process.addFlowElement(createEndEvent());

       process.addFlowElement(WorkflowBuilder.createSequenceFlow("start", "task1"));
       process.addFlowElement(WorkflowBuilder.createSequenceFlow("task1", "task2"));
       process.addFlowElement(WorkflowBuilder.createSequenceFlow("task2", "end"));

       // 2. Generate graphical information
       new BpmnAutoLayout(model).execute();

       // 3. Deploy the process to the engine
       Deployment deployment = this.repoSrvc.createDeployment()
               .addBpmnModel(deploymentId+"dynamic-model.bpmn", model).name("Dynamic process deployment")
               .deploy();


       ProcessDefinition processDefinition = this.repoSrvc.createProcessDefinitionQuery().
               processDefinitionKey(deploymentId).latestVersion().singleResult();

       ProcessInstance processInstance = runtimeService
               .startProcessInstanceByKey(deploymentId);
       
      

       // 5. Check if task is available
       List<Task> tasks = taskService.createTaskQuery()
               .processInstanceId(processInstance.getId()).list();


       // 6. Save process diagram to a file
       InputStream processDiagram = repoSrvc
               .getProcessDiagram(processInstance.getProcessDefinitionId());
       FileUtils.copyInputStreamToFile(processDiagram, new File("target/diagram.png"));
       // 7. Save resulting BPMN xml to a file
       InputStream processBpmn = repoSrvc
               .getResourceAsStream(deployment.getId(), deploymentId+"dynamic-model.bpmn");
       FileUtils.copyInputStreamToFile(processBpmn,
               new File("target/"+deploymentId+"process.bpmn20.xml"));
       
       return process;
    }
    */
    
    
    public String getProcesDefinationByProcessName(String processName ) {
    	
    	 ProcessDefinition pd =
                 this.repoSrvc.createProcessDefinitionQuery().processDefinitionKey(processName).latestVersion().singleResult();
    	
   return pd.getId();
    }
   protected StartEvent createStartEvent() { 
       StartEvent startEvent = new StartEvent(); 
       startEvent.setId("start"); 
       return startEvent; 
      } 
      
      protected EndEvent createEndEvent() { 
       EndEvent endEvent = new EndEvent(); 
       endEvent.setId("end"); 
       return endEvent; 
      } 
    public void deleteWroflow(String processName) {
    	 ProcessDefinition pd =
                 this.repoSrvc.createProcessDefinitionQuery().processDefinitionKey(processName).latestVersion().singleResult();
    	repoSrvc.deleteDeployment(pd.getDeploymentId(), true);
    
    }
}
