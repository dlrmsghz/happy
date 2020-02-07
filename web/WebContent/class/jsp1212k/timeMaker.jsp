<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Calendar cal= Calendar.getInstance();
	
		//   "속성명", 데이터 (문자, 숫자, 객체...)
		request.setAttribute("cal",cal);  
	%>
	<h1> TimeMaker</h1>
	<jsp:forward page="timeViewer.jsp"/>

</body>
</html>