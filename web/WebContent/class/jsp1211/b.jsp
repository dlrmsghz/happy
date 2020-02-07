<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>B page</title>
</head>
<body>

<h1>B page</h1>

<%
System.out.println("BBBBBBB");
response.sendRedirect("c.jsp"); // c.jsp 로 강제이동
System.out.println("B Sendredirect");
%>

</body>
</html>

