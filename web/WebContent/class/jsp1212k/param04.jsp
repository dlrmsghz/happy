<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> param04 page </h1>
	
	아이디 : <%= request.getParameter("id") %><br/> 
	비밀번호 :<%= request.getParameter("pw") %><br/> 
	이름: <%=java.net.URLDecoder.decode(request.getParameter("name"))%> <br/> 

</body>
</html>