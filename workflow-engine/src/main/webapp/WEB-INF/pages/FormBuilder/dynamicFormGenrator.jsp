<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<!--  jQuery -->

<!-- Isolated Version of Bootstrap, not needed if your site already uses Bootstrap -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap-iso.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link href="${pageContext.request.contextPath}/resources/JsonBaseFormBuilder/css/select2.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/JsonBaseFormBuilder/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/JsonBaseFormBuilder/css/select2-bootstrap.min.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/resources/js/journal/jquery-1.11.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/JsonBaseFormBuilder/js/underscore-min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/JsonBaseFormBuilder/js/select2.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/JsonBaseFormBuilder/js/formatter.js"></script>
	<script src="${pageContext.request.contextPath}/resources/JsonBaseFormBuilder/js/jsonlint.js"></script>
	<script src="${pageContext.request.contextPath}/resources/JsonBaseFormBuilder/js/alert.js"></script>
	<script src="${pageContext.request.contextPath}/resources/JsonBaseFormBuilder/js/bootstrap-formform.js"></script>
<jsp:include page="../fragments/head.jsp" />
</head>
<body>
	<jsp:include page="../fragments/navbar-top.jsp" />
	<div class="bootstrap-iso">
		<div class="container-fluid">
			<div class="row">	
				<div id="displaymsgTag" class="centered">
	                <div class="flash">
	                    <p id ="dispalyMessage"><strong></strong></p>
	                </div>
	           	</div>
				<div class="col-md-6 col-sm-6 col-xs-12">
				<form  id="genratedForm" name= "genratedForm" class="form-horizontal" method="POST"  enctype="multipart/form-data"
				 name="genratedForm"  action="${pageContext.request.contextPath}/document/saveJournal">
					 </form>
				</div>
			</div>
		</div>
	</div>
	<script>
	var jsonFormData = '[{"name": "username","label": "Username","type": "text"},{"name": "password","label": "Password","type": "password"},{"name": "fruit","label": "Fruit","choices": [["apple","Apple"],["pear","Pear"],["orange","Orange"]],"type": "selectmultiple2"},{"label": "Submit","type": "submit","class": "btn-danger","icon": "ok"}]';
	jsonFormData = '{"FormTemplate": {"fields": {"field": [{"name": "text-1500116681382","type": "text","subtype": "text","label": "Text Field","class": "red form-control"},{"name": "select-15001166","type": "select","label":"Select","class":"form-control","option": [{"label": "Option 1","selected": "true","#text": "Option 1"},{"label": "Option 2","#text": "Option 2"},{"label": "Option 3","#text": "Option 3"}]},{"name": "radio-group-1500116683597","type": "radio","label": "Radio Group","option": [{"label": "Option 1","selected": "true","#text": "Option 1"},{"label": "Option 2","#text": "Option 2"},{"label": "Option 3","#text": "Option 3"}]}]}}}'
	$(document).ready(function() {
		jsonFormData = JSON.parse(jsonFormData);
		jsonFormData = jsonFormData.FormTemplate.fields.field;
		var formInput, outputForm , formFields;
		$("#displaymsgTag").hide();
		$("#approverDiv").hide();
		jsonFormData = JSON.stringify(jsonFormData);
		console.log(jsonFormData);
		jsonFormData = formatter.formatJson(jsonFormData); 
		formInput = $('#genratedForm');
		formInput.val(jsonFormData);
		outputForm = $('#genratedForm');
		outputForm.submit(function() {return false});
		inputJson = formInput.val();
		formFields = JSON.parse(inputJson);
		outputForm.empty();

		
		form = FormForm( outputForm, formFields );
		try {
			form.render();
		} catch(e) {
			console.log(e);
			alert('danger', e);
		}

	
	});
	</script>
</body>
</html>
