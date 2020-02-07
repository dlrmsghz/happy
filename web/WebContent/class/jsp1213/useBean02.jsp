<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	#1. 객체 생성 
	<jsp:useBean id="person" class="web.jsp1213.test.Bean"/>
	
	#1. 객체 사용 (데이터 지정,꺼내기)
	<% 
		person.setId();
		person.setPw();		
	%> 
	
	아이디 : <%=person.getId() %>
	비 번 : <%=person.getPw() %>
	
	 
	
	
	


</body>
</html> --%>