<%@page import="java.util.Calendar"%>
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

	//request에 setAttribute()해서 세팅된 객체 꺼내기
	// 객체의 탕딥이 뭔지 모르기 때문에 맞는 타입으로 형변환 해서 사용해야한다.
	Calendar cal= (Calendar)request.getAttribute("cal");
%>



현재시간 :  <%= cal.get(Calendar.HOUR) %> 시
	   <%= cal.get(Calendar.MINUTE) %> 분
	   <%= cal.get(Calendar.SECOND) %> 초



</body>
</html>