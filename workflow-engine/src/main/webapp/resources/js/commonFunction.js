var SERVLET_CONTEXT = 'http://localhost:8080/workflow-engine';
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
			 
			return dataFromServer;
		}

function getOptionByCompKeyForCodeList(inputData,compKey,compValue){
	var dropDownData = '' ;
	 $.each(inputData, function(i, obj) {
		 for (var key in obj) {
			 if(key == compKey)
			 dropDownData =dropDownData+ obj[compKey]+":" +obj[compValue];
   		 }
		 dropDownData=dropDownData+";" ;
});
	 dropDownData = dropDownData.slice(0, -1);
	 return dropDownData  ;
	 }

function getOptionByCompKey(inputData,compKey){
	var dropDownData = '' ;
	 $.each(inputData, function(i, obj) {
		 for (var key in obj) {
			 if(key == compKey)
			 dropDownData =dropDownData+ obj[key]+":" +obj[key];
   		 }
		 dropDownData=dropDownData+";" ;
});
	 dropDownData = dropDownData.slice(0, -1);
	 return dropDownData  ;
	 }

function retErrorMessage( message) {
	 $('#dialog').css('display', 'block');
    $("#dialog").text(message);
    $("#dialog").dialog({
        title: 'Error	',
        modal: true,
        buttons: {
            "Ok": function() {
                $(this).dialog("close");
                $('#dialog').css('display', 'none');
                rloadGrid();
                   
            }
        }
    });
}

