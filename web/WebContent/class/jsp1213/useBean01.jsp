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
	// Date date = new Date(); 랑 밑에 거랑 기능이 똑같음	
	// java.util.Date date = new java.util.Date();	%>
	<jsp:useBean id="date" class="java.util.Date"/>
	
	<%	
		out.println("오늘의 날짜 및 시간 : " );
		
	%>
	<%=date %>
	

</body>
</html>