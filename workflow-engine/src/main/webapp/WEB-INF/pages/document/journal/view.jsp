<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/tasks" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="../../fragments/head.jsp"/>
    <title>View Invoice</title>

</head>

<body>
<jsp:include page="../../fragments/navbar-top.jsp"/>

<div class="container">
    <div class="start-template">
        <ol class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/index.htm">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/document/list.htm">Documents</a></li>
            <li class="active">${document.title}</li>
        </ol>

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
                        <p><strong>${errorMsg}</strong></p>
                    </div>
                </c:if>
            </div>
        </c:if>

        <c:if test="${not empty msg}">
            <div class="flash">
                <p><strong>${msg}</strong></p>
            </div>
        </c:if>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="glyphicon glyphicon-file pull-right"></span>
            <h3 class="panel-title"><strong>Journal ${document.id}</strong></h3>
        </div>
        <div class="panel-body">
            <form:form cssStyle="margin: 20px" cssClass="form-horizontal" method="POST" commandName="document">

                <div class="form-group">
                    <label for="docId" class="col-sm-2 control-label">ID</label>

                    <div class="col-sm-10">
                        <p id="docId" class="form-control-static">${document.id}</p>
                    </div>
                </div>
                <%-- <div class="form-group">
                    <label for="title" class="col-sm-2 control-label">Title</label>

                    <div class="col-sm-10">
                        <form:input cssClass="form-control" id="title" path="title" readonly="true"/>
                    </div>
                </div> --%>
                <div class="form-group">
                    <label for="author" class="col-sm-2 control-label">Author</label>

                    <div class="col-sm-4">
                        <p id="author" class="form-control-static">${document.author}</p>
                    </div>
                </div>
                <div class="form-group">
                    <label for="postingDate" class="col-sm-2 control-label">Posting
									Date</label>

                    <div class="col-sm-4">
                        <form:input path="postingDate" id="postingDate" cssClass="form-control" readonly="true"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for="period" class="col-sm-2 control-label">Period</label>

                    <div class="col-sm-4">
                        <form:input cssClass="form-control" id="period" path="period"  readonly="true"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="referance" class="col-sm-2 control-label">References</label>

                    <div class="col-sm-4">
                        <form:input cssClass="form-control" id="referance" path="referance" readonly="true" />

                    </div>
                </div>
                 <div class="form-group">
                    <label for="journalDocType" class="col-sm-2 control-label">Journal Type</label>

                    <div class="col-sm-4">
                        <form:input cssClass="form-control" id="journalDocType" path="journalDocType" readonly="true" />

                    </div>
                </div>
                <div class="form-group">
                    <label for="documentHeader" class="col-sm-2 control-label">Document
									Header</label>

                    <div class="col-sm-4">
                        <form:input cssClass="form-control" id="documentHeader" path="documentHeader" readonly="true" />

                    </div>
                </div>
                <div class="form-group">
                    <label for="debitAmount" class="col-sm-2 control-label">Debit
									Amount</label>

                    <div class="col-sm-4">
                        <form:input cssClass="form-control" id="debitAmount" path="debitAmount" readonly="true" />

                    </div>
                </div>
                <div class="form-group">
                    <label for="creditAmount" class="col-sm-2 control-label">Credit
									Amount</label>

                    <div class="col-sm-4">
                        <form:input cssClass="form-control" id="creditAmount" path="creditAmount" readonly="true" />

                    </div>
                </div>
                <div class="form-group">
                    <label for="companyCode" class="col-sm-2 control-label">Author</label>

                    <div class="col-sm-4">
                        <form:input cssClass="form-control" id="author" path="author" readonly="true" />

                    </div>
                </div>
                <div class="form-group">
                    <label for="createdDate" class="col-sm-2 control-label">Created Date</label>

                    <div class="col-sm-4">
                        <form:input cssClass="form-control" id="createdDate" path="createdDate" readonly="true"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="docState" class="col-sm-2 control-label">State</label>

                    <div class="col-sm-4">
                        <form:input cssClass="form-control" id="docState" path="docState" readonly="true"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="docType" class="col-sm-2 control-label">Doc Type</label>

                    <div class="col-sm-4">
                        <form:input cssClass="form-control" id="docType" path="docType" readonly="true"/>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="evidanceFileLocation" class="col-sm-2 control-label">Uploaded
									Evidence</label>

                    <div class="col-sm-10">
                    <table>
                    <tr>
                    <td>
                        <form:input cssClass="form-control" id="evidenceLocation" name="evidenceLocation" path="evidenceLocation" readonly="true"/>
                    </td>
                    <td>
                       <button type="button" id="downloadEvidence" name="downloadEvidence"   class="btn btn-success" >Download Evidence</button>
                    </td>
                    </tr>
                    </table>
                    </div>
                </div>

                <%--<div class="pull-right">--%>
                <%--<button type="submit" class="btn btn-primary btn-lg">Submit for Approval</button>--%>
                <%--</div>--%>
            </form:form>
        </div>
    </div>
    <hr/>
    <t:historic tagList="${historicTasks}" document="${document}"/>
</div>
<jsp:include page="/WEB-INF/pages/fragments/footer.jsp"/>
<script>
    $(document).ready(function () {
        $('li#nav-docs').addClass('active');
    });
    
    $("#downloadEvidence").click(function(event) {
    	var url = '/downloadEvidance.htm?fileName='+$("#evidenceLocation").val();
    	
		 window.open(SERVLET_CONTEXT +url);
		
	});

</script>
</body>
</html>
