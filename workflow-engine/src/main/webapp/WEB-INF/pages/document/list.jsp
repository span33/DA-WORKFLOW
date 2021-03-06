<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="../fragments/head.jsp"/>
    <title>Documents</title>
</head>

<body>
<jsp:include page="../fragments/navbar-top.jsp"/>

<div class="container">

    <div class="start-template">
        <div class="page-header">
            <span class="glyphicon glyphicon-paperclip pull-right"></span>
            <h3>Documents <small>${pageContext.request.remoteUser}</small></h3>
        </div>

        <div class="centered">
            <c:if test="${not empty msg}">
                <div class="flash">
                    <p><strong>${msg}</strong></p>
                </div>
            </c:if>
        </div>


        <c:choose>
            <c:when test="${empty userForms}">
                <p>The user does not have any  documents to initiate work flow</p>
            </c:when>
            <c:otherwise>
                <table class="table table-striped">
                    <tr>
                        <th>Id</th>
                        <th>Process Id</th>
                        <th>Doc Type</th>
                        <th>Form Link </th>
                    </tr>

                    <c:forEach items="${userForms}" var="userForm">
                        <tr>
                            <td>${userForm.id}</td>
                            <td>${userForm.processId}</td>
                            <td>${userForm.docType}</td>
                            <td><a href="${pageContext.request.contextPath}/forms/dynamicFormGenrator.htm?${userForm.formLink}">Populate ${userForm.docType} Form</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </c:otherwise>
        </c:choose>
        
        <c:choose>
            <c:when test="${empty documents}">
                <p>The user does not have any group documents</p>
            </c:when>
            <c:otherwise>
                <table class="table table-striped">
                    <tr>
                        <th>Document Id</th>
                        <th>Author</th>
                        <th>Group</th>
                        <th>Created Date</th>
                        <th>State</th>
                        <th>Type</th>
                    </tr>

                    <c:forEach items="${documents}" var="doc">
                        <tr>
                            
                                    <td><a href="${pageContext.request.contextPath}/forms/document/${doc.docType}/view.htm?id=${doc.id}&processUserFormId=${doc.userProcessFormId}&workFlowId=${doc.id}">${doc.id}</a></td>
                         
                            <td>${doc.author}</td>
                            <td>${doc.groupId}</td>
                            <td><spring:eval expression="doc.createdDate"/></td>
                            <td>${doc.docState}</td>
                            <td>${doc.docType}</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:otherwise>
        </c:choose>
        
        <hr/>
        <%-- <div class="btn-group pull-right">
            <button type="button" class="btn btn-default dropdown-toggle btn-primary" data-toggle="dropdown" aria-expanded="false">
                Create new Document <span class="caret"></span>
            </button>
            <ul class="dropdown-menu" role="menu">
                <li><a href="${pageContext.request.contextPath}/document/bookReport/create.htm">Book Report</a></li>
                <li><a href="${pageContext.request.contextPath}/document/invoice/create.htm">Invoice</a></li>
            </ul>
        </div> --%>
    </div>
</div>
<jsp:include page="/WEB-INF/pages/fragments/footer.jsp"/>
<script>
    (function($){
        $(document).ready(function () {
            $('li#nav-docs').addClass('active');
        });
    })(jQuery);
</script>

</body>
</html>
