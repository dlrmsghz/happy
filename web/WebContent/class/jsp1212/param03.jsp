<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>param03 page</h1>
	<jsp:forward page="param04.jsp">
		<jsp:param name="id" value="admin" />
		<jsp:param name="pw" value="1234" />
		<jsp:param name="name" value="a관리자" />
	</jsp:forward>
</body>
</html>