<%@page import="web.project.model.CharDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href = "style.css" rel = "stylesheet" type = "text/css"/>
	<style>
			p.txt {
				color:white; 
				font-size:15px;
				background-color: #333;
			}
			.div{
				background-color: #333;
			}
			.table{
				width: 40%;
				margin-right: auto;
				margin-left: auto;
				margin-bottom:0;
				border:5px solid #333;
				padding:5px;
				overflow:hidden;
				background-color: #d9d9d9;
			}		
			.bookPage{
				color:white; 
				font-size:15px;
				background-color: #333;
			}
	</style>	
</head>
<jsp:include page="mHeader.jsp"/>
<%
String id = (String)session.getAttribute("memId");
if(session.getAttribute("memId")==null){ %>
	<script>
		alert("로그인후 이용해주세요!!");
		window.location.href="mLoginForm.jsp";
	</script>
<%} else if(id != null && !id.equals("admin")){ %>
	<script>
		alert("관리자만 이용가능합니다.!!");
		window.location.href="mMain.jsp";
	</script>
<% }else if(id.equals("admin")){ 
		CharDAO dao = CharDAO.getInstance();
		int x = dao.CharList();
%>
<body>
<p class="txt" align = "center"> 관리자 페이지 </p>
	<div class="div">
		<table class="table">
			<%	int price=0;
			  	for(int i = 1; i < 13; i++){
			  	price = dao.MonthCharList(i);%>
			<tr>
				<td><%=i%>월 매출액</td>
				<td><%=price%>원</td>
			</tr>
			<% } %>
		
			<tr>
				<td>총 매출액</td>
				<% if(x == 0){ %>
				<td> 0 원 입니다.</td>
				<%}else if(x > 0){ %>
				<td><%=x %>원</td>
				<% } %>
			</tr>
		</table>
	</div>
</body>
<% } %>
<jsp:include page="mFooter.jsp"/>
</html>