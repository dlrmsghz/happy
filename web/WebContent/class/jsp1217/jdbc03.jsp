<%@page import="java.util.List"%>
<%@page import="web.jsp1217.model.TestDAO"%>
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
	// id만 db에서 검색해와 뿌려주기
	// #1. DB연결 --> DAO
	TestDAO dao = new TestDAO();
	List idList = dao.selectIds();
	
	for(int i = 0; i < idList.size(); i++){%>
	
		<h3><%=idList.get(i) %></h3>	
		
<% 	}
%>
	
	

%>


</body>
</html>