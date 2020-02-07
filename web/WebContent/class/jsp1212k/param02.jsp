<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> param02 page </h1>
	today: <%= request.getParameter("date") %>
	today: <%= request.getParameter("hi") %>

</body>
</html>
