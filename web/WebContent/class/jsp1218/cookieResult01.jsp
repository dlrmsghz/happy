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

	// 쿠키들 가져오기
	Cookie[] cookies = request.getCookies();
	for(Cookie c2 : cookies){
		out.println(c2.getName() + " = " + c2.getValue() + "<br/>");
	}

	







%>
</body>
</html>