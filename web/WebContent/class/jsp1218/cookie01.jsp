<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%

	//쿠키 객체 생성
	Cookie c = new Cookie("id", "java");
	Cookie c2 = new Cookie("name", "pikachu");
	// 쿠키 유효기간 설정 : 초단위
	c.setMaxAge(60);	// 60초
	c2.setMaxAge(60);	// 60초
	//클라이언트에게 쿠키 전달 response에 쿠키 추가하기
	response.addCookie(c);
	response.addCookie(c2);
	
//	Cookie c1 = new Cookie("name", URLEncoder.encode("피카츄"))
		
	
	 
			 


%>



<body>

</body>
</html>