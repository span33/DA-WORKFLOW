package com.da.activiti.document;

import java.util.List;

import org.activiti.engine.IdentityService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.runtime.Execution;
import org.activiti.engine.runtime.ProcessInstance;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.da.activiti.alert.AlertService;
import com.da.activiti.exception.BusinessException;
import com.da.activiti.model.Alert;
import com.da.activiti.model.document.DocState;
import com.da.activiti.model.document.Document;

/**
 * <p>
 * Workflow execution listeners for Document tasks - approve/reject,
 * collaborate, etc Most likely embedded as bean service refs within the BPMN
 * definition. within the BPMN workflow definitions.
 * </p>
 *
 * \* @author Santosh Pandey Date: 5/18/14
 */
@Service("docWorkflowListener")
public class DocWorkflowListener {
	private static final Logger LOG = LoggerFactory.getLogger(DocWorkflowListener.class);

	@Autowired
	protected IdentityService identityService;
	@Autowired
	protected RuntimeService runtimeService;
	@Autowired
	protected DocumentService docSrvc;
	@Autowired
	protected AlertService alertService;
	@Autowired
	protected TaskService taskService;

	/**
	 * Called when the process enters a approve/reject transition
	 *
	 * @param execution
	 * @throws BusinessException
	 */
	public void onApproved(DelegateExecution execution) throws BusinessException {
		LOG.debug("doc approved - process id: {}", execution.getProcessInstanceId());
		ProcessInstance pi = runtimeService.createProcessInstanceQuery()
				.processInstanceId(execution.getProcessInstanceId()).singleResult();
		String docId = pi.getBusinessKey();
		Document doc = this.docSrvc.getDocument(docId);
		String message = String.format("%s entitled '%s'  has been approved. ", doc.getDocType(), doc.getId());
		this.alertService.sendAlert(doc.getAuthor(), Alert.SUCCESS, message);
		doc.setDocState(DocState.APPROVED);
		this.docSrvc.updateDocument(doc);
		LOG.info("{} approved: {}", doc.getDocType(), doc.getTitle());

	}

	public void onRejected(DelegateExecution execution) throws BusinessException {
		LOG.debug("doc rejected - process id: {}", execution.getProcessInstanceId());
		ProcessInstance pi = runtimeService.createProcessInstanceQuery()
				.processInstanceId(execution.getProcessInstanceId()).singleResult();
		String docId = pi.getBusinessKey();
		Document doc = this.docSrvc.getDocument(docId);
		LOG.debug("setting doc {} with title = {}: state set to REJECTED", doc.getId(), doc.getId());
		String message = String.format("Document entitled '%s' has been rejected", doc.getId());
		this.alertService.sendAlert(doc.getAuthor(), Alert.DANGER, message);

		doc.setDocState(DocState.REJECTED);
		this.docSrvc.updateDocument(doc);
		LOG.info("{} rejected: {}", doc.getDocType(), doc.getTitle());
	}

	/**
	 * Called when a collaboration task is created
	 *
	 * @param execution
	 * @param task
	 */
	public void onCreateCollaborate(Execution execution, DelegateTask task) {
		ProcessInstance pi = runtimeService.createProcessInstanceQuery()
				.processInstanceId(execution.getProcessInstanceId()).singleResult();

		String docId = pi.getBusinessKey();
		if (StringUtils.isBlank(docId)) {
			return;
		}
		Document doc = this.docSrvc.getDocument(docId);
		if (doc == null) {
			return;
		}
		LOG.debug("Setting doc: {} to state = {}", doc.getTitle(), DocState.WAITING_FOR_COLLABORATION.name());
		doc.setDocState(DocState.WAITING_FOR_COLLABORATION);
		this.docSrvc.updateDocument(doc);
	}

	/**
	 * Called when a collaboration task is created
	 *
	 * @param execution
	 * @param task
	 */
	public void onCreateGenricTask(Execution execution, DelegateTask task) {

		/*ProcessInstance pi = runtimeService.createProcessInstanceQuery()
				.processInstanceId(execution.getProcessInstanceId()).singleResult();

		String docId = pi.getBusinessKey();
		if (StringUtils.isBlank(docId)) {
			return;
		}
		Document doc = this.docSrvc.getDocument(docId);
		if (doc == null) {
			return;
		}
		LOG.debug("Setting doc: {} to state = {}", doc.getTitle(),
				DocState.getDocStateStatusByName(task.getEventName()) != null
						? DocState.getDocStateStatusByName(task.getEventName()).name() : "");
		doc.setDocState(DocState.getDocStateStatusByName(task.getEventName()));
		this.docSrvc.updateDocument(doc);*/

	}

	/**
	 * Called when a collaboration task is completed
	 *
	 * @param execution
	 * @param task
	 * @throws BusinessException
	 */
	public void onCompleteGenricTask(Execution execution, DelegateTask task) throws BusinessException {
		ProcessInstance pi = runtimeService.createProcessInstanceQuery()
				.processInstanceId(execution.getProcessInstanceId()).singleResult();

		String docId = pi.getBusinessKey();
		if (StringUtils.isBlank(docId)) {
			return;
		}
		Document doc = this.docSrvc.getDocument(docId);
		if (doc == null) {
			return;
		}
	
		LOG.debug("Setting doc: {} to state = {}", doc.getTitle(),
				DocState.getDocStateStatusByName(task.getName()) != null
						? DocState.getDocStateStatusByName(task.getName()).name() : "");
		doc.setDocState(DocState.getDocStateStatusByName(task.getName()));
	
		this.docSrvc.updateDocument(doc);
		doc.setTitle(doc.getDocType() + " Document");
		String message = String.format("%s entitled '%s' has been %s on. ", doc.getDocType(),doc.getDocState(), doc.getTitle());
		this.alertService.sendAlert(doc.getAuthor(), Alert.SUCCESS, message);

	}

	/**
	 * Called when a collaboration task is completed
	 *
	 * @param execution
	 * @param task
	 * @throws BusinessException
	 */
	public void onCompleteCollaborate(Execution execution, DelegateTask task) throws BusinessException {
		ProcessInstance pi = runtimeService.createProcessInstanceQuery()
				.processInstanceId(execution.getProcessInstanceId()).singleResult();

		String docId = pi.getBusinessKey();
		if (StringUtils.isBlank(docId)) {
			return;
		}
		Document doc = this.docSrvc.getDocument(docId);
		if (doc == null) {
			return;
		}
		LOG.debug("Setting doc: {} to state = {}", doc.getTitle(), DocState.COLLABORATED.name());
		doc.setDocState(DocState.COLLABORATED);
		this.docSrvc.updateDocument(doc);

		String message = String.format("%s entitled '%s' has been collaborated on. ", doc.getDocType(), doc.getTitle());
		this.alertService.sendAlert(doc.getAuthor(), Alert.SUCCESS, message);

	}

	/**
	 * Called when a approve/reject user task is created.
	 *
	 * @param execution
	 * @param task
	 */
	public void onCreateApproval(Execution execution, DelegateTask task) {

		ProcessInstance pi = runtimeService.createProcessInstanceQuery()
				.processInstanceId(execution.getProcessInstanceId()).singleResult();
		String workFlowId = pi.getBusinessKey();

		System.out.println("");
		Document doc = this.docSrvc.getDocument(workFlowId);
		if (doc == null) {
			return;
		}

		LOG.debug("Setting doc: {} to state = {}", doc.getTitle(), DocState.WAITING_FOR_APPROVAL.name());
		doc.setDocState(DocState.WAITING_FOR_APPROVAL);
		this.docSrvc.updateDocument(doc);
		LOG.debug("Setting doc: {} to state = {}", doc.getTitle(), DocState.WAITING_FOR_APPROVAL.name());
		doc.setDocState(DocState.WAITING_FOR_APPROVAL);
		this.docSrvc.updateDocument(doc);
	}

	/**
	 * Task listener that runs when an
	 * {@link com.da.activiti.model.task.TaskCollaborationForm} or
	 * {@link com.da.activiti.model.task.TaskApprovalForm} is created. Sets the
	 * candidate group to the document's group.
	 *
	 * @param execution
	 * @param task
	 */
	@Deprecated
	public void setAssignee(Execution execution, DelegateTask task) {
		String pId = execution.getProcessInstanceId();
		ProcessInstance pi = runtimeService.createProcessInstanceQuery()
				.processInstanceId(execution.getProcessInstanceId()).singleResult();
		String docId = pi.getBusinessKey();
		Document doc = this.docSrvc.getDocument(docId);
		taskService.addCandidateGroup(task.getId(), doc.getGroupId());
	}
}
