<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	<% //request.setCharacterEncoding("UTF-8"); 동일%>
	<fmt:requestEncoding value="UTF-8"/> <!-- 위와 동일 -->
	
	<!-- 컨트롤러에서 request를 통해 보내준 Date 객체 받아 출력 -->
	<fmt.formatDate vlaue= "${day}">


</body>
</html>