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
               var dynprocesslist ;
               var departmentList;
               var userList ;
               
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
                url:SERVLET_CONTEXT + '/forms/userFormList',
                colNames:["id","Process Id","Group Id","Doc Type","User Id", "userform_name"],
                colModel:[
                    {name:'id', index:'id', width:50, key:true},
                    {name:'process_id', index:'process_id', width:50,align:"center",editable:true,required:true},
                    {name:'group_id', index:'group_id', width:50,align:"center",editable:true,required:true},
                    {name:'doctype', index:'doctype', width:250,align:"center",editable:true,required:true},
                    {name:'user_id', index:'user_id', width:250,align:"center",editable:true,required:true},
                    {name:'userform_name', index:'userform_name', width:250,align:"center",editable:true,required:true}
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
                    document.location.href = SERVLET_CONTEXT + "/admin/process/genrateForm?userFormId=" + rowData['id'];
                },
                height:'100%',
                rowNum: 10,
               	pager : "#ptreegrid",
                sortname: 'id',
                ExpandColumn: 'processName',
                loadonce: true,
                subGrid: false,
                caption: "Process List",
                	/* loadComplete: function () {
                        $(".testClass").on("click",function(){
                        	//grid.editGridRow( "new" );
                        	addRow();
                       }); 
                    } */

            }).jqGrid("navGrid", {add:false ,edit:false,del:false, reloadGridOptions: { fromServer: true } });
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
            $('li#nav-forms').addClass('active');
        });
    })(jQuery);
</script>

</body>
</html>
