<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	//로그아웃 --> 쿠키삭제
	//쿠키들 다 꺼내서 cookieId, cookiePw 없애기
	Cookie[] cookies = request.getCookies();
	for(Cookie c : cookies){
		if(c.getName().equals("cookieId")){//쿠키 걸러서 삭제
			c.setMaxAge(0);				// 삭제 메서드가  존재x ,대안책 유효시간 0초 세팅
			response.addCookie(c);		// response에 적용!!!	
		}
		if(c.getName().equals("cookiePw")){
			c.setMaxAge(0);
			response.addCookie(c);			
		}
	}
	response.sendRedirect("form.jsp");
%>

<body>

</body>
</html>