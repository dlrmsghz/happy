<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<h1>param01</h1>
<!-- 다른 페이지에서 실행한 결과를 여기다 붙여줌   -->
<jsp:include page ="param02.jsp">
	<jsp:params value ="name+" name+"date value+"<%=new java.util.Date() %>" />
<!-- 파라미터 받는 거 전부 스트링으로 받음 (전부 문자열임) 파라미터 숫자 계산 하고 싶으면 형변환 해
서 써야됨

params 를 쓰는 이유  - 다른 페이지를 include 해서 붙여 놨을 때
 메인 페이지에 들어있는 데이터 (파라미터) 등 을 붙여논 헤더나 푸터 등등에서 사용 할 수 있게 해준다
-->

</body>
</html>
