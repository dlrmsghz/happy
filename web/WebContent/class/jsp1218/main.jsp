<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%

	// 쿠키가 유무에 따른 처리
	// #1. 쿠키 꺼내기
	Cookie[] cookies = request.getCookies(); // 쿠키 꺼내는 명령문
	String cookieId = null, cookiePw = null;
	for(Cookie c : cookies){// ??? 명령문을 통해 불러온 쿠키들을  c라는 변수? 객체(X)? 로 담겠다??
			// cookies 가 가진 수만큼 반복을 하면서 한 번 반복 할때 마다 c에게 계속 담아줌
			// 만들어진 모든 클래스에 담는 변수는 참조형 혹은 레퍼런스 변수 이다 
		//out.println(c.getName() + "=" + c.getValue() + "<br/>");
		if(c.getName().equals("cookieId")){	// 'cookieId' 라는 이름의 쿠키가 있으면
			cookieId = c.getValue();	// 값을 cookieId라는 변수에 저장
		}
		if(c.getName().equals("cookiePw")){	// 'cookieId' 라는 이름의 쿠키가 있으면
			cookiePw = c.getValue();	// 값을 cookieId라는 변수에 저장
		}
	}
	if(cookieId != null){// 로그인 되있다.  // onclick 은 자바스크립트 문법, style 은 CSS 문법%>
		<h2><%=cookieId %>님 로그인 완료!! 환영합니다.</h2> 
		<input type="button" value="로그아웃" onclick="window.location.href='logout.jsp"/>		
<%	}else{// 로그인 안된상태%> 
		<h2>form에서 로그인 하세요.</h2>
<%	}
%> 


<body>
<h2>main page</h2>
</body>
</html>