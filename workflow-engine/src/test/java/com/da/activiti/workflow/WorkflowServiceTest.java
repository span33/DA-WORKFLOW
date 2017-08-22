package com.da.activiti.workflow;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.io.File;
import java.io.InputStream;
import java.util.List;

import org.activiti.bpmn.BpmnAutoLayout;
import org.activiti.bpmn.model.BoundaryEvent;
import org.activiti.bpmn.model.BpmnModel;
import org.activiti.bpmn.model.EndEvent;
import org.activiti.bpmn.model.ErrorEventDefinition;
import org.activiti.bpmn.model.Process;
import org.activiti.bpmn.model.SequenceFlow;
import org.activiti.bpmn.model.StartEvent;
import org.activiti.bpmn.model.SubProcess;
import org.activiti.bpmn.model.UserTask;
import org.activiti.engine.HistoryService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.apache.commons.io.FileUtils;
import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.da.activiti.document.DocumentService;
import com.da.activiti.model.document.DocType;
import com.da.activiti.model.workflow.DynamicUserTask;
import com.da.activiti.model.workflow.DynamicUserTaskType;
import com.google.common.collect.Lists;

import junit.framework.Assert;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/testAppContext.xml"})
public class WorkflowServiceTest {
    private static final Logger LOG = LoggerFactory.getLogger(WorkflowServiceTest.class);

    @Autowired RuntimeService runtimeService;
    @Autowired TaskService taskService;
    @Autowired HistoryService historyService;
    @Autowired IdentityService identityService;
    @Autowired RepositoryService repositoryService;
    @Autowired DocumentService documentService;
    @Autowired @Qualifier("dataSource") javax.sql.DataSource datasource;
    @Autowired WorkflowService workflowService;

    @Before
    public void setUp() throws Exception {
    	
    
        List<ProcessDefinition> definitions = repositoryService.createProcessDefinitionQuery().list();
        for (ProcessDefinition definition : definitions) {
            LOG.debug("{} - {}", definition.getId(), definition.getKey());
        }

    }

    @After
    public void tearDown() throws Exception {
    }


    @Test
    @Ignore
    public void testGetProcessDefinitionDiagram() throws Exception {
        fail("not implemented");
    }

    @Test
    @Ignore

    public void testGetActiveDocumentDiagram() throws Exception {
        fail("not implemented");
    }

    @Test
    public void testGetAllProcDefs() {
        List<ProcessDefinition> definitions = this.workflowService.getAllProcDefs(false);
        assertTrue(definitions.size() == 5);

        definitions = this.workflowService.getAllProcDefs(true);
        assertTrue(definitions.size() == 5);

        for (ProcessDefinition definition : definitions) {
            LOG.debug(definition.getDescription());
        }

    }

    @Test
    public void testGroupWorkflowExists() throws Exception {
        String group = "engineering";
        boolean exists = this.workflowService.groupWorkflowExists(DocType.BOOK_REPORT.name(), group);
        assertTrue("BOOK_WORKFLOW_engineering should exist.", exists);

        group = "FOO_SDFSFSF_SDFSDF";
        exists = this.workflowService.groupWorkflowExists(DocType.BOOK_REPORT.name(), group);
        assertFalse("random group workflow should NOT exist.", exists);

    }


    @Test
    @Ignore
    public void testUpdateWorkflow() throws Exception {
        fail("not implemented");
    }

    @Test
    public void testBaseDocTypeWorkflowExists() throws Exception {
        boolean exists = this.workflowService.baseDocTypeWorkflowExists(DocType.BOOK_REPORT.name(),null);
        assertTrue("BOOK_REPORT base workflow should exist.", exists);

        exists = this.workflowService.baseDocTypeWorkflowExists(DocType.UNIT_TEST_NO_EXIST.name(),null);
        assertFalse("NO_EXIST docType base workflow should NOT exist.", exists);
    }

    @Test
    public void testFindProcDef() {
        ProcessDefinition pd = this.workflowService.findProcDef(DocType.BOOK_REPORT.name(), "engineering");
        LOG.debug("found {}", pd.getKey());
        assertNotNull("Should have engineering workflow for BOOK_REPORT", pd);

        ProcessDefinition pd1 = this.workflowService.findProcDef(DocType.BOOK_REPORT.name(), "foo");
        LOG.debug("found {}", pd1.getKey());
        assertNotNull("Should have base workflow for BOOK_REPORT", pd1);

        assertNotEquals("engineering and base should be different", pd.getId(), pd1.getId());

        ProcessDefinition pd2 = this.workflowService.findProcDef(DocType.UNIT_TEST_NO_EXIST.name(), "foo");
        assertNull(pd2);
    }

    @Test
    public void testFindBaseProcDef() {
        ProcessDefinition pd = this.workflowService.findBaseProcDef(DocType.BOOK_REPORT.name(),null);
        assertNotNull(pd);

        pd = this.workflowService.findBaseProcDef(DocType.UNIT_TEST_NO_EXIST.name(),null);
        assertNull(pd);
    }

    @Test
    public void testGetBaseDocTypes() {
        List<String> docTypes = this.workflowService.findExistingBaseDocTypes();
        assertTrue(docTypes.size() == 2);
        assertTrue(docTypes.contains(DocType.BOOK_REPORT));
        assertTrue(docTypes.contains(DocType.INVOICE));
    }
    
    @Test 
    public void testDynamicDeploy()  { 
    try{
     // 1. Build up the model from scratch 
     BpmnModel model = new BpmnModel(); 
     model.setTargetNamespace("da.com");
     Process process = new Process(); 
     model.addProcess(process); 
     process.setId("TEST33___NONE"); 
     

    
     
     process.addFlowElement(createStartEvent()); 
     UserTask submitTask = createUserTask("task1", "First task", "fred") ;
     process.addFlowElement(submitTask); 
     process.addFlowElement(createUserTask("task2", "Second task", "john")); 
     process.addFlowElement(createEndEvent()); 
    
     process.addFlowElement(createSequenceFlow("start", "task1")); 
     process.addFlowElement(createSequenceFlow("task1", "task2")); 
     process.addFlowElement(createSequenceFlow("task2", "end")); 
    
     
     ErrorEventDefinition errorDef =  new ErrorEventDefinition() ; 
     SubProcess sub = WorkflowBuilder.createDynamicSubProcess(DynamicTask("firstSubprocessTask", "firstSubprocessTask", null), new ErrorEventDefinition());
     process.addFlowElement(sub);

     process.addFlowElement(createSequenceFlow(submitTask.getId(), sub.getId()));

     BoundaryEvent boundaryEvent = new BoundaryEvent();
     boundaryEvent.setId(WFConstants.REJECTED_BOUNDARY_EVENT_ID);
     boundaryEvent.setName("Rejected Error Event");
     boundaryEvent.setAttachedToRef(sub);
     boundaryEvent.addEventDefinition(errorDef);
     process.addFlowElement(boundaryEvent);

     process.addFlowElement(WorkflowBuilder.createSequenceFlow(boundaryEvent.getId(), submitTask.getId(), "Rejected"));

     EndEvent endEvent = new EndEvent();
     endEvent.setId("Subend");

     process.addFlowElement(endEvent);
     process.addFlowElement(createSequenceFlow(sub.getId(), endEvent.getId()));

     //Generate graphical information
     new BpmnAutoLayout(model).execute();
     
  // 2. Generate graphical information 
     //new BpmnAutoLayout(model).execute(); 
    
     // 3. Deploy the process to the engine 
     Deployment deployment = repositoryService.createDeployment().addBpmnModel("dynamic-model.bpmn", model).name("Dynamic process deployment").deploy(); 
    
     // 4. Start a process instance 
     ProcessInstance processInstance = runtimeService.startProcessInstanceByKey("TEST33___NONE"); 
    
     // 5. Check if task is available 
     List<Task> tasks = taskService.createTaskQuery().processInstanceId(processInstance.getId()).list(); 
    
     Assert.assertEquals(1, tasks.size()); 
     Assert.assertEquals("First task", tasks.get(0).getName()); 
     Assert.assertEquals("fred", tasks.get(0).getAssignee()); 
    
     // 6. Save process diagram to a file 
     InputStream processDiagram = repositoryService.getProcessDiagram(processInstance.getProcessDefinitionId()); 
     FileUtils.copyInputStreamToFile(processDiagram, new File("target/diagram.png")); 
    
     // 7. Save resulting BPMN xml to a file 
     InputStream processBpmn = repositoryService.getResourceAsStream(deployment.getId(), "dynamic-model.bpmn"); 
     FileUtils.copyInputStreamToFile(processBpmn, new File("target/process.bpmn20.xml")); 
    }catch(Exception e) {
    	e.printStackTrace();
    }
    } 
    
    protected List<DynamicUserTask>  DynamicTask(String id, String name, String assignee) { 
    	 List<DynamicUserTask> dynamicUserTasks = Lists.newArrayList();
         DynamicUserTask dynamicUserTask = new DynamicUserTask();
         dynamicUserTask.getCandidateGroups().add("management");
         dynamicUserTask.setIndex(0);
         dynamicUserTask.setDynamicUserTaskType(DynamicUserTaskType.APPROVE_REJECT);
         dynamicUserTasks.add(dynamicUserTask);

         DynamicUserTask dynamicUserTask2 = new DynamicUserTask();
         dynamicUserTask2.getCandidateUsers().add("kermit");
         dynamicUserTask2.setDynamicUserTaskType(DynamicUserTaskType.COLLABORATION);
         dynamicUserTask2.setIndex(1);
         dynamicUserTasks.add(dynamicUserTask2);
         return dynamicUserTasks ;
       }
    
    protected UserTask createUserTask(String id, String name, String assignee) { 
     UserTask userTask = new UserTask(); 
     userTask.setName(name); 
     userTask.setId(id); 
     userTask.setAssignee(assignee); 
     return userTask; 
    } 
    
    protected SequenceFlow createSequenceFlow(String from, String to) { 
     SequenceFlow flow = new SequenceFlow(); 
     flow.setSourceRef(from); 
     flow.setTargetRef(to); 
     return flow; 
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
    
    @Test
    public void testDeleteWorkFlow() {
    	
    	workflowService.deleteWorkflow(DocType.BOOK_REPORT.name(), "Admin");
    	workflowService.deleteWorkflow(DocType.INVOICE.name(), "Admin");
    	
    }

    @Test
    @Ignore
    public void testFindProcessByBusinessKey() throws Exception {
        fail("not implemented");
    }

    /*public String getProcessDefXml(String key){
        ProcessDefinition defintion = this.repoSrvc.createProcessDefinitionQuery().processDefinitionKey(key).singleResult();
        if (defintion == null) {
            throw new IllegalArgumentException("Invalid process defintion key: " + key);
        }
        ProcessDefinitionEntity entity = (ProcessDefinitionEntity)defintion;
        return null;
    }*/

}
