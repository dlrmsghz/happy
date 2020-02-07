<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> param03 page </h1>
	<jsp:forward page="param04.jsp">
		<jsp:param name="id" value="admin"/> 
		<jsp:param name="pw" value="1234"/> 
		<jsp:param name="name" value='<%=java.net.URLEncoder.encode("관리자")%>'/> 
		</jsp:forward> 
		
		<h3> java server page </h3>
</body>
</html>