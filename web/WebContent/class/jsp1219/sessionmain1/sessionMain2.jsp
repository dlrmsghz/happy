<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>session 메인 페이지</h2>
	세션 ID : <%=session.getId() %>

	<%
		Date time = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		time.setTime(session.getCreationTime());
	%>
	세션 생성시간 : <%=sdf.format(time) %>
	<% time.setTime(session.getLastAccessedTime()); %>
	최근 접근 시간 :  <%=sdf.format(time) %>
	
	<%
		// 세션 존재 여부 확인
		String id =(String)session.getAttribute("id");
		String pw =(String)session.getAttribute("pw");
	%>
	
	sid : <%=id %> /spw : <%=pw %> <br/> 

	
	
</body>
</html>