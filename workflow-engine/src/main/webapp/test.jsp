<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/jqueryTree/jquery.treetable.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/resources/js/jqueryTree/jquery.treetable.js"></script>
<script>
$("#proceesList").treetable();
</script>
</head>
<body>

<table id= "proceesList">
  <tr data-tt-id="1">
    <td>Parent</td>
  </tr>
  <tr data-tt-id="2" data-tt-parent-id="1">
    <td>Child</td>
  </tr>
</table>

</body>
</html>