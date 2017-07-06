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

        <div id="displaymsgTag" class="centered">
                <div class="flash">
                    <p id ="dispalyMessage"><strong></strong></p>
                </div>
        </div>
        <div class="panel-body">
                <form:form id="processInfo" cssStyle="margin: 20px" cssClass="form-horizontal" method="POST" commandName="processInfo"
                           action="${pageContext.request.contextPath}/process/saveProcess">
                    <div class="form-group">
                        <form:errors path="*" cssClass="errorblock"/>
                    </div>
                    <div class="form-group">
                        <label for="title" class="col-sm-2 control-label">Process Name</label>
                        <div class="col-sm-4">
                            <form:input cssClass="form-control" id="processName" path="processName" autofocus="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="author" class="col-sm-2 control-label">Description</label>
                        <div class="col-sm-4">
                            <form:input path="processDescription" id="processDescription" cssClass="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="processOwner" class="col-sm-2 control-label">Owner</label>
						<div class="col-sm-4">
                            <form:input path="processOwner" id="processOwner" cssClass="form-control" />
                        </div>
                        <%-- <div class="col-sm-4">
                            <form:select path="groupId" cssClass="form-control" id="groupId">
                                <c:forEach var="group" items="${groups}">
                                    <form:option value="${group.id}" label="${group.name}"/>
                                </c:forEach>
                            </form:select>
                        </div> --%>
                    </div>

                    <div class="form-group">
                        <label for="payee" class="col-sm-2 control-label">Process Type</label>
                        <div class="col-sm-4">
                        <form:select path="processType"   class="form-control" id="processType" >
                            </form:select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="processTemplateId" class="col-sm-2 control-label">Template</label>

                        <div class="col-sm-4">
                            <form:select path ="processTemplateId"  class="form-control" id="processTemplateId" >
                            </form:select>
                            
                         <%-- <div class="col-sm-4">
                            <form:select path="groupId" cssClass="form-control" id="groupId">
                                <c:forEach var="group" items="${groups}">
                                    <form:option value="${group.id}" label="${group.name}"/>
                                </c:forEach>
                            </form:select>
                        </div>  --%>
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="processLevel" class="col-sm-2 control-label">Level</label>

                        <div class="col-sm-4">
                           <form:select path ="processLevel" class="form-control" id="processLevel" >
                          </form:select>
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="processParentId" class="col-sm-2 control-label">Parent</label>

                        <div class="col-sm-4">
                            <form:input path="processParentId" id="processParentId" cssClass="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="processHasSibling" class="col-sm-2 control-label">HasSibling</label>

                        <div class="col-sm-4">
                            <form:input path="processHasSibling" id="hasSibling" cssClass="form-control" />
                        </div>
                    </div>
                    <!--  <div class="form-group">
                        <label for="processTaskMappingId" class="col-sm-2 control-label">Task Mapping</label>

                        <div class="col-sm-4">
                            
                            <select  class="form-control" id="processTaskMappingId" >
                            </select>
                         </div>
                    </div>  -->
                     <div class="form-group">
                        <label for="createdBy" class="col-sm-2 control-label">Created By</label>

                        <div class="col-sm-4">
                            <form:input cssClass="form-control" id="createdBy" path="createdBy" value="${pageContext.request.remoteUser}" />
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="updatedBy" class="col-sm-2 control-label">Updated By</label>

                        <div class="col-sm-4">
                            <form:input cssClass="form-control" id="updatedBy" path="updatedBy" />
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="createdDate" class="col-sm-2 control-label">Created Date</label>

                        <div class="col-sm-4">
                            <form:input cssClass="form-control" id="dtCreated" path="dtCreated" />
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="dtupdated" class="col-sm-2 control-label">Updated Date</label>

                        <div class="col-sm-4">
                            <form:input cssClass="form-control" id="dtupdated" path="dtupdated" />
                        </div>
                    </div>
                    <form:hidden path="processId"/>
                    <form:hidden path="docType"/>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-4">
                            <div class="checkbox">
                                <label for="isSubmit">
                                    <input name="isSubmit" id="isSubmit" type="checkbox"> Submit to Workflow?
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="pull-right">
                        <button type="submit" class="btn btn-primary btn-default">Save Process</button>

                    </div>
                </form:form>
            </div>
        
<table class="table table-striped" id="processList" border =1 > </table>

       <%--  <c:choose>
            <c:when test="${empty documents}">
                <p>The user does not have any group documents</p>
            </c:when>
            <c:otherwise>
                <table class="table table-striped">
                    <tr>
                        <th>Title</th>
                        <th>Author</th>
                        <th>Group</th>
                        <th>Created Date</th>
                        <th>State</th>
                        <th>Type</th>
                    </tr>

                    <c:forEach items="${documents}" var="doc">
                        <tr>
                            <c:choose>
                                <c:when test="${doc.docType eq 'BOOK_REPORT'}">
                                    <td><a href="${pageContext.request.contextPath}/document/bookReport/view.htm?id=${doc.id}">${doc.title}</a></td>
                                </c:when>
                                <c:when test="${doc.docType eq 'INVOICE'}">
                                    <td><a href="${pageContext.request.contextPath}/document/invoice/view.htm?id=${doc.id}">${doc.title}</a></td>
                                </c:when>
                                <c:otherwise>
                                    <td>UNKNOWN</td>
                                </c:otherwise>
                            </c:choose>
                            <td>${doc.author}</td>
                            <td>${doc.groupId}</td>
                            <td><spring:eval expression="doc.createdDate"/></td>
                            <td>${doc.docState}</td>
                            <td>${doc.docType}</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:otherwise>
        </c:choose> --%>
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
var level = {"1":"1","2":"2","3":"3"};
    (function($){
    	    $.ajax({
    	        type: 'GET',
    	        dataType: 'json',
    	        url: SERVLET_CONTEXT + '/process/DynProcesslist.htm',
    	        headers: {
    	            Accept: "application/json"
    	        },
    	        success: function (resposeResult) {
    	            console.dir(resposeResult);
    	            if (!resposeResult.success) {
    	                alert("There was an error getting the app ProcessList");
    	            }
    	            else {

    	                
    	                $.each(resposeResult.data, function(i, obj) {
    	                	  //use obj.id and obj.name here, for example:
    	                	$('#processList').append('<tr id='+i+'>');
    	                		 for (var key in obj) {
    	                			  {
    	                				 if(key == 'Process Id' && i != 0) {
    	                					 $('#'+i).append( '<td><a href="/process/createProcess.htm?processId='+obj[key]+'">'+obj[key]+'</a></td>' );
    	                				 }else {
    	                					 $('#'+i).append( '<td>'  +  obj[key] + '</td>' ); 
    	                					// alert("key Value:::"+key+ "Value:::"+obj[key] );
    	                				 }
    	                				  
    	                			 }
    	                				 
    	                		 }
    	                		
    	                		 $('#'+i).append('</tr>');
    	                	});
    	                
    	                for (var key in level) {
    	                	
    	                	 $('#processType').append('<option key='+key+'>'+ level[key]+'</option>' ); 
    	                	 $('#processTemplateId').append('<option key='+key+'>'+ level[key]+'</option>' ); 
    	                	 $('#processLevel').append('<option key='+key+'>'+ level[key]+'</option>' ); 
    	                	 
    	                }
    	                
    	               
    	                
    	            }
    	        },
    	        error: function (error) {
    	            alert("There was an error getting the groups");
    	        }
    	    });
        $(document).ready(function () {
            $('li#nav-docs').addClass('active');
            $("#displaymsgTag").hide();
            
        });
    })(jQuery);
    
    
    var form = $('#processInfo');
    form.submit(function () {
    $.ajax({
    type: form.attr('method'),
    url: form.attr('action'),
    data: form.serialize(),
    success: function (data) {
    var result=data;
    $("#processId").val(result.data);
    $("#displaymsgTag").show();
    $("#dispalyMessage").html('<Strong>'+result.message+'</Strong>');
    
     
    }
    });
    return false;
    });
</script>

</body>
</html>
