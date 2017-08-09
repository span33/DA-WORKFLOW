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
    <title>Demonstrate how to use Tree Grid for the Adjacency Set Model</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/js/jquery-ui-1.11.2/jquery-ui.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/js/jqGrid-master/css/ui.jqgrid.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/js/jquery-ui-1.11.2/jquery-ui.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/journal/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jqGrid-master/js/i18n/grid.locale-en.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jqGrid-master/js/jquery.jqgrid.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.11.2/jquery-ui.min.js"></script>
    <script type="text/javascript">
   // var mydata = [{id:"1",name:"Cash",num:"100",debit:"400.00",credit:"250.00",balance:"150.00",level:"0",parent:"",isLeaf:false,expanded:false}] ;
    //<![CDATA[
               var jsonData= [{"1" : "1"},{"2" : "2"},{"3":"3"}] ;
               var groupData= [{"Admin" : "Admin"},{"Approver" : "Approver"},{"User":"User"}] ;
               
        $(function(){
        	var departmentList = ajaxCall('/admin/process/departmentList');
        	departmentList = getOption(departmentList);
            var userFormList = ajaxCall('/forms/userFormList');
            var userList = ajaxCall('/admin/process/userListByDepartments?departments=CT');
            console.log(userList)
             console.log(departmentList);
            userList = getOptionForUser(userList);
            userFormList = getOption(userFormList);
            
           var approverList =  ajaxCall('/admin/process/approverUserList');
           approverList = getOptionByCompKey(approverList, 'userName');
            
            function changeProcessOwnerSelect(e){
                departments = $(e.target).val();
                var userList = ajaxCall('/admin/process/userListByDepartments?departments='+departments);
               var userDropDown = '<select>' ;
                $.each(userList, function(i, obj) {
          
       			 for (var key in obj) {
       				userDropDown=userDropDown+'<option value='+obj[key]+'>'+obj[key] + '</option>';
       			 }
       				
                });
                userDropDown = userDropDown+'</select>';
                console.log(userDropDown);
                var form = $(e.target).closest("form.FormGrid");
                $("select#processOwner.FormElement",form[0]).html(userDropDown);
                
            }
            function rloadGrid() {
            	  /* dataToLoad =ajaxCall('/admin/process/DynProcesslist.htm');
                 grid.jqGrid('clearGridData');
                 grid.jqGrid('setGridParam',{data: dataToLoad});
                 grid.trigger('reloadGrid',[{current:true}]);  */
                 window.location.reload();
            }
        	function getOption(inputData){
        		var dropDownData = '' ;
        		 $.each(inputData, function(i, obj) {
        			 for (var key in obj) {
        				 dropDownData =dropDownData+ obj[key]+":" ;
               		 }
        			 dropDownData= dropDownData.slice(0, -1);
        			 dropDownData=dropDownData+";" ;
        	});
        		 dropDownData = dropDownData.slice(0, -1);
        		 return dropDownData  ;
        		 }
        	
        	function getOptionForUser(inputData){
        		var dropDownData = '' ;
        		 $.each(inputData, function(i, obj) {
        			 for (var key in obj) {
        				 dropDownData =dropDownData+ obj[key]+":" +obj[key];
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
        	var dataurl =SERVLET_CONTEXT +'/workflow/departmentList' ;
                $.ajax({
        	        type: 'GET',
        	        dataType: 'json',
        	        url: SERVLET_CONTEXT + '/admin/process/DynProcesslist.htm',
        	        headers: {
        	            Accept: "application/json"
        	        },
        	        success: function (resposeResult) {
        	            if (!resposeResult.success) {
        	                alert("There was an error getting the app ProcessList");
        	            }
        	            else {
							
        	            	mydata = resposeResult.data ;   
        	            }
        	        },
        	        error: function (error) {
        	            alert("There was an error getting the groups");
        	        }
        	    });
 
                grid = $("#treegrid");
                
                getColumnIndexByName = function (grid, columnName) {
                    var cm = grid.jqGrid('getGridParam', 'colModel'), i, l = cm.length;
                    for (i = 0; i < l; i++) {
                        if (cm[i].name === columnName) {
                            return i; // return the index
                        }
                    }
                    return -1;
                }
                var processlist ;
               /*  resetStatesValues = function () {
                    // set 'value' property of the editoptions to initial state
                    grid.jqGrid('setColProp', 'State', { editoptions: { value: states} });
                }; */

            grid.jqGrid({
                datatype: "json",
                url:SERVLET_CONTEXT + '/admin/process/DynProcesslist.htm',
                colNames:["processId","Process Name","Process Description","Department", "Process Owner", "Doc Type", "User Group","Process Type","User Form","Level","Parent" ,"hasSibling" /* ,"" */ ],
                colModel:[
                    {name:'processId', index:'processId', width:50, key:true},
                    {name:'processName', index:'processName', width:80,align:"center",editable:true,required:true},
                    {name:'processDescription', index:'processDescription', width:180, align:"center" ,editable:true, edittype:"textarea", editoptions: { rows:5,cols: 5 }},
                  	{name:'departmentId', index:'departmentId', width:180, align:"center" ,editable:true, edittype: 'select',editoptions: { multiple: true, value: departmentList }, editrules: { required: false }, formatoptions: { disabled: false}},
                    {name:'processOwner', index:'processOwner', width:80, align:"center" ,editable:true,edittype:"select" ,editrules: { required: true }, editoptions:{value:userList,defaultValue:"CT:Controllership"}, editrules: { required: true }},
                    {name:'docType', index:'docType', width:80,align:"center",editable:true,required:true,edittype:"select" ,editrules: { required: true },editoptions:{value:"BOOK_REPORT:BOOK_REPORT;INVOICE:INVOICE;RECEIPT:RECEIPT;JOURNAL:JOURNAL;GENERAL:GENERAL;OPENACCOUNT:OPENACCOUNT;PAYORDER:PAYORDER;SALESORDER:SALESORDER;OCAS:OCAS" ,defaultValue:"JOURNAL:JOURNAL"},required:true},
                    {name:'groupId', index:'groupId', width:80,align:"center",editable:true,required:true,edittype:"select" ,editrules: { required: true },editoptions:{value:"Admin:Admin;Aprrover:Aprrover;user:user"},required:true},
                    {name:'processType', index:'processType', width:80,align:"center" , editable: true,edittype:"select" ,editrules: { required: true },editoptions:{value:"Form Sumission:Form Sumission;Time Based:Time Based"} ,required:true},
                    {name:'processTemplateId', index:'processTemplateId', width:80,align:"center" ,editable: true,edittype:"select" , editrules: { required: true },editoptions:{value:userFormList}, required:true},
                    {name:'processLevel', index:'processLevel', width: 60, align:'center', editable: true,edittype:"select" , editrules: { required: true },editoptions:{value:"1:1;2:2;3:3"},hidden: true},
                    {name:'parent', index:'parent', width: 60, align:'center', editable:false},
                    {name:'processHasSibling', index:'processHasSibling',editable:true, width: 60, align:'center' ,editoptions:{value:"1:1;2:2;3:3"},hidden: true}/*,
                     {
                         name: 'Actions', index: 'Actions', width: 80, formatter: 'actions',
                         formatoptions: {
                                          keys: false,
                                          editformbutton: true
                                        
                                        }
                       } */
                ],
                jsonReader: {
                    repeatitems: true,
                    id: "id",
                    root: function (obj) {
                    	processlist =obj.data;
                        return obj.data;
                    }
                },
               
                height:'100%',
                rowNum: 10,
               	pager : "#ptreegrid",
                sortname: 'id',
                ExpandColumn: 'processName',
                loadonce: true,
                subGrid: true,
                editurl:SERVLET_CONTEXT+'/admin/process/editProcess',
                subGridRowExpanded:showChildGrid,
                beforeProcessing: function (response) {
                    var $self = $(this);
                    $self.jqGrid("setColProp", "departmentId", {
                    	multiple: true,
                        formatter: "select",
                        edittype: "select",
                        editoptions: {
                            value: departmentList,
                        dataEvents: [
                        {
                            type: 'change',
                            fn: function (e) {
                            	/* var names = [];
                            	 var row = grid.jqGrid('getGridParam', 'selrow');
                                    var name = grid.jqGrid('getCell', row, 'department');
                                    names.push(name); */
/*                                     departments = $(e.target).val();
                                    var userList = ajaxCall('/admin/process/userListByDepartments?departments='+departments);
                                    userList = getOption(userList);
                                    grid.jqGrid('setColProp', 'processOwner', { editoptions: { value: userList} });
                                    grid.jqGrid('clearGridData');
                                 	grid.jqGrid('setGridParam'); 
                                    grid.trigger('reloadGrid');  */
                            		changeProcessOwnerSelect(e);
                            }
                        }
                        ]
                      }
                    });
                },
                caption: "Process List",
                	/* loadComplete: function () {
                        $(".testClass").on("click",function(){
                        	//grid.editGridRow( "new" );
                        	addRow();
                       }); 
                    } */

            }).jqGrid("navGrid", {add:false ,edit:false,del:false, reloadGridOptions: { fromServer: true } });
            
             grid.navButtonAdd('#ptreegrid', {
                caption: "Add",
                buttonicon: "ui-icon-plus",
                onClickButton: addRow,
                position: "last",
                title: "",
                cursor: "pointer",
                id:"addNewRow"
            });
            
            grid.navButtonAdd('#ptreegrid', {
                caption: "Edit",
                buttonicon: "ui-icon-pencil",
                onClickButton: editRow,
                position: "last",
                title: "",
                cursor: "pointer"
            });

            grid.navButtonAdd('#ptreegrid', {
                caption: "Delete",
                buttonicon: "ui-icon-trash",
                onClickButton: deleteRow,
                position: "last",
                title: "",
                cursor: "pointer"
            });
            
            grid.navButtonAdd('#ptreegrid', {
                caption: "Save",
                buttonicon: "ui-icon-eject",
                onClickButton: saveGridData,
                position: "last",
                title: "",
                cursor: "pointer"
            });
            
            function saveGridData() {
            	var allRowsInProcessGrid = $('#treegrid').jqGrid('getGridParam','data');
            	console.log(allRowsInProcessGrid);
            	if(allRowsInProcessGrid.length <  1) {
            		alert("Grid is empty");
            	}
            	
            	$.ajax({
        	        url: SERVLET_CONTEXT + '/admin/process/saveGridData',
        	        type: "POST",
        	        dataType: 'json',
        	        data: JSON.stringify(allRowsInProcessGrid),
        	        contentType: 'application/json',
        	        success: function (resposeResult) {
        	            if (!resposeResult.success) {
        	                alert("There was an error while saving process:::"+resposeResult.message);
        	            }
        	            else {
        	            	$('#dialog').css('display', 'block');
        	                $("#dialog").text('Entry has been added successfully');
        	                $("#dialog").dialog({
        	                    title: 'Success',
        	                    modal: true,
        	                    buttons: {
        	                        "Ok": function() {
        	                            $(this).dialog("close");
        	                            $('#dialog').css('display', 'none');
        	                            rloadGrid();
        	                            
        	                        }
        	                    }
        	                });
        	            	//console.log(allRowsInGrid);
        	            }
        	        },
        	        error: function (error) {
        	            alert("There was system error"+error);
        	        }
        	    });
            	
            	
            }
 function addRow() {
	 

     $(this).jqGrid('editGridRow', 'new', {
         url: SERVLET_CONTEXT + '/admin/process/saveProcess',
         serializeEditData: function(data) {
             return $.param(data);
         },
         recreateForm: true,
         closeAfterAdd: true,
         reloadAfterSubmit: true,
         beforeShowForm: function(form) {
         },
         afterSubmit: function(response, postdata) {
             var errors = "";

             if (response.responseJSON.success == false) {
                 for (var i = 0; i < response.message.length; i++) {
                     errors += result.message[i] + "<br/>";
                 }
                 return [response.responseJSON.success, errors, null];
             } else {
            	 
             	$('#dialog').css('display', 'block');
                 $("#dialog").text('Entry has been added successfully');
                 $("#dialog").dialog({
                     title: 'Success',
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
             // only used for adding new records
            // console.log(response.responseJSON.data)
             var new_id = response.responseJSON.data;
            // grid.trigger("reloadGrid", { fromServer: true , page: 1 });
             return [response.responseJSON.success, errors, new_id];
         },
     });
 }

 function addTask() {
     $(this).jqGrid('editGridRow', 'new', {
         url: SERVLET_CONTEXT + '/admin/process/createTask',
         serializeEditData: function(data) {
             return $.param(data);
         },
         recreateForm: true,
         closeAfterAdd: true,
         reloadAfterSubmit: true,
         beforeShowForm: function(form) {
         },
         afterSubmit: function(response, postdata) {
             var errors = "";

             if (response.responseJSON.success == false) {
                 for (var i = 0; i < response.responseJSON.message.length; i++) {
                     errors += response.responseJSON.message[i] + "<br/>";
                 }
                 $(this).dialog("close");
                 return [response.responseJSON.success, errors, null];
             } else {
             	$('#dialog').css('display', 'block');
                 $("#dialog").text('Entry has been added successfully');
                 $("#dialog").dialog({
                     title: 'Success',
                     modal: true,
                     buttons: {
                         "Ok": function() {
                             $(this).dialog("close");
                             rloadGrid();
                         }
                     }
                 });
             }
             // only used for adding new records
            // console.log(response.responseJSON.data)
             var new_id = response.responseJSON.data;
            // grid.trigger("reloadGrid", { fromServer: true , page: 1 });
             return [response.responseJSON.success, errors, new_id];
         },
     });
 }
 
 
            function editRow() {
                // Get the currently selected row
                var row = $(this).jqGrid('getGridParam', 'selrow');

                if (row != null) $(this).jqGrid('editGridRow', row, {
                    url:  SERVLET_CONTEXT + '/admin/process/editProcess',
                    serializeEditData: function(data) {
                        return $.param(data); 
                    },
                    recreateForm: true,
                    closeAfterEdit: true,
                    reloadAfterSubmit: true,
                    beforeShowForm: function(form) {
                    
                    },
                    afterSubmit: function(response, postdata) {
                        var result = eval('(' + response.responseText + ')');
                        var errors = "";

                        if (result.success == false) {
                            for (var i = 0; i < result.message.length; i++) {
                                errors += result.message[i] + "<br/>";
                            }
                        } else {
                            $("#dialog").text('Entry has been edited successfully');
                            $("#dialog").dialog({
                                title: 'Success',
                                modal: true,
                                buttons: {
                                    "Ok": function() {
                                        $(this).dialog("close");
                                        rloadGrid();
                                    }
                                }
                            });
                        }

                        return [result.success, errors, null];
                    }
                });
                else alert("Please select row");
            }

            function deleteRow() {
                // Get the currently selected row
                var row = $(this).jqGrid('getGridParam', 'selrow');
                console.log(row);
                if (row != null) $(this).jqGrid('delGridRow', row, {
                    url:  SERVLET_CONTEXT +'/admin/process/deleteProcess/'+row+'/',
                    recreateForm: true,
                    beforeShowForm: function(form) {
                        //change title
                        $(".delmsg").replaceWith('<span style="white-space: pre;">' + 'Delete selected record?' + '</span>');
                        $('#pData').hide();
                        $('#nData').hide();
                    },
                    reloadAfterSubmit: false,
                    closeAfterDelete: true,
                    afterSubmit: function(response, postdata) {
                        var result = eval('(' + response.responseText + ')');
                        var errors = "";

                        if (result.success == false) {
                            for (var i = 0; i < result.message.length; i++) {
                                errors += result.message[i] + "<br/>";
                            }
                        } else {
                        	$('#dialog').removeClass('hide').addClass('show');
                            $("#dialog").text('Entry has been deleted successfully');
                            $("#dialog").dialog({
                                title: 'Success',
                                modal: true,
                                buttons: {
                                    "Ok": function() {
                                        $(this).dialog("close");
                                        rloadGrid();
                                    }
                                }
                            });
                        }
                        // only used for adding new records
                        var new_id = null;

                        return [result.success, errors, new_id];
                    }
                });
                else alert("Please select row");
            }
            
            function getOptionForParent(inputData){
        		var dropDownData = '' ;
        		 $.each(inputData, function(i, obj) {
        			 dropDownData =dropDownData+ obj['processId']+":"+obj['processId'] ;
        			 dropDownData=dropDownData+";" ;
        	});
        		 dropDownData = dropDownData.slice(0, -1);
        		 return dropDownData  ;
        		 }
        function showChildGrid(parentRowID, parentRowKey) {
            var childGridID = parentRowID + "_table";
            var childGridPagerID = parentRowID + "_pager";

            // send the parent row primary key to the server so that we know which grid to show
            var childGridURL = "child3.json";

            // add a table and pager HTML elements to the parent grid row - we will render the child grid here
            $('#' + parentRowID).append('<table id=' + childGridID + '></table><div id=' + childGridPagerID + ' class=scroll></div>');
			
            processlist =getOptionForParent(processlist);
            
           
            $("#" + childGridID).jqGrid({
            	url:SERVLET_CONTEXT + '/admin/process/SubprocessByProcessId.htm?processId='+grid.jqGrid("getLocalRow", parentRowKey).processId,
                mtype: "GET",
                datatype: "json",
                colNames:["id","Sub Process Name","Description","Owner",/* "Process Type", */"Template","Level","Parent" ,"hasSibling" /* ,"" */ ],
                colModel:[
                    {name:'processId', index:'processId', width:50, key:true},
                    {name:'processName', index:'processName', width:80,align:"center",editable:true,required:true},
                    {name:'processDescription', index:'processDescription', width:180, align:"center" ,editable:true},
                    {name:'processOwner', index:'processOwner', width:80, align:"center" ,editable:true ,editoptions:{defaultValue:$(this).jqGrid("getLocalRow", parentRowKey).processOwner}},
                    /* {name:'processType', index:'processType', width:80,align:"center" , editable: true,edittype:"select" ,editoptions:{value:"1:1;2:2;3:3"}}, */
                    {name:'processTemplateId', index:'processTemplateId', width:80,align:"center" ,editable: true,edittype:"select" , editoptions:{value:"1:1;2:2;3:3"} ,hidden: true},
                    {name:'level', index:'level', width: 60, align:'center', editable: true,edittype:"select" , editoptions:{value:"1:1;2:2;3:3"},hidden: true},
                    {name:'parent', index:'parent', width: 60, align:'center', editable:true ,edittype:"select",editoptions:{value:processlist, defaultValue:$(this).jqGrid("getLocalRow", parentRowKey).processId}},
                    {name:'processHasSibling', index:'processHasSibling', width: 60, align:'center' ,editoptions:{value:"1:1;2:2;3:3"},hidden: true},
                    /* {
                         name: 'Actions', index: 'Actions', width: 80, formatter: 'actions',
                         formatoptions: {
                                          keys: true,
                                          editformbutton: true,
                                        
                                        }
                       } */
                ],
                jsonReader: {
                    repeatitems: true,
                    id: "id",
                    root: function (obj) {
                        return obj.data;
                    }
                },
				loadonce: true,
                width: 800,
                height: '100%',
                subGrid: true, 
                caption: "Sub Process List",
                subGridRowExpanded: showThirdLevelChildGrid,
                pager: "#" + childGridPagerID
            }).jqGrid("navGrid", {add:false ,edit:false,del:false,reloadGridOptions: { fromServer: true } });
            
            $("#" + childGridID).navButtonAdd("#" + childGridPagerID, {
                caption: "Add Sub Process",
                buttonicon: "ui-icon-plus",
                onClickButton: addRow,                                                                                                                                                                                                                                                                                                                                    
                position: "last",
                title: "",
                cursor: "pointer",
                id:"addNewSubProcess"
            });
            $("#" + childGridID).navButtonAdd("#" + childGridPagerID, {
                caption: "Edit",
                buttonicon: "ui-icon-pencil",
                onClickButton: editRow,
                position: "last",
                title: "",
                cursor: "pointer"
            });

            $("#" + childGridID).navButtonAdd("#" + childGridPagerID, {
                caption: "Delete",
                buttonicon: "ui-icon-trash",
                onClickButton: deleteRow,
                position: "last",
                title: "",
                cursor: "pointer"
            });
        }
        
        // the event handler on expanding parent row receives two parameters
        // the ID of the grid tow  and the primary key of the row
        function showThirdLevelChildGrid(parentRowID, parentRowKey) {
            var childGridID = parentRowID + "_table";
            var childGridPagerID = parentRowID + "_pager";

            // send the parent row primary key to the server so that we know which grid to show
        
            var childGridURL = parentRowKey+".json";

            // add a table and pager HTML elements to the parent grid row - we will render the child grid here
            $('#' + parentRowID).append('<table id=' + childGridID + '></table><div id=' + childGridPagerID + ' class=scroll></div>');
            
           $ ("#" + childGridID).jqGrid({
            	url:SERVLET_CONTEXT + '/admin/process/TaskListByProcessId.htm?processId='+$(this).jqGrid("getLocalRow", parentRowKey).processId,
                mtype: "GET",
                datatype: "json",
                page: 1,
                colNames: ["Id", "Name" ,"Description" ,"UserForm", "Owner" , "Task Type" , "Task Status" , "Actor Name" ,"Process Id"  /* , "" */],
                colModel: [
                  {name: "taskId", width: 130, key: true},
                  {name: "taskName", width: 130, editable:true},
                  {name: "taskDescription", width: 130 , editable:true},
                  {name: "userForm", index:'userForm', width:180, align:"center" ,editable:true, edittype: 'select',editoptions: { multiple: false, value: userFormList }, editrules: { required: false }, formatoptions: { disabled: false}},
                  {name: "taskOwner", width: 130 , editable:true,editoptions:{defaultValue:$(this).jqGrid("getLocalRow", parentRowKey).processOwner}},
                  {name: "taskType", width: 130 , edittype: 'select',editoptions:{value:"Approval:Approval;Collaboration:Collaboration"},editable:true},
                  {name: "taskStatus", width: 130 , editable:true},
                  {name: "actorId", width: 130 , editable:true,edittype: 'select',editrules: { required: true },editoptions:{value:approverList}},
                  {name: "processId", width: 130 ,editable:true, editoptions:{defaultValue:$(this).jqGrid("getLocalRow", parentRowKey).processId}},
                /*   {
                      name: 'Actions', index: 'Actions', width: 80, formatter: 'actions',
                      formatoptions: {
                                       keys: true,
                                       editformbutton: true,
                                     
                                     }
                    } */
                ],
                jsonReader: {
                    repeatitems: true,
                    id: "id",
                    root: function (obj) {
                        return obj.data;
                    }
                },
				loadonce: true,
                width: 700,
                height: '100%',
                caption: "Task List",// set the subGrid property to true to show expand buttons for each row
                // javascript function that will take care of showing the child grid
                
                pager: "#" + childGridPagerID
            }).jqGrid("navGrid", {add:false,edit:false,del:false ,reloadGridOptions: { fromServer: true } });
            
           $("#" + childGridID).navButtonAdd("#" + childGridPagerID, {
                caption: "Add Task",
                buttonicon: "ui-icon-plus",
                onClickButton: addTask,
                position: "last",
                title: "",
                cursor: "pointer",
                id:"addNewTask"
            });
        }
       
        
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
        });
    //]]>
    </script>
</head>
<body>
<jsp:include page="../fragments/navbar-top.jsp"/>

<div class="container">
    <div class="start-template">
    <table id="treegrid"><tr><td></td></tr></table>
    <div id="ptreegrid"/></div>  
    <div id="dialog" title="Feature not supported" style="display:none">
            <p>That feature is not supported.</p>
        </div>
</div>
</div>
<%--  <jsp:include page="/WEB-INF/pages/fragments/footer.jsp"/>  --%>
 <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootbox.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/app/app.js"></script>
<script>
    (function($){
        $(document).ready(function () {
            $('li#nav-docs').addClass('active');
        });
    })(jQuery);
</script>

</body>
</html>
