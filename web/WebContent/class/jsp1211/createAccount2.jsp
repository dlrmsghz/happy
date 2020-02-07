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

	// 인코딩함
	request.setCharacterEncoding("UTF-8");
	// 변수 에 담아둠
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String nname = request.getParameter("nname");
	String gender = request.getParameter("gender"); 
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String email3 = request.getParameter("email3");
	String introducing = request.getParameter("introducing");
	
	out.println("id : " + id + "<br />");
	out.println("pw : " + pw + "<br />");
	out.println("nname : " + nname + "<br />");
	out.println("gender : " + gender + "<br />");
	out.println("email : " + email1 +"@" +email2+"." +email3+ "<br />");
	out.println("자기소개 : " + introducing + "<br />");

	
	out.println("<br />");	
	
	


	
%>


</body>
</html>