<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setAttribute("name","피카츄");
%>	
<body>

	<h1>요청 URI : ${pageContext.request.requestURL}<br/></h1>
	<h1>request의 속성 : ${requestScope.name}<br/></h1>
	<h1>파라미터 : ${param.test}<br/></h1> 
	<!-- http://localhost:8080/web/class/jsp0207/el01.jsp?test=1234
	URI에 파라미터 값 ?test=1234 이렇게 주면 파라미터 값 1234 출력됨 -->
	만약 request에 적용된 이름이 하나 뿐이라면 속셩명만 작성해서 저장된 이름을 불러 올 수 있음
	<h1>이름 : ${name}<br/></h1> 
	<h1>존재 하지 않을 경우 : ${memID}<br/></h1>  

</body>
</html>