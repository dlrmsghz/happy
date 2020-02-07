<%@page import="web.jsp1218.model.TestDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ca2</title>
</head>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="dto" class="web.jsp1218.model.SignupFormVO"/>
<jsp:setProperty property="*" name="dto"/>

<%
	request.setCharacterEncoding("UTF-8");

	TestDAO dao =new TestDAO();
	dao.insertMember(dto);

%>
<body>


	<hs3><jsp:getProperty property="id" name="dto"/> </hs3>
	<h2> <%=dto.getId() %> 님이 가입 완료되었습니다!!</h2>

</body>
</html>