<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ tag body-content="scriptless" trimDirectiveWhitespaces="true"%>
<%@ attribute name="candidateTask" required="true"
	type="com.da.activiti.model.task.CandidateTask"%>

<spring:eval
	expression="T(com.da.activiti.model.document.DocType).BOOK_REPORT"
	var="bookReportTypeStr" />
<spring:eval
	expression="T(com.da.activiti.model.document.DocType).INVOICE"
	var="invoiceTypeStr" />

<div id="collapseOne-${candidateTask.id}"
	class="panel-collapse collapse">
	<div class="panel-body">
		<form class="form-horizontal" role="form" method="post"
			action="${pageContext.request.contextPath}/tasks/approve">
			<div class="form-group">
				<label class="col-sm-2 control-label">Description</label>

				<div class="col-sm-10">
					<p class="form-control-static">${candidateTask.name}</p>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Created</label>

				<div class="col-sm-10">
					<p class="form-control-static">${candidateTask.createTime}</p>
				</div>
			</div>
			<hr />
			<div class="form-group">
				<c:set var="docType"
					value="${candidateTask.processVariables['docType']}" />
				<c:set var="processUserFormId"
					value="${candidateTask.processVariables['processUserFormId']}" />

				<label class="col-sm-2 control-label">Document</label>

				<div class="col-sm-10">
					<p class="form-control-static">
						<a
							href="${pageContext.request.contextPath}/forms/document/${docType}/index.htm?id=${candidateTask.processVariables['businessKey']}&processUserFormId=${processUserFormId}"
							onclick="window.open(this.href, 'View Document','left=20,top=20,width=800,height=600,scrollbars=1,toolbar=0,resizable=1'); return false;">View
							${docType}</a>
					</p>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">Author</label>

				<div class="col-sm-10">
					<p class="form-control-static">
						${candidateTask.processVariables['docAuthor']}</p>
				</div>
			</div>
			<hr />


			<c:when
				test="${fn:startsWith(candidateTask.taskDefinitionKey, docApprovalTask)}">
				<div class="form-group">
					<label for="comment-${candidateTask.id}"
						class="col-sm-2 control-label">Comment</label>

					<div class="col-sm-10">
						<textarea class="form-control" rows="3"
							id="comment-${candidateTask.id}" name="comment" required></textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<div class="radio">
							<label> <input type="radio" name="approved"
								id="optionsRadios1-${candidateTask.id}" value="true" checked>Approve
							</label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<div class="radio">
							<label> <input type="radio" name="approved"
								id="optionsRadios2-${candidateTask.id}" value="false">Reject
							</label>
						</div>
					</div>
				</div>

			</c:when>
			<c:when
				test="${fn:startsWith(candidateTask.taskDefinitionKey, docCollaborateTask)}">

			</c:when>
			<c:otherwise>

			</c:otherwise>


			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-primary">Complete
						Task</button>
				</div>
			</div>
			<input type="hidden" name="taskId" value="${candidateTask.id}" />
		</form>
	</div>
</div>
