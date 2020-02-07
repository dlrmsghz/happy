<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		Calendar cal = Calendar.getInstance();
		
		//  	속성명, 데이터(문자, 숫자, 객체...)
		request.setAttribute("cal", cal);
	
	
	
	%>

	<jsp:forward page="timeViewer.jsp">
		<jsp:param value="test" name="t"/>
	</jsp:forward>
</body>
</html>