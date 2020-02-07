<%@page import="web.jsp1218.model.Test3DAO"%>
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
//	int id = 10; // 객채 아니고 기본형 변수 생성
//String idt = "dfsdf"; // idt 는 객채를 담은 변수 선언 그리고 (= 뒤의 부분)객체 생성  1. 스트링이 특이해서 스트링 + 변수 형 태는 그 선언한 = 뒤의 문장 객체 (뒤의 문장의 저장된 객채의 주소 앞의 스트링 변수가 들고 있음)
	// 로그인 확인 작업 페이지
//	idt. 객체는 이클립스에서 . 찍었을때  자동완성으로 뒤에 메서드 호출 할건지 물어봄
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	// DB에 저장된 회원들 데이터에서 id/pw가 일치하는 정보있는지 확인
	Test3DAO dao = new Test3DAO();
	boolean result = dao.loginCheck(id,pw);
	System.out.println(result);
	
	// id, pw 확인한 result 결과값이 true 이면 쿠키생성
	if(result==true){
		Cookie c1 = new Cookie("cookieId", id);
		Cookie c2 = new Cookie("cookiePw",pw);
		c1.setMaxAge(60*60*24);
		c2.setMaxAge(60*60*24);
		response.addCookie(c1);
		response.addCookie(c2);
	}
	
	//String name = "cookieId"; String value = id; ?
			// String value = String id = request.getParameter("id");
	//main으로 이동
	response.sendRedirect("main.jsp");
%>

</body>
</html>