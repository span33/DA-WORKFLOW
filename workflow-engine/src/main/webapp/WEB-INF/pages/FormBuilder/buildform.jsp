<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/formBuilder-master/demo/assets/css/demo.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/formBuilder-master/docs/css/jquery.rateyo.min.css">

<meta name="viewport"
	content="user-scalable=no, width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<title></title>
<jsp:include page="../fragments/head.jsp" />
<title>FormBuilder</title>
</head>

<body>
	<jsp:include page="../fragments/navbar-top.jsp" />
<body>
	<div class="content">
		<h1>Form Builder</h1>
		<div id="dialog" title="Feature not supported" style="display: none">
			<p>That feature is not supported.</p>
		</div>
		<div id="stage1" class="build-wrap"></div>
		<form class="render-wrap"></form>
		<br/><br/>
		<div class="form-group">
			<label class="col-md-4 control-label" for="userForm">User Form Name</label>
			<div class="col-md-5">
				<input class="form-control" name="userForm" placeholder="USER FORM"
					type="text" required="required" id="userForm" />
				<input class="form-control" name="setFormData" placeholder="SETFORMDATA"
					type="hidden"  id="setFormData"  />
			</div>
		</div>
		<button id="edit-form">Edit Form</button>
		<div class="action-buttons">
			<h2>Actions</h2>
			<button id="showData" type="button">Show Data</button>
			<button id="clearFields" type="button">Clear All Fields</button>
			<button id="getData" type="button">Get Data</button>
			<button id="getXML" type="button">Get XML Data</button>
			<button id="getJSON" type="button">Get JSON Data</button>
			<button id="getJS" type="button">Get JS Data</button>
			<button id="setData" type="button">Set Data</button>
			<button id="addField" type="button">Add Field</button>
			<button id="removeField" type="button">Remove Field</button>
			<button id="testSubmit" type="submit">Submit</button>
			<button id="resetDemo" type="button">Reset</button>
			<!-- <h2>i18n</h2>
      <select id="setLanguage">
        <option value="ar-TN" dir="rtl">ØªÙˆÙ†Ø³ÙŠ</option>
        <option value="de-DE">Deutsch</option>
        <option value="en-US">English</option>
        <option value="es-ES">espaÃ±ol</option>
        <option value="fa-IR" dir="rtl">Ù�Ø§Ø±Ø³Ù‰</option>
        <option value="fr-FR">franÃ§ais</option>
        <option value="nb-NO">norsk</option>
        <option value="nl-NL">Nederlands</option>
        <option value="pt-BR">portuguÃªs</option>
        <option value="ro-RO">romÃ¢n</option>
        <option value="ru-RU">Ð ÑƒÑ�Ñ�ÐºÐ¸Ð¹ Ñ�Ð·Ñ‹Ðº</option>
        <option value="tr-TR">TÃ¼rkÃ§e</option>
        <option value="vi-VN">tiáº¿ng viá»‡t</option>
        <option value="zh-TW">å�°èªž</option>
      </select> -->
		</div>
	</div>
	<script>
	 var  userFormId = ${userFormId} ;
	</script>
	<script
		src="${pageContext.request.contextPath}/resources/formBuilder-master/demo/assets/js/vendor.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/formBuilder-master/demo/assets/js/form-builder.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/formBuilder-master/demo/assets/js/form-render.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/formBuilder-master/docs/js/jquery.rateyo.min.js"></script>
	
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootbox.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/app/app.js"></script>
		<script
		src="${pageContext.request.contextPath}/resources/formBuilder-master/demo/assets/js/demo.js"></script>
	<%-- <jsp:include page="/WEB-INF/pages/fragments/footer.jsp"/> --%>
	<script>
    (function($){
    	function ajaxCall(url) {
        	var dataFromServer ;
			$.ajax({
				type : 'GET',
				dataType : 'json',
				url : SERVLET_CONTEXT + url,
				async: false,
				success : function(jsonData) {
					dataFromServer= jsonData.data;
				},
				error: function (error) {
	 	            alert("There was an error while accessing :::"+url+"::::::"+error);
	 	        }
			});
			 
			return JSON.stringify(dataFromServer);
		}
        $(document).ready(function () {
        	$('li#nav-buildForms').addClass('active');
            var setFormData =  ajaxCall('/admin/process/jsonDataForForm?userFormId='+userFormId) ;
            $('#setFormData').val(setFormData);
            console.log(setFormData);
           $('#setData').trigger('click');
           
        });
    })(jQuery);
</script>

	
</body>

</html>
