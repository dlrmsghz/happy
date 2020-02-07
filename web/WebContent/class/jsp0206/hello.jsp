<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> hello View page</h1>
	<H1><%=request.getAttribute("num")%></H1>
	<H1><%=request.getAttribute("name")%></H1>
	<h1><%=session.getAttribute("memId")%></h1>
		
</body>
</html>