<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/tasks"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="../fragments/head.jsp" />
<%--<link href="${pageContext.request.contextPath}/resources/js/chosen_v1.3.0/chosen.css" rel="stylesheet">--%>
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap-choosen.css"
	rel="stylesheet">

<title>Workflow Edit</title>

<style type="text/css">
.panel-task {
	margin: 15px 0;
}

div#diagram {
	margin: 20px auto;
}
</style>
</head>
<body>
	<jsp:include page="../fragments/navbar-top.jsp" />

	<div class="container">

		<div class="start-template">
			<div class="page-header">
				<span class="glyphicon glyphicon-cog pull-right"></span>
				<h3>Workflows</h3>
			</div>

			<c:if test="${error == true}">
				<div class="errorblock">
					<c:if test="${not empty errors}">
						<div class="errorBox">
							<c:forEach var="objError" items="${errors}">
                            ${objError.field} - ${objError.defaultMessage}<br>
							</c:forEach>
						</div>
					</c:if>
					<c:if test="${not empty errorMsg}">
						<div class="errorBox">
							<p>
								<strong>${errorMsg}</strong>
							</p>
						</div>
					</c:if>
				</div>
			</c:if>

			<c:if test="${not empty msg}">
				<div class="flash">
					<p>
						<strong>${msg}</strong>
					</p>
				</div>
			</c:if>

			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">INITIATE ${docType} WORKFLOW</h3>
				</div>
				<div class="panel-body">
					<form style="margin: 20px" class="form-horizontal" role="form"
						id="intiateWorkflow" name="intiateWorkflow" method="post"
						action="${pageContext.request.contextPath}/forms/saveDynamicFormData.htm">
						<div id="displaymsgTag" class="centered">
							<div class="flash">
								<p id="dispalyMessage">
									<strong></strong>
								</p>
							</div>
						</div>

						<c:if test="${not empty fields}">
							<c:forEach items="${fields}" var="field">
								<div class="form-group">
									<label for="${field.name}" class="col-sm-2 control-label">${field.label}</label>
									<div class="col-sm-10">
										<c:choose>


											<c:when test="${field.type eq 'select'}">
												<select class="${field.className}" id="groupSel">
												<!-- 	<option value="">Please Select</option> -->
													<c:forEach var="data" items="${field.values}">
													<c:choose>
														<c:when test="${field.value eq data.value}">
															<option selected="selected" value="${data.label}">${data.value}</option>
														</c:when>

														<c:otherwise>
															<option  value="${data.label}">${data.value}</option>
														</c:otherwise>
													</c:choose>
													</c:forEach>
												</select>
											</c:when>

											<c:when test="${field.type eq 'radio'}">
												<c:forEach var="value" items="${field.values}">
													<input type="radio" name="${field.name}"
														value="${value.label}">${value.value}<br>
												</c:forEach>
											</c:when>

											<c:otherwise>
												<input type="${field.type}" class="${field.className}"
													name="${field.name}" value="${field.value}"
													id="${field.fieldId}" required="${field.required}"
													disabled="disabled" autofocus>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</c:forEach>
						</c:if>
						<input type="hidden" name="userProcessFormId"
							value="${userProcessFormId}" /> <input type="hidden"
							name="docType" value="${docType}" />
						<hr />
					</form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../fragments/footer.jsp" />
	<t:historic tagList="${historicTasks}" document="${document}" />
	<script src="${pageContext.request.contextPath}/resources/js/json2.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/underscore.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/chosen_v1.3.0/chosen.jquery.js"></script>
	<script type="application/javascript">
    APP = {} || APP;
</script>
	<script>
    (function ($) {
        $(document).ready(function () {
            $('li#nav-workflows').addClass('active');
            $("#displaymsgTag").hide();
    		$("#approverDiv	").hide();
        });
    })(jQuery);
</script>

</body>
</html>
