<%@page import="web.jsp1219.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signupPro</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="member" class="web.jsp1219.member.MemberDTO"/>
<jsp:setProperty property="*" name ="member" />
<% 
MemberDAO dao= new MemberDAO();
dao.insertMember(member);

%>
<body>
	<h3><jsp:getProperty property="id" name="member"/> </h3>
	<h2> <%=member.getId() %> 님이 가입 완료되었습니다!!</h2>
</body>
<%response.sendRedirect("main.jsp"); %>
</html>