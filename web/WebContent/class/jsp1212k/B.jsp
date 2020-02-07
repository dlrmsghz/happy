<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> BBBBB PAGE </h1>
	
	<%
		System.out.println("BBBBBBB"); 
		//response.sendRedirect("C.jsp"); 
		 
	
	%>
		<%-- <jsp:forward page="C.jsp"/> --%>
		<jsp:forward page ="C.jsp">
			<jsp:param name = "id" value ="java" /> 
		</jsp:forward> 
</body>
</html>