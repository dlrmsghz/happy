<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	//로그아웃 --> 세션삭제
	// #1. 헤딩 세션 삭제
	session.removeAttribute("sid");
	// #2. 세션 모두 삭제
	session.invalidate();
	
	// 로그인폼으로 단순이동
	response.sendRedirect("sessionForm.jsp");
%>


<body>

</body>
</html>