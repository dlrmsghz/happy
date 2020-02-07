<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forward01</title>
</head>
<body>
	<h1>forward01 page</h1>
	<jsp:forward page="forward02.jsp" >
		<jsp:param name="Date" value="<%=new java.util.Date() %>"/>
		
	</jsp:forward>
	<h1>==============</h1>

</body>
</html>