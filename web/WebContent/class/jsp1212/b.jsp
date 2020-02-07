<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>b</title>
</head>
<body>
	
	<%
	//response.sendRedirect("c.jsp");
	System.out.println("experimental");
	%>

	<jsp:forward page="c.jsp">
	<!-- 	<jsp:param name = "idd" value="experimental" /> -->
		<jsp:param name = "idd" value="experimental" />
		<%//System.out.println(idd); %>
	</jsp:forward>



</body>
</html>