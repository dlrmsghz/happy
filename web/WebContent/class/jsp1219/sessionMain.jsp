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
		String id =(String)session.getAttribute("sid");
		String pw =(String)session.getAttribute("spw");
	%>

	<% if(id != null){   %> 
			<H3> <%= id %> 님 환영합니다</H3>
			<button value ="" onclick = "window.location.href='sessionLogout.jsp'">Logout</button>  
			
	<% }else{ %>
		
	 	<h3> 로그인 실패... </h3>
	 	<button onclick ="window.location.href='sessionForm.jsp'">To login page</button> 
	 <%}%>
		sID = <%=id %>/ sPw = <%= pw %> <br/>
		<!-- 왜 null 로 나오지?  잘못기입했어도 받은 String id pw 출력되야 하는거 아닌가 ???  
			if 로 빼야되나?   -->	
</body>
</html>