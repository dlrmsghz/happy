<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="web.jsp12.model.BoardDAO"%>
<%@page import="java.sql.Timestamp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>write pro</title>
	<link href="style.css" rel="stylesheet" type="text/css">
</head>
<%  
	
	request.setCharacterEncoding("UTF-8");

	//# 로그인 상태 확인하고 페이지 처리
	if(session.getAttribute("memId") == null) { %>
		<script>
			alert("로그인 후 이용 가능");
			window.location="loginForm.jsp?pageNum=1&from=boardList";
		</script>	
<%	}else{
%>

<jsp:useBean id="article" class="web.jsp12.model.BoardDTO" />
<jsp:setProperty property="*" name="article"/>

<% 
	
	// 넘어온 얘들은 property 로 저절로 채워주고 넘어가지 않는 나머지 얘들은 밑의 메서드로 넘겨 주는 것
	article.setReg(new Timestamp(System.currentTimeMillis())); // DTO 에 SEt property 로 못 채워주는 부분을 채워줌 , 현재 시스템상의 시간을 채워줌
	article.setIp(request.getRemoteAddr()); // 내가 지금 요청하고 있는 이 피씨의 ip 주소를 보냄
	
	BoardDAO dao = BoardDAO.getInstance();
	dao.insertArticle(article);	 // 수동으로도 전부 다 채워줬으니까 insertArticle 을 이용해서 다 저장해라
	
	response.sendRedirect("boardList.jsp");


	}
%>

<body>

</body>
</html>