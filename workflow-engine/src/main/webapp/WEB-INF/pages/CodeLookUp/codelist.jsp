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
            
            function rloadGrid() {
                 window.location.reload();
            }
        	
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
                url:SERVLET_CONTEXT + '/admin/codelookup/dynCodelist',
                colNames:["Id","Code Type","Key Code","Key Value","Date Created"],
                colModel:[
                    {name:'id', index:'id', width:100, key:true},
                    {name:'codeType', index:'codeType', width:100, editable:true , editrules:{required:true },editoptions: { maxlength : 15 ,dataInit: function (el) { $(el).css('text-transform', 'uppercase'); }}},
                    {name:'keyCode', index:'keyCode', width:200,align:"center",editable:true,editrules:{required:true },editoptions: { maxlength: 15, dataInit: function (el) { $(el).css('text-transform', 'uppercase'); }}},
                    {name:'keyValue', index:'keyValue', width:200,align:"center",editable:true,editrules:{required:true } ,editoptions: { maxlength : 15 ,dataInit: function (el) { $(el).css('text-transform', 'uppercase'); }}},
                    {name:'dateCreated', index:'dateCreated', width:300,align:"center",required:true ,editoptions: { dataInit: function (el) { $(el).css('text-transform', 'uppercase'); }}}
                ],
                jsonReader: {
                    repeatitems: true,
                    id: "id",
                    root: function (obj) {
                    	dynprocesslist =obj.data;
                        return obj.data;
                    }
                },
                ondblClickRow: function (rowid) {
                    var rowData = $(this).getRowData(rowid);
                    console.log(rowData);
                   // document.location.href = SERVLET_CONTEXT + "/admin/process/genrateForm?userFormId=" + rowData['id'];
                },
                height:'100%',
                rowNum: 10,
               	pager : "#ptreegrid",
                sortname: 'id',
                ExpandColumn: 'processName',
                loadonce: true,
                subGrid: false,
                beforeSubmit: function (postData) {
                    postData.name = postData.name.toUpperCase();
                    return [true, ''];
                },
                caption: "Code List",
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
            function addRow() {
                $(this).jqGrid('editGridRow', 'new', {
                    url: SERVLET_CONTEXT + '/admin/codelookup/addCodeType',
                    serializeEditData: function(data) {
                    	data.codeType = data.codeType.toUpperCase();
                    	data.keyCode = data.keyCode.toUpperCase();
                    	data.keyValue = data.keyValue.toUpperCase();
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
            
            function deleteRow() {
                // Get the currently selected row
                var row = $(this).jqGrid('getGridParam', 'selrow');
                console.log(row);
                if (row != null) $(this).jqGrid('delGridRow', row, {
                    url:  SERVLET_CONTEXT +'/admin/codelookup/deleteCodeType/'+row+'/',
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
            
            function editRow() {
                // Get the currently selected row
                var row = $(this).jqGrid('getGridParam', 'selrow');

                if (row != null) $(this).jqGrid('editGridRow', row, {
                    url:  SERVLET_CONTEXT + '/admin/codelookup/updateCodeType',
                    serializeEditData: function(data) {
                    	data.codeType = data.codeType.toUpperCase();
                    	data.keyCode = data.keyCode.toUpperCase();
                    	data.keyValue = data.keyValue.toUpperCase();
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
            $('li#nav-code').addClass('active');
        });
    })(jQuery);
</script>

</body>
</html>
