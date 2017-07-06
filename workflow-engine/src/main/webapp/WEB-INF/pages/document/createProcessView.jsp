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
        $(function(){
        	
        	 // Assign functions to pager buttons
        	 function addProcess() { 
        		 var url = SERVLET_CONTEXT + '/process/saveProcess'  ;
        		 addRow(url);
        	 }
        	 
        	 function addSubProcess() {
        		 var url = SERVLET_CONTEXT + '/process/saveProcess'  ;
        		 addRow(url);
        	 }
        	 
        	 function addTask() {
        		 var url = SERVLET_CONTEXT + '/process/createTask'  ;
        		 alert(url)
        		 addRow(url);
        	 }
        	 
        	 
                $.ajax({
        	        type: 'GET',
        	        dataType: 'json',
        	        url: SERVLET_CONTEXT + '/process/DynProcesslist.htm',
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

            grid.jqGrid({
                datatype: "json",
                url:SERVLET_CONTEXT + '/process/DynProcesslist.htm',
                colNames:["processId","Process Name","Description","Owner","Process Type","Template","Level","Parent" ,"hasSibling" ,"" ,"",""],
                colModel:[
                    {name:'processId', index:'processId', width:50, key:true},
                    {name:'processName', index:'processName', width:80,align:"center",editable:true,required:true},
                    {name:'processDescription', index:'processDescription', width:180, align:"center" ,editable:true},
                    {name:'processOwner', index:'processOwner', width:80, align:"center" ,editable:true},
                    {name:'processType', index:'processType', width:80,align:"center" , editable: true,edittype:"select" ,editoptions:{value:"1:1;2:2;3:3"}},
                    {name:'processTemplateId', index:'processTemplateId', width:80,align:"center" ,editable: true,edittype:"select" , editoptions:{value:"1:1;2:2;3:3"}},
                    {name:'level', index:'level', width: 60, align:'center', editable: true,edittype:"select" , editoptions:{value:"1:1;2:2;3:3"}},
                    {name:'parent', index:'parent', width: 60, align:'center', editable:true},
                    {name:'processHasSibling', index:'processHasSibling', width: 60, align:'center' ,editoptions:{value:"1:1;2:2;3:3"}},
                    {name:'AddSubprocess', index:'Addprocess', width: 60, align:'center',
                     formatter:function(){
                         return '<div tabindex="0" role="button" class="ui-corner-all ui-pg-button testClass"  title=""><div class="ui-pg-div">'
                         +'<span class="ui-pg-button-text">'+'Add SubProcess</span></div></div>';
                     }},
                     {name:'AddTask', index:'Addprocess', width: 60, align:'center',
                         formatter:function(){
                             return '<div tabindex="0" role="button" class="ui-corner-all ui-pg-button testClass"  title=""><div class="ui-pg-div">'
                             +'<span class="ui-pg-button-text">'+'Add Task</span></div></div>';
                         }},
                     {
                         name: 'Actions', index: 'Actions', width: 80, formatter: 'actions',
                         formatoptions: {
                                          keys: true,
                                          editformbutton: true,
                                        
                                        }
                       }
                ],
                jsonReader: {
                    repeatitems: true,
                    id: "id",
                    root: function (obj) {
                        return obj.data;
                    }
                },
                height:'100%',
                rowNum: 10,
               	pager : "#ptreegrid",
                sortname: 'id',
               /*  treeGrid: true,
                treeGridModel: 'adjacency',
                treedatatype: "local", 
                gridview: true, */
                ExpandColumn: 'processName',
                loadonce: true,
                subGrid: true,
                subGridRowExpanded:showChildGrid,
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
            	
            	alert(SERVLET_CONTEXT + '/process/saveGridData');
            	
            	$.ajax({
        	        url: SERVLET_CONTEXT + '/process/saveGridData',
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
        	                        	//grid.trigger('reloadGrid');
        	                        	
        	                            $(this).dialog("close");
        	                            $('#dialog').css('display', 'none');
        	                        }
        	                    }
        	                });
        	            	console.log(allRowsInGrid);
        	            }
        	        },
        	        error: function (error) {
        	            alert("There was system error");
        	        }
        	    });
            	
            	
            }
 function addRow() {
     $(this).jqGrid('editGridRow', 'new', {
         url: SERVLET_CONTEXT + '/process/saveProcess',
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
                         	//grid.trigger('reloadGrid');
                         	
                             $(this).dialog("close");
                             $('#dialog').css('display', 'none');
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
         url: SERVLET_CONTEXT + '/process/createTask',
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
                         	//grid.trigger('reloadGrid');
                         	
                             $(this).dialog("close");
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
                var row = $("#grid").jqGrid('getGridParam', 'selrow');

                if (row != null) $("#grid").jqGrid('editGridRow', row, {
                    url: "/jqgrid/event/edit",
                    serializeEditData: function(data) {
                        data.date = new Date(data.date).toISOString();
                        return $.param(data);
                    },
                    recreateForm: true,
                    closeAfterEdit: true,
                    reloadAfterSubmit: true,
                    beforeShowForm: function(form) {
                        $("#date").datepicker({
                            changeMonth: true,
                            changeYear: true
                        });
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
                var row = $("#grid").jqGrid('getGridParam', 'selrow');

                // A pop-up dialog will appear to confirm the selected action
                if (row != null) $("#grid").jqGrid('delGridRow', row, {
                    url: '/jqgrid/event/delete',
                    recreateForm: true,
                    beforeShowForm: function(form) {
                        //change title
                        $(".delmsg").replaceWith('<span style="white-space: pre;">' + 'Delete selected record?' + '</span>');

                        //hide arrows
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
        function addNewProcess() {
        	alert("New Row added");
        }
        // the event handler on expanding parent row receives two parameters
        // the ID of the grid tow  and the primary key of the row
        function showChildGrid(parentRowID, parentRowKey) {
            var childGridID = parentRowID + "_table";
            var childGridPagerID = parentRowID + "_pager";

            // send the parent row primary key to the server so that we know which grid to show
            var childGridURL = "child3.json";

            // add a table and pager HTML elements to the parent grid row - we will render the child grid here
            $('#' + parentRowID).append('<table id=' + childGridID + '></table><div id=' + childGridPagerID + ' class=scroll></div>');
			
           
            $("#" + childGridID).jqGrid({
            	url:SERVLET_CONTEXT + '/process/SubprocessByProcessId.htm?processId='+$(this).jqGrid("getLocalRow", parentRowKey).processId,
                mtype: "GET",
                datatype: "json",
                colNames:["id","Sub Process Name","Description","Owner","Process Type","Template","Level","Parent" ,"hasSibling" ,"" ],
                colModel:[
                    {name:'processId', index:'processId', width:50, key:true},
                    {name:'processName', index:'processName', width:80,align:"center",editable:true,required:true},
                    {name:'processDescription', index:'processDescription', width:180, align:"center" ,editable:true},
                    {name:'processOwner', index:'processOwner', width:80, align:"center" ,editable:true},
                    {name:'processType', index:'processType', width:80,align:"center" , editable: true,edittype:"select" ,editoptions:{value:"1:1;2:2;3:3"}},
                    {name:'processTemplateId', index:'processTemplateId', width:80,align:"center" ,editable: true,edittype:"select" , editoptions:{value:"1:1;2:2;3:3"}},
                    {name:'level', index:'level', width: 60, align:'center', editable: true,edittype:"select" , editoptions:{value:"1:1;2:2;3:3"}},
                    {name:'parent', index:'parent', width: 60, align:'center', editable:true},
                    {name:'processHasSibling', index:'processHasSibling', width: 60, align:'center' ,editoptions:{value:"1:1;2:2;3:3"}},
                    {
                         name: 'Actions', index: 'Actions', width: 80, formatter: 'actions',
                         formatoptions: {
                                          keys: true,
                                          editformbutton: true,
                                        
                                        }
                       }
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
            }).jqGrid("navGrid", {add:false ,reloadGridOptions: { fromServer: true } });
            
            $("#" + childGridID).navButtonAdd("#" + childGridPagerID, {
                caption: "Add Sub Process",
                buttonicon: "ui-icon-plus",
                onClickButton: addRow,                                                                                                                                                                                                                                                                                                                                    
                position: "last",
                title: "",
                cursor: "pointer",
                id:"addNewSubProcess"
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
            	url:SERVLET_CONTEXT + '/process/TaskListByProcessId.htm?processId='+$(this).jqGrid("getLocalRow", parentRowKey).processId,
                mtype: "GET",
                datatype: "json",
                page: 1,
                colNames: ["Id", "Name" ,"Description" ,"Owner" , "taskType" , "taskStatus" , "actorId" ,"processId" , "createdBy" , ""],
                colModel: [
                  {name: "taskId", width: 130, key: true},
                  {name: "taskName", width: 130, editable:true},
                  {name: "taskDescription", width: 130 , editable:true},
                  {name: "taskOwner", width: 130 , editable:true},
                  {name: "taskType", width: 130 , editable:true},
                  {name: "taskStatus", width: 130 , editable:true},
                  {name: "actorId", width: 130 , editable:true},
                  {name: "processId", width: 130 , editable:true},
                  {name: "createdBy", width: 130 , editable:true},
                  {
                      name: 'Actions', index: 'Actions', width: 80, formatter: 'actions',
                      formatoptions: {
                                       keys: true,
                                       editformbutton: true,
                                     
                                     }
                    }
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
            }).jqGrid("navGrid", {add:false  ,reloadGridOptions: { fromServer: true } });
            
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
<%-- <jsp:include page="/WEB-INF/pages/fragments/footer.jsp"/> --%>


</body>
</html>
