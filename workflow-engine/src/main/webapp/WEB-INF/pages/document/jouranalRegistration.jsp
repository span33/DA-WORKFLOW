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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/journal/jquery-1.11.3.min.js"></script>

<!-- Isolated Version of Bootstrap, not needed if your site already uses Bootstrap -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap-iso.css" />

<!-- Bootstrap Date-Picker Plugin -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/journal/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker3.css" />
<script
	src="${pageContext.request.contextPath}/resources/js/journal/form-validator/jquery.form-validator.min.js"></script>


<jsp:include page="../fragments/head.jsp" />
</head>
<body>
	<jsp:include page="../fragments/navbar-top.jsp" />
	<div class="bootstrap-iso">
		<div class="container-fluid">
			<div class="row">	
				
				<div class="col-md-6 col-sm-6 col-xs-12">
				<form  id="journalForm" name= "journalForm" class="form-horizontal" method="POST"  enctype="multipart/form-data"
				 name="journalDetail"  action="${pageContext.request.contextPath}/document/saveJournal">
						<fieldset>

							<!-- Form Name -->
							<legend>Manual Journal Form</legend>
							
			<div id="displaymsgTag" class="centered">
                <div class="flash">
                    <p id ="dispalyMessage"><strong></strong></p>
                </div>
           </div>

							<!-- Select Basic -->
							<div class="form-group">
								<!-- Date input -->
								<label class="col-md-4 control-label" for="date">Posting
									Date</label>
								<div class="col-md-5">
									<input class="form-control" data-validation="date"
										data-validation-format="mm/dd/yyyy" id="postingDate"
										name="postingDate" placeholder="DD/MM/YYYY" type="text" />
								</div>
							</div>


							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="period">Period</label>
								<div class="col-md-2">
									<input id="period" name="period" type="text"
										placeholder="period" class="form-control input-md">

								</div>
							</div>
							<!-- Select Basic -->
							<div class="form-group">
								<label class="col-md-4 control-label" for="selReferences">References</label>
								<div class="col-md-4">
									<select id="referance" name="referance"
										class="form-control">
										<option value="G/L Adjustment">G/L Adjustment</option>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-4 control-label" for="docType">Doc
									Type</label>
								<div class="col-md-5">
									<select id="journalDocType" name="journalDocType" class="form-control">
										<option value="SA">SA - G/L Account Document</option>
										 <option value="ZJ">ZJ - Non-Cost Transfer</option>
										<option value="ZK">ZK - Cost Transfer</option>
										<option value="ZV">ZV - Cost Transfer Over 90 Days</option> 
									</select>
								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="companyCode">Company
									Code</label>
								<div class="col-md-4">
									<input id="companyCode" name="companyCode" type="text"
										placeholder="Company Code" class="form-control input-md">

								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="txtDocHeader">Document
									Header</label>
								<div class="col-md-4">
									<input id="documentHeader" name="documentHeader" type="text"
										placeholder="Document Header" class="form-control input-md">

								</div>
							</div>


							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="DebitAmount">Debit
									Amount</label>
								<div class="col-md-4">
									<input id="debitAmount" max=6
										data-validation-error-msg="You can only submit Journal upto 100000 amount"
										data-validation="number"
										data-validation-allowing="range[1;100000]" name="debitAmount"
										type="text" placeholder="Debit Amount"
										class="form-control input-md">

								</div>
							</div>


							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="CreditAmount">Credit
									Amount</label>
								<div class="col-md-4">

									<input id="creditAmount" max=6
										data-validation-error-msg="You can only submit Journal upto 100000 amount"
										data-validation="number"
										data-validation-allowing="range[1;100000]" name="creditAmount"
										type="text" placeholder="Credit Amount"
										class="form-control input-md">

								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label" for="author">Author</label>
								<div class="col-md-4">
							<input class="form-control" id="author" name="author" value="${pageContext.request.remoteUser}" />
							</div>
							</div>

							<!-- File Button -->
							<div class="form-group">
								<label class="col-md-4 control-label" for="evidanceFileLocation">Upload
									Evidence</label>
								<div class="col-md-4">
									<input id="evidanceFileLocation" multiple="multiple"
										name="evidanceFileLocation" class="input-file" type="file" accept="application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
										data-validation="mime size" data-validation-allowing="application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
										data-validation-max-size="2M"
										data-validation-error-msg-size="You can not upload images larger than 512kb"
										data-validation-error-msg-mime="You can only upload Excel Files">
									
									 

								</div>
							</div>

							<div id="approverDiv" class="form-group">
								<label class="col-md-4 control-label" for="selReferences">Approver</label>
								<div class="col-md-4">
									<select id="approver" name="approver" class="form-control">
									</select>
								</div>
							</div>
							
					<div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <div class="checkbox">
                                <label for="isSubmit">
                                    <input name="isSubmit" id="isSubmit" type="checkbox"> Submit to Workflow?
                                </label>
                            </div>
                        </div>
                    </div>
							
							<!-- Button (Double) -->
							<div class="form-group">
								<hr />
								<div class="col-md-12">
									<button type="submit" id="button1id" name="btnSubmit"  form="journalForm" class="btn btn-success">Submit
										Request</button>
									<button type="reset" id="button2id" name="btnCancel"  class="btn btn-danger">Cancel
										Request</button>
								</div>
							</div>

						</fieldset>
					 </form>
				</div>
			</div>
		</div>
	</div>
	<script>
	$("#button1id").click(function(event) {
		 event.preventDefault();
		submitForm();	
	});
	function submitForm() {
		// Get form
        var form = $('#journalForm')[0];
		var url =  SERVLET_CONTEXT + '/document/saveJournal' ;

		// Create an FormData object
        var data = new FormData(form);
        $("#button1id").prop("disabled", true);
	    $.ajax({
	    type: 'POST',
	    enctype: 'multipart/form-data',
	    url: url,
	    data: data,
	    processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,
	    success: function (data) {
	    var result=data;
	    $("#displaymsgTag").show();
	    $("#dispalyMessage").html('<Strong>'+result.message+'</Strong>');
	    },
	    
	    error: function (e) {
	    	 $("#displaymsgTag").show();
            $("#displaymsgTag").html('<Strong>'+e.responseText+'</Strong>');
            console.log("ERROR : ", e);
           

        }
	    });
	    return false;
	    
	}
	$(document).ready(function() {
		 $("#displaymsgTag").hide();
		$("#approverDiv	").hide();

		$("#postingDate").datepicker({
			dateFormat : 'mm/dd/yyyy'
		}).datepicker("setDate", "0");
	});

	$.validate({
		borderColorOnError : 'Red',
		addValidClassOnAll : true,
		errorMessagePosition : 'top',
		modules : 'file'
	});
	
	$("#debitAmount").blur(function() {
		var txtDebitAmount = $(this).val();
		getApproverList(txtDebitAmount);
	});

	function getApproverList(txtDebitAmount) {

		var url = "/document/getApproverList.htm?amount="
				+ txtDebitAmount;
		ajaxCall(url);
		return false;
	}

	function ajaxCall(url) {
		$.ajax({
			type : 'GET',
			dataType : 'json',
			url : SERVLET_CONTEXT + url,
			success : function(data) {
				var jsonData = data;
				$("#approverDiv").show();
				$.each(jsonData.data, function(i, obj) {
					
					$('#approver').append(
							'<option key='+obj.userName+'>'
									+ obj.userName
									+ '</option>');

				});

			}
		});
		return false;
	}

	</script>
</body>
</html>
