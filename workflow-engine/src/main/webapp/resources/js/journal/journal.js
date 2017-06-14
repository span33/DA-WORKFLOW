/**
 * 
 */

$("#txtDebitAmount").blur(function() {
							var txtDebitAmount = $(this).val();
							alert	("txtDebitAmount:::" + txtDebitAmount);
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

						