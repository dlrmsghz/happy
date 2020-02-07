<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1> param01 page </h1>
	<jsp:include page="param02.jsp">
		<jsp:param name ="date" value ="<%= new java.util.Date() %>"/>
		<jsp:param name ="hi" value ="hii"/>
	</jsp:include>
			
		
</body>
</html>