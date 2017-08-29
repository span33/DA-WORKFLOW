package com.da.activiti.workflow;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import org.activiti.bpmn.BpmnAutoLayout;
import org.activiti.bpmn.model.ActivitiListener;
import org.activiti.bpmn.model.BoundaryEvent;
import org.activiti.bpmn.model.BpmnModel;
import org.activiti.bpmn.model.EndEvent;
import org.activiti.bpmn.model.ErrorEventDefinition;
import org.activiti.bpmn.model.EventDefinition;
import org.activiti.bpmn.model.ExclusiveGateway;
import org.activiti.bpmn.model.FlowElement;
import org.activiti.bpmn.model.ImplementationType;
import org.activiti.bpmn.model.Process;
import org.activiti.bpmn.model.SequenceFlow;
import org.activiti.bpmn.model.StartEvent;
import org.activiti.bpmn.model.SubProcess;
import org.activiti.bpmn.model.UserTask;
import org.activiti.engine.IdentityService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.identity.Group;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.da.activiti.model.document.ProcessInfo;
import com.da.activiti.model.document.TaskInfo;
import com.da.activiti.model.workflow.DynamicUserTask;
import com.da.activiti.model.workflow.DynamicUserTaskType;
import com.google.common.collect.Lists;

/**
 * Used to build and modify workflows for modification of of subprocess dynamic
 * tasks
 *
 * \* @author Santosh Pandey Date: 5/29/14
 */
@Service("workflowBuilder")
public class WorkflowBuilder {
	private static final Logger LOG = LoggerFactory.getLogger(WorkflowBuilder.class);

	@Autowired
	RepositoryService repoSrvc;
	@Autowired
	WorkflowService workflowService;
	@Autowired IdentityService identityService ;

	@Transactional
	public Process createProcess(ProcessInfo processinfo, List<ProcessInfo> listOFSubprocess) throws IOException {
		// 1. Build up the model from scratch
		BpmnModel model = new BpmnModel();
		Process process = new Process();
		model.addProcess(process);
		model.setTargetNamespace(WFConstants.NAMESPACE_CATEGORY);
		// String deploymentId = processName+"___NONE";
		String deploymentId = WFConstants.createProcId(processinfo.getDocType(), processinfo.getGroupId());
		// String deploymentId = processName + "___NONE";
		process.setId(deploymentId);
		process.setName(deploymentId);
		StartEvent startEvent = workflowService.createStartEvent();
		process.addFlowElement(startEvent);
		SubProcess prevsub = null;
		SubProcess nextsub = null;

		// ParallelGateway parallelGateway = new ParallelGateway();
		for (ProcessInfo subprocess : listOFSubprocess) {

			ErrorEventDefinition errorDef = new ErrorEventDefinition();
			errorDef.setErrorCode(WFConstants.ERROR_DOC_REJECTED + subprocess.getProcessName());
			List<DynamicUserTask> dynamicUserTasks = new ArrayList<>();
			for (int counter = 0; counter < subprocess.getTaskList().size(); counter++) {

				dynamicUserTasks.add(DynmicUserTask(subprocess.getTaskList().get(counter), counter));
			}
			
			/*UserTask submitTask = new UserTask();
			submitTask.setId("submitDocUserTask");
			submitTask.setName("Submit doc to Workflow");
			process.addFlowElement(submitTask);
			process.addFlowElement(createSequenceFlow(startEvent.getId(), submitTask.getId()));*/

			if (prevsub == null) {
				prevsub = createDynamicSubProcess(dynamicUserTasks, errorDef, subprocess.getProcessName().replaceAll(" ", ""));
				process.addFlowElement(prevsub);
				process.addFlowElement(createSequenceFlow(startEvent.getId(), prevsub.getId()));
				//process.addFlowElement(WorkflowBuilder.createSequenceFlow(startEvent.getId(), prevsub.getId()));

				BoundaryEvent boundaryEvent = new BoundaryEvent();
				boundaryEvent.setId(WFConstants.REJECTED_BOUNDARY_EVENT_ID);
				boundaryEvent.setName("Rejected Error Event");
				boundaryEvent.setAttachedToRef(prevsub);
				boundaryEvent.addEventDefinition(errorDef);
				process.addFlowElement(boundaryEvent);
				process.addFlowElement(createSequenceFlow(boundaryEvent.getId(), startEvent.getId(), "Rejected"));
				//
				nextsub = prevsub;
			} else {
				nextsub = createDynamicSubProcess(dynamicUserTasks, errorDef, subprocess.getProcessName().replaceAll(" ", ""));
				process.addFlowElement(nextsub);
				process.addFlowElement(createSequenceFlow(prevsub.getId(), nextsub.getId()));
				//process.addFlowElement(WorkflowBuilder.createSequenceFlow(prevsub.getId(), nextsub.getId()));
			}

		}

		process.addFlowElement(workflowService.createEndEvent());
		process.addFlowElement(WorkflowBuilder.createSequenceFlow(nextsub.getId(), "end"));
		// 2. Generate graphical information
		new BpmnAutoLayout(model).execute();
		// 3. Deploy the process to the engine
		Deployment deployment = this.repoSrvc.createDeployment()
				.addBpmnModel(deploymentId + "dynamic-model.bpmn", model).name("Dynamic process deployment").deploy();
		ProcessDefinition processDefinition = this.repoSrvc.createProcessDefinitionQuery()
				.processDefinitionKey(deploymentId).latestVersion().singleResult();
		/*ProcessInstance processInstance =
				 workflowService.runtimeService.startProcessInstanceByKey(deploymentId);*/
		/*
		 * ProcessInstance processInstance =
		 * workflowService.runtimeService.startProcessInstanceByKey(deploymentId
		 * ); // 5. Check if task is available List<Task> tasks =
		 * workflowService.taskService.createTaskQuery().processInstanceId(
		 * processInstance.getId()) .list(); // 6. Save process diagram to a
		 * file InputStream processDiagram =
		 * repoSrvc.getProcessDiagram(processInstance.getProcessDefinitionId());
		 * FileUtils.copyInputStreamToFile(processDiagram, new
		 * File("target/diagram.png")); // 7. Save resulting BPMN xml to a file
		 */ InputStream processBpmn = repoSrvc.getResourceAsStream(deployment.getId(),
				deploymentId + "dynamic-model.bpmn");
		FileUtils.copyInputStreamToFile(processBpmn, new File("target/" + deploymentId + "process.bpmn20.xml"));
		return process;
	}

	protected static SequenceFlow approvalTask(SubProcess sub, EndEvent errorEnd, DynamicUserTask from, int currentIdx,
			int total, SequenceFlow prev) {
		UserTask current = new UserTask();
		current.setId(String.format("%s_%d%s", WFConstants.TASK_ID_DOC_APPROVAL, currentIdx, sub.getId()));
		current.setName(String.format("Approval (%d / %d /%s)", currentIdx, total, sub.getId()));
		/*
		 * if (StringUtils.isBlank(from.getName())) {
		 * current.setName(String.format("Approve Document (%d / %d)",
		 * currentIdx, total)); } else { current.setName(from.getName()); }
		 */

		ActivitiListener onCreateApproval = new ActivitiListener();
		onCreateApproval.setImplementationType(ImplementationType.IMPLEMENTATION_TYPE_EXPRESSION);
		onCreateApproval.setImplementation("${docWorkflowListener.onCreateApproval(execution, task)}");
		onCreateApproval.setEvent("create");
		current.setTaskListeners(Lists.newArrayList(onCreateApproval));

		if (from.getCandidateGroups().isEmpty() && from.getCandidateUsers().isEmpty()) {
			throw new IllegalArgumentException("user task does not have any candidate users / groups assigned");
			/*
			 * ActivitiListener taskListener = new ActivitiListener();
			 * taskListener.setImplementationType(ImplementationType.
			 * IMPLEMENTATION_TYPE_EXPRESSION); taskListener.setImplementation(
			 * "${docWorkflowListener.setAssignee(execution, task)}");
			 * taskListener.setEvent("create");
			 * userTask.setTaskListeners(Lists.newArrayList(taskListener));
			 */
		}
		current.setCandidateGroups(from.getCandidateGroups());
		current.setCandidateUsers(from.getCandidateUsers());
		current.setAssignee(from.getCandidateUsers().get(0));
		current.setOwner(from.getCandidateUsers().get(0));

		ExclusiveGateway gw = new ExclusiveGateway();
		gw.setId(String.format("exclusivegateway_approval_%d_of_%d_of_%s", currentIdx, total, sub.getId()));
		gw.setName(String.format("Exclusive Approval Gateway %d of %d of %s", currentIdx, total, sub.getId()));
		sub.addFlowElement(gw);
		sub.addFlowElement(createSequenceFlow(current.getId(), gw.getId()));

		// -------------------------------------------------------------
		SequenceFlow rejectedFlow = new SequenceFlow();
		rejectedFlow.setId(String.format("docRejectedSubFlow_%d_of_%d_of_%s", currentIdx, total, sub.getId()));
		rejectedFlow.setName(String.format("Doc Rejected %d of %d of %s", currentIdx, total, sub.getId()));
		rejectedFlow.setSourceRef(gw.getId());
		rejectedFlow.setTargetRef(errorEnd.getId());

		ActivitiListener rejectedListener = new ActivitiListener();
		rejectedListener.setImplementationType(ImplementationType.IMPLEMENTATION_TYPE_EXPRESSION);
		rejectedListener.setImplementation("${docWorkflowListener.onRejected(execution)}");
		rejectedListener.setEvent("take");
		rejectedFlow.setExecutionListeners(Lists.newArrayList(rejectedListener));
		rejectedFlow.setConditionExpression("${approved == false}");
		sub.addFlowElement(rejectedFlow);

		// -----------------------------------------------
		SequenceFlow approvedFlow = new SequenceFlow();
		approvedFlow.setId(String.format("docApprovedSubFlow_%d_of_%d_%s", currentIdx, total, sub.getId()));
		approvedFlow.setName(String.format("Doc Approved %d of %d of %s", currentIdx, total, sub.getId()));
		approvedFlow.setSourceRef(gw.getId());

		ActivitiListener approvedListener = new ActivitiListener();
		approvedListener.setImplementationType(ImplementationType.IMPLEMENTATION_TYPE_EXPRESSION);
		approvedListener.setImplementation("${docWorkflowListener.onApproved(execution)}");
		approvedListener.setEvent("take");
		approvedFlow.setExecutionListeners(Lists.newArrayList(approvedListener));
		approvedFlow.setConditionExpression("${approved == true}");
		sub.addFlowElement(approvedFlow);

		sub.addFlowElement(current);
		prev.setTargetRef(current.getId());
		return approvedFlow;
	}

	protected static SequenceFlow collaborationTask(SubProcess subProcess, DynamicUserTask from, int currentIdx,
			int total, SequenceFlow prev) {
		UserTask current = new UserTask();
		current.setId(String.format("%s_%d", WFConstants.TASK_ID_DOC_COLLABORATE, currentIdx));
		current.setName(String.format("Collaboration (%d / %d)", currentIdx, total));
		/*
		 * if (StringUtils.isBlank(from.getName())) {
		 * current.setName(String.format("Document Collaboration (%d / %d)",
		 * currentIdx, total)); } else { current.setName(from.getName()); }
		 */

		if (from.getCandidateGroups().isEmpty() && from.getCandidateUsers().isEmpty()) {
			throw new IllegalArgumentException("user task does not have any candidate users / groups assigned");
			/*
			 * ActivitiListener taskListener = new ActivitiListener();
			 * taskListener.setImplementationType(ImplementationType.
			 * IMPLEMENTATION_TYPE_EXPRESSION); taskListener.setImplementation(
			 * "${docWorkflowListener.setAssignee(execution, task)}");
			 * taskListener.setEvent("create");
			 * userTask.setTaskListeners(Lists.newArrayList(taskListener));
			 */
		}
		current.setCandidateGroups(from.getCandidateGroups());
		current.setCandidateUsers(from.getCandidateUsers());
		current.setAssignee(from.getCandidateUsers().get(0));
		current.setOwner(from.getCandidateUsers().get(0));

		ActivitiListener onCreate = new ActivitiListener();
		onCreate.setImplementationType(ImplementationType.IMPLEMENTATION_TYPE_EXPRESSION);
		onCreate.setImplementation("${docWorkflowListener.onCreateCollaborate(execution, task)}");
		onCreate.setEvent("create");

		ActivitiListener onComplete = new ActivitiListener();
		onComplete.setImplementationType(ImplementationType.IMPLEMENTATION_TYPE_EXPRESSION);
		onComplete.setImplementation("${docWorkflowListener.onCompleteCollaborate(execution, task)}");
		onComplete.setEvent("complete");

		current.setTaskListeners(Lists.newArrayList(onCreate, onComplete));
		subProcess.addFlowElement(current);
		prev.setTargetRef(current.getId());

		SequenceFlow ref = new SequenceFlow();
		ref.setId(String.format("dynamic_collab_subflow_%d_%d", currentIdx, total));
		ref.setName(String.format("Collaboration SubFlow %d of %d", currentIdx, total));
		ref.setSourceRef(current.getId());

		subProcess.addFlowElement(ref);

		return ref;
	}

	protected static SequenceFlow genricTask(SubProcess subProcess, DynamicUserTask from, int currentIdx, int total,
			SequenceFlow prev) {
		UserTask current = new UserTask();
		current.setId(String.format("%s_%d", WFConstants.TASK_ID_DOC_GENRIC_TASK + subProcess.getId(), currentIdx));
		current.setName(String.format(from.getName() + "(%d / %d / %s )", currentIdx, total, subProcess.getId()));
		/*
		 * if (StringUtils.isBlank(from.getName())) {
		 * current.setName(String.format("Document Collaboration (%d / %d)",
		 * currentIdx, total)); } else { current.setName(from.getName()); }
		 */

		if (from.getCandidateGroups().isEmpty() && from.getCandidateUsers().isEmpty()) {
			throw new IllegalArgumentException("user task does not have any candidate users / groups assigned");
			/*
			 * ActivitiListener taskListener = new ActivitiListener();
			 * taskListener.setImplementationType(ImplementationType.
			 * IMPLEMENTATION_TYPE_EXPRESSION); taskListener.setImplementation(
			 * "${docWorkflowListener.setAssignee(execution, task)}");
			 * taskListener.setEvent("create");
			 * userTask.setTaskListeners(Lists.newArrayList(taskListener));
			 */
		}
		current.setCandidateGroups(from.getCandidateGroups());
		current.setCandidateUsers(from.getCandidateUsers());
		current.setAssignee(from.getCandidateUsers().get(0));
		current.setOwner(from.getCandidateUsers().get(0));

		ActivitiListener onCreate = new ActivitiListener();
		onCreate.setImplementationType(ImplementationType.IMPLEMENTATION_TYPE_EXPRESSION);
		onCreate.setImplementation("${docWorkflowListener.onCreateGenricTask(execution, task)}");
		onCreate.setEvent("create");

		ActivitiListener onComplete = new ActivitiListener();
		onComplete.setImplementationType(ImplementationType.IMPLEMENTATION_TYPE_EXPRESSION);
		onComplete.setImplementation("${docWorkflowListener.onCompleteGenricTask(execution, task)}");
		onComplete.setEvent("complete");

		current.setTaskListeners(Lists.newArrayList(onCreate, onComplete));
		subProcess.addFlowElement(current);
		prev.setTargetRef(current.getId());

		SequenceFlow ref = new SequenceFlow();
		ref.setId(String.format("dynamic_collab_subflow_%d_%d_%s", currentIdx, total, subProcess.getId()));
		ref.setName(String.format("Collaboration SubFlow %d of %d of %s", currentIdx, total, subProcess.getId()));
		ref.setSourceRef(current.getId());

		subProcess.addFlowElement(ref);

		return ref;
	}

	protected static SequenceFlow createSequenceFlow(String from, String to) {

		SequenceFlow flow = new SequenceFlow();
		flow.setSourceRef(from);
		flow.setTargetRef(to);
		return flow;
	}

	protected static SequenceFlow createSequenceFlow(String from, String to, String name) {
		SequenceFlow flow = new SequenceFlow();
		flow.setSourceRef(from);
		flow.setTargetRef(to);
		flow.setName(name);
		return flow;
	}

	/**
	 * @param dynamicUserTasks
	 * @param docType
	 * @param group
	 * @return fully populated BpmnModel with with appropriate dynamic
	 *         subprocesses. This doesn't actually deploy anything.
	 */
	public BpmnModel buildModel(List<DynamicUserTask> dynamicUserTasks, String docType, String group) {
		Assert.notNull(docType);
		Assert.hasText(group);
		BpmnModel model = new BpmnModel();
		model.setTargetNamespace(WFConstants.NAMESPACE_CATEGORY);
		Process process = new Process();
		process.setId(String.format("%s_%s", docType, group));
		process.setName(String.format("Generated workflow for DocType=%s and Group=%s", docType, group));

		model.addProcess(process);

		StartEvent startEvent = new StartEvent();
		startEvent.setId("start");
		process.addFlowElement(startEvent);

		UserTask submitTask = new UserTask();
		submitTask.setId("submitDocUserTask");
		submitTask.setName("Submit doc to Workflow");
		process.addFlowElement(submitTask);
		process.addFlowElement(createSequenceFlow(startEvent.getId(), submitTask.getId()));

		ErrorEventDefinition errorDef = new ErrorEventDefinition();
		errorDef.setErrorCode(WFConstants.ERROR_DOC_REJECTED);

		SubProcess sub = createDynamicSubProcess(dynamicUserTasks, errorDef);
		process.addFlowElement(sub);
		process.addFlowElement(createSequenceFlow(submitTask.getId(), sub.getId()));

		BoundaryEvent boundaryEvent = new BoundaryEvent();
		boundaryEvent.setId(WFConstants.REJECTED_BOUNDARY_EVENT_ID);
		boundaryEvent.setName("Rejected Error Event");
		boundaryEvent.setAttachedToRef(sub);
		boundaryEvent.addEventDefinition(errorDef);
		process.addFlowElement(boundaryEvent);
		process.addFlowElement(createSequenceFlow(boundaryEvent.getId(), submitTask.getId(), "Rejected"));
		EndEvent endEvent = new EndEvent();
		endEvent.setId("end");

		process.addFlowElement(endEvent);
		process.addFlowElement(createSequenceFlow(sub.getId(), endEvent.getId()));

		// Generate graphical information
		new BpmnAutoLayout(model).execute();
		return model;
	}

	/**
	 * @param dynamicUserTasks
	 * @param docType
	 * @param group
	 * @return fully populated BpmnModel with with appropriate dynamic
	 *         subprocesses. This doesn't actually deploy anything.
	 */
	public BpmnModel buildModel(List<DynamicUserTask> dynamicUserTasks, String docType, String group,
			String processName, BpmnModel model) {
		Assert.notNull(docType);
		Assert.hasText(group);
		// BpmnModel model = new BpmnModel();
		model.setTargetNamespace(WFConstants.NAMESPACE_CATEGORY);
		Process process = new Process();
		process.setId(String.format("%s_%s", docType, group));
		// process.setName(String.format("Generated workflow for DocType=%s and
		// Group=%s", docType, group));

		process.setName(processName);
		model.addProcess(process);

		StartEvent startEvent = new StartEvent();
		startEvent.setId("start");
		process.addFlowElement(startEvent);

		UserTask submitTask = new UserTask();
		submitTask.setId("submitDocUserTask");
		submitTask.setName("Submit doc to Workflow");
		process.addFlowElement(submitTask);
		process.addFlowElement(createSequenceFlow(startEvent.getId(), submitTask.getId()));

		ErrorEventDefinition errorDef = new ErrorEventDefinition();
		errorDef.setErrorCode(WFConstants.ERROR_DOC_REJECTED);

		SubProcess sub = createDynamicSubProcess(dynamicUserTasks, errorDef);
		process.addFlowElement(sub);
		process.addFlowElement(createSequenceFlow(submitTask.getId(), sub.getId()));

		BoundaryEvent boundaryEvent = new BoundaryEvent();
		boundaryEvent.setId(WFConstants.REJECTED_BOUNDARY_EVENT_ID);
		boundaryEvent.setName("Rejected Error Event");
		boundaryEvent.setAttachedToRef(sub);
		boundaryEvent.addEventDefinition(errorDef);
		process.addFlowElement(boundaryEvent);

		process.addFlowElement(createSequenceFlow(boundaryEvent.getId(), submitTask.getId(), "Rejected"));

		EndEvent endEvent = new EndEvent();
		endEvent.setId("end");

		process.addFlowElement(endEvent);
		process.addFlowElement(createSequenceFlow(sub.getId(), endEvent.getId()));

		// Generate graphical information
		new BpmnAutoLayout(model).execute();
		return model;
	}

	/**
	 * @param docType
	 * @param group
	 * @return a newly created process definition cloned from the base
	 *         {@link com.da.activiti.model.document.DocType1}. The process
	 *         definition should be deployed to the repo with diagramming also
	 *         created. An {@code IllegalStateException} is thrown if the group
	 *         workflow already exits.
	 */
	public ProcessDefinition createGroupWorkflow(String docType, String group) {
		LOG.info("Creating new workflow for docType {} and group: {}", docType, group);
		String key = WFConstants.createProcId(docType, group);

		// make sure the DocType is valid
		if (!this.workflowService.baseDocTypeWorkflowExists(docType, group)) {
			throw new IllegalStateException("The docType: " + docType + " has no base workflow definition.");
		}

		// make sure one doesn't already exist.
		if (workflowService.groupWorkflowExists(docType, group)) {
			throw new IllegalStateException(
					"The workflow for docType: " + docType + " and group: " + group + " already exists");
		}

		ProcessDefinition baseProcDef = this.workflowService.findBaseProcDef(docType, group);

		BpmnModel base = this.repoSrvc.getBpmnModel(baseProcDef.getId());
		Process proc = base.getMainProcess();

		BpmnModel clone = new BpmnModel();
		clone.setTargetNamespace(WFConstants.NAMESPACE_CATEGORY);
		proc.setId(key);
		proc.setName(String.format("%s for group %s", docType, group));
		clone.addProcess(proc);

		// create the diagramming
		new BpmnAutoLayout(clone).execute();

		String deployId = this.repoSrvc.createDeployment().addBpmnModel(key + ".bpmn", clone)
				.name("Dynamic Process Deployment - " + key).deploy().getId();

		ProcessDefinition procDef = workflowService.findProcDefByDocTypeAndGroup(docType, group);
		Assert.notNull(procDef, "something went wrong creating the new processDefinition: " + key);
		return procDef;
	}

	/**
	 * @param procDef
	 * @return a list of ordered {@code DynamicUserTask} found within the
	 *         {@code Dynamic Subprocess}
	 */
	public List<DynamicUserTask> getDynamicTasks(ProcessDefinition procDef) {
		Assert.notNull(procDef, "ProcessDefinition cannot be null");
		LOG.debug("returning dynamic tasks for procDef: {}", procDef.getKey());

		BpmnModel model = repoSrvc.getBpmnModel(procDef.getId());
		Process process = model.getMainProcess();

		SubProcess sub = (SubProcess) process.getFlowElement(WFConstants.SUBPROCESS_ID_DYNAMIC);
		List<DynamicUserTask> tasks = Lists.newArrayList();
		if (sub != null) {
			LOG.trace(sub.getName());

			Collection<FlowElement> flowElements = sub.getFlowElements();
			int i = 0;
			for (FlowElement el : flowElements) {
				String id = el.getId();
				if (isDynamicUserTask(id)) {
					UserTask userTask = (UserTask) el;
					DynamicUserTask dut = fromUserTask(userTask, i);
					LOG.debug("Adding task: {} at index: {}", id, i);
					tasks.add(dut);
					i++;
				}
			}
			// this may not be needed, though it's dependent upon Activiti's
			// internal API
			Collections.sort(tasks);
		}

		return tasks;
	}

	/**
	 * @param docType
	 * @param group
	 * @param tasks
	 * @return the newly created ProcessDefinition of the replaced workflow for
	 *         the given {@code docType} and group.
	 */
	public ProcessDefinition updateDynamicTasks(String docType, String group, List<DynamicUserTask> tasks) {
		LOG.info("updating tasks for DocType {} and group: {}", docType, group);
		String key = WFConstants.createProcId(docType, group);

		// make sure one doesn't already exist.
		/*
		 * if (!workflowService.groupWorkflowExists(docType, group)) { throw new
		 * IllegalStateException( "The workflow for docType: " + docType +
		 * " and group: " + group + " does not exist"); }
		 */

		// ProcessDefinition procDef =
		// workflowService.findProcDefByDocTypeAndGroup(docType, group);
		ProcessDefinition procDef = workflowService.findBaseProcDef(docType, group);

		BpmnModel model = this.repoSrvc.getBpmnModel(procDef.getId());
		Process proc = model.getMainProcess();
		SubProcess subProcessOrig = this.getDynamicSubProcess(proc);
		/*
		 * if (subProcessOrig == null) { throw new IllegalStateException(
		 * "Could not find the required Dynamic SubProcess for DocType: " +
		 * docType + " and group: " + group); }
		 */
		/*
		 * ErrorEventDefinition error = this.getErrorEventDefinition(proc); if
		 * (error == null) { throw new IllegalStateException(
		 * "Could not find the ErrorEventDefinition for DocType: " + docType +
		 * " and group: " + group); }
		 */
		SubProcess subProcessUpDt = createDynamicSubProcess(tasks, new ErrorEventDefinition());
		List<SequenceFlow> sequenceFlows = getSubReferences(proc, subProcessOrig, subProcessUpDt);
		// only need to modify ref from original subProcess to next flow element

		proc.addFlowElement(subProcessUpDt);

		BpmnModel updatedModel = new BpmnModel();
		updatedModel.setTargetNamespace(WFConstants.NAMESPACE_CATEGORY);
		updatedModel.addProcess(proc);

		// create the diagramming
		new BpmnAutoLayout(updatedModel).execute();

		// create the diagramming
		String deployId = this.repoSrvc.createDeployment().addBpmnModel(key + ".bpmn", updatedModel)
				.name("Dynamic Process Deployment - " + key).deploy().getId();
		// ProcessDefinition updatedProcDef =
		// workflowService.findProcDefByDocTypeAndGroup(docType, group);
		ProcessDefinition updatedProcDef = workflowService.findBaseProcDef(docType, group);
		Assert.notNull(updatedProcDef, "something went wrong creating the new processDefinition: " + key);
		return updatedProcDef;
	}

	public static SubProcess createDynamicSubProcess(List<DynamicUserTask> dynamicUserTasks,
			ErrorEventDefinition errorDef, String subprocessName) {
		subprocessName = StringUtils.replace(subprocessName, " ", WFConstants.PROCESS_GROUP_DIVIDER);
		SubProcess sub = new SubProcess();
		sub.setId(WFConstants.SUBPROCESS_ID_DYNAMIC + subprocessName);
		sub.setName(WFConstants.SUBPROCESS_NAME_DYNAMIC + subprocessName);
		StartEvent start = new StartEvent();
		start.setId("dynamic_sub_process_start_event" + subprocessName);
		start.setName("Start Dynamic SubProcess" + subprocessName);
		sub.addFlowElement(start);

		EndEvent end = new EndEvent();
		end.setId("dynamic_sub_process_end_event" + subprocessName);
		end.setName("End Dynamic SubProcess" + subprocessName);
		sub.addFlowElement(end);

		EndEvent errorEnd = new EndEvent();
		errorEnd.setId("rejectedErrorEndEvent" + subprocessName);
		errorEnd.setName("ErrorEnd" + subprocessName);
		errorEnd.addEventDefinition(errorDef);
		sub.addFlowElement(errorEnd);

		if (dynamicUserTasks.isEmpty()) {
			sub.addFlowElement(createSequenceFlow(start.getId(), end.getId()));
			return sub;
		}

		SequenceFlow startFlow = new SequenceFlow(start.getId(), null);
		sub.addFlowElement(startFlow);
		RecursiveTaskConverter recursiveTaskConverter = new RecursiveTaskConverter(dynamicUserTasks, sub, errorEnd);

		SequenceFlow lastRef = recursiveTaskConverter.recurseTasks(startFlow);
		lastRef.setTargetRef(end.getId());
		return sub;
	}

	public static SubProcess createDynamicSubProcess(List<DynamicUserTask> dynamicUserTasks,
			ErrorEventDefinition errorDef) {
		SubProcess sub = new SubProcess();
		sub.setId(WFConstants.SUBPROCESS_ID_DYNAMIC);
		sub.setName(WFConstants.SUBPROCESS_NAME_DYNAMIC);
		StartEvent start = new StartEvent();
		start.setId("dynamic_sub_process_start_event");
		start.setName("Start Dynamic SubProcess");
		sub.addFlowElement(start);

		EndEvent end = new EndEvent();
		end.setId("dynamic_sub_process_end_event");
		end.setName("End Dynamic SubProcess");
		sub.addFlowElement(end);

		EndEvent errorEnd = new EndEvent();
		errorEnd.setId("rejectedErrorEndEvent");
		errorEnd.setName("ErrorEnd");
		errorEnd.addEventDefinition(errorDef);
		sub.addFlowElement(errorEnd);

		if (dynamicUserTasks.isEmpty()) {
			sub.addFlowElement(createSequenceFlow(start.getId(), end.getId()));
			return sub;
		}

		SequenceFlow startFlow = new SequenceFlow(start.getId(), null);
		sub.addFlowElement(startFlow);
		RecursiveTaskConverter recursiveTaskConverter = new RecursiveTaskConverter(dynamicUserTasks, sub, errorEnd);

		SequenceFlow lastRef = recursiveTaskConverter.recurseTasks(startFlow);
		lastRef.setTargetRef(end.getId());
		return sub;
	}

	protected DynamicUserTask fromUserTask(UserTask userTask, int position) {
		DynamicUserTask dut = new DynamicUserTask();
		dut.setIndex(position);
		dut.setCandidateGroups(Lists.newArrayList(userTask.getCandidateGroups()));
		dut.setCandidateUsers(Lists.newArrayList(userTask.getCandidateUsers()));
		dut.setName(userTask.getName());
		dut.setId(userTask.getId());
		dut.setDynamicUserTaskType(fromString(dut.getId()));
		return dut;
	}

	protected DynamicUserTask DynmicUserTask(TaskInfo taskInfo, int position) {
		DynamicUserTask dut = new DynamicUserTask();
		dut.setIndex(position);
		List<Group> groups = this.identityService.createGroupQuery().groupMember(taskInfo.getActorId()).groupType("SECURITY-ROLE").list();
		List <String> groupNames = new ArrayList<>() ;
		groups.forEach(index -> groupNames.add(index.getId()));
		dut.setCandidateGroups(groupNames);
		dut.setCandidateUsers(Lists.newArrayList(taskInfo.getActorId()));
		dut.setName(taskInfo.getTaskName());
		dut.setId(taskInfo.getTaskName());
		dut.setDynamicUserTaskType(DynamicUserTaskType.findByTasktype(taskInfo.getTaskType()));
		return dut;
	}

	protected DynamicUserTaskType fromString(String id) {
		if (StringUtils.startsWith(id, WFConstants.TASK_ID_DOC_APPROVAL)) {
			return DynamicUserTaskType.APPROVE_REJECT;
		} else if (StringUtils.startsWith(id, WFConstants.TASK_ID_DOC_COLLABORATE)) {
			return DynamicUserTaskType.COLLABORATION;
		} else if (StringUtils.startsWith(id, WFConstants.TASK_ID_DOC_SUBMITTED)) {
			return DynamicUserTaskType.DOC_SUBMIT;
		} else {
			return DynamicUserTaskType.BACKEND_TASK;
		}
	}

	protected boolean isDynamicUserTask(String id) {
		return StringUtils.startsWith(id, WFConstants.TASK_ID_DOC_APPROVAL)
				|| StringUtils.startsWith(id, WFConstants.TASK_ID_DOC_COLLABORATE);

	}

	protected SubProcess getDynamicSubProcess(Process process) {
		FlowElement sub = process.getFlowElement(WFConstants.SUBPROCESS_ID_DYNAMIC);
		if (sub != null) {
			return (SubProcess) sub;
		}
		return null;
	}

	protected ErrorEventDefinition getErrorEventDefinition(Process process) {
		FlowElement boundary = process.getFlowElement(WFConstants.REJECTED_BOUNDARY_EVENT_ID);
		if (boundary == null) {
			return null;
		}
		BoundaryEvent boundaryEvent = (BoundaryEvent) boundary;
		List<EventDefinition> eventDefs = boundaryEvent.getEventDefinitions();
		for (EventDefinition eventDef : eventDefs) {
			if (eventDef instanceof ErrorEventDefinition) {
				ErrorEventDefinition temp = (ErrorEventDefinition) eventDef;
				if (WFConstants.ERROR_DOC_REJECTED.equals(temp.getErrorCode())) {
					return temp;
				}
			}
		}
		return null;
	}

	/**
	 * @param process
	 * @param original
	 * @param updated
	 * @return
	 */
	protected List<SequenceFlow> getSubReferences(Process process, SubProcess original, SubProcess updated) {
		List<SequenceFlow> refs = Lists.newArrayList();

		Collection<FlowElement> flowElements = process.getFlowElements();
		for (FlowElement el : flowElements) {
			if (el instanceof SequenceFlow) {
				SequenceFlow seqFlow = (SequenceFlow) el;
				if (seqFlow.getTargetRef().startsWith(WFConstants.SUBPROCESS_ID_DYNAMIC)) {
					refs.add(0, seqFlow);
					continue;
				}
				if (seqFlow.getSourceRef().startsWith(WFConstants.SUBPROCESS_ID_DYNAMIC)) {
					refs.add(1, seqFlow);
					continue;
				}
			}
		}
		if (refs.get(0) == null || refs.get(1) == null) {
			throw new IllegalStateException("Could not find source and ref sequenceflows" + refs);
		}
		return refs;
	}

	protected static class RecursiveTaskConverter {
		private List<DynamicUserTask> dynamicUserTasks;
		private int approvalCount = 1;
		private int approvalsTotal = 0;
		private int collabCount = 1;
		private int collabTotal = 0;
		private int taskCount = 1;
		private int taskTotal = 0;
		private SubProcess subProcess;
		private EndEvent errorEnd;
		private boolean isCalled = false;

		public RecursiveTaskConverter(List<DynamicUserTask> dynamicUserTasks, SubProcess subProcess,
				EndEvent errorEnd) {
			this.dynamicUserTasks = Lists.newArrayList(dynamicUserTasks);
			this.subProcess = subProcess;
			this.errorEnd = errorEnd;
			for (DynamicUserTask ut : dynamicUserTasks) {
				if (DynamicUserTaskType.APPROVE_REJECT.equals(ut.getDynamicUserTaskType())) {
					this.approvalsTotal++;
				} else if (DynamicUserTaskType.COLLABORATION.equals(ut.getDynamicUserTaskType())) {
					this.collabTotal++;
				} else {
					taskTotal++;
					/*
					 * throw new IllegalArgumentException(
					 * "Invalid dynamic user task type: " +
					 * ut.getDynamicUserTaskType());
					 */
				}
			}
		}

		public SequenceFlow recurseTasks(SequenceFlow prev) {
			if (!isCalled) {
				this.isCalled = true;
				return this._recurseTasksPriv(prev);
			} else {
				return prev;
				// throw new IllegalStateException("The recurseTasks method can
				// only be called once");
			}
		}

		private SequenceFlow _recurseTasksPriv(SequenceFlow prev) {
			if (dynamicUserTasks.isEmpty()) {
				return prev;
			}
			DynamicUserTask current = this.dynamicUserTasks.remove(0);
			SequenceFlow target;
			if (DynamicUserTaskType.APPROVE_REJECT.equals(current.getDynamicUserTaskType())) {
				target = approvalTask(subProcess, errorEnd, current, approvalCount, approvalsTotal, prev);
				approvalCount++;
			} else if (DynamicUserTaskType.COLLABORATION.equals(current.getDynamicUserTaskType())) {
				target = collaborationTask(subProcess, current, collabCount, collabTotal, prev);
				collabCount++;
			} else {
				taskCount++;
				target = genricTask(subProcess, current, taskCount, taskTotal, prev);
			}
			return _recurseTasksPriv(target);
		}
	}
}
