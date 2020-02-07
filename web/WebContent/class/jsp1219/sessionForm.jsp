<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if( session.getAttribute("sid")==null){//세션없을때 %>
	<form action="sessionPro.jsp" method="post">
		id : <input type="text" name="id">		
		pw : <input type="password" name="pw">		
		 	 <input type="submit" value="login">		
	</form>
	<% }else { // 세션이 있을때 == > 로그인 된 상태  %>
	 
	 	<script>
	 		alert("로그인된 상태입니다");
	 		window.location.href="sessionMain.jsp"; 
	 	</script>
	 	
	<% } %>
	

</body>
</html>