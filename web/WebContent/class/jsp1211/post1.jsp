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

	String test = request.getParameter("test");		

	out.println("id : " + id + "<br />");
	out.println("pw : " + pw + "<br />");
	
	
%>
<!-- 주소창에서 값 변경 하는 방법 POST 형식의 특성  
http://localhost:8080/web/jsp1211/post1.jsp?id=sdfsadfasdf&pw=123123123 -->





</body>
</html>