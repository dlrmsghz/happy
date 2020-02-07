<%@page import="web.project.model.QnADTO"%>
<%@page import="web.project.model.QnADAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
<link href="style.css" rel="stylesheet" type="text/css">
<style>
		p.txt {
			color:white; 
			font-size:15px;
			background-color: #333;
		}
		.table{
			width: 100%;
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
<%
	request.setCharacterEncoding("UTF-8");
	
	int num = 0;
	if(request.getParameter("num") != null){
		num = Integer.parseInt(request.getParameter("num"));
	} 
	
	String pageNum=null;
	if(request.getParameter("pageNum")!=null){	
		pageNum = request.getParameter("pageNum");
	}else{
		pageNum="1";
	}
	
	String id = (String)session.getAttribute("memId");
	String admin = (String)session.getAttribute("admin");
		
	QnADAO dao = QnADAO.getInstance();
	QnADTO article = dao.getArticle(num);
	
	if(id.equals("admin")){
%>
<body>
	<p class="txt" align="center">글 수정</p>
	<form action="mQnAmodifyPro.jsp" method="post">
		<input type="hidden" name="num" value="<%=num %>">
		<input type="hidden" name="pageNum" value="<%=pageNum %>">
			<table class="table">
				<tr>
					<td>writer</td>
					<td><input type="text" name="writer" value="<%=article.getWriter() %>"></td>
				</tr>
				<tr>
					<td>title</td>
					<td><input type="text" name="title" value="<%=article.getTitle() %>"></td>
				</tr>
				<tr>
					<td>email</td>
					<td><input type="email" name="email" value="<%=article.getEmail() %>"></td>
				</tr>
				<tr>
					<td>content</td>
					<td><textarea rows="20" cols="70" name="content" value="<%=article.getContent() %>"></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="저장">
						<input type="reset" value="재작성">
						<input type="button" value="리스트보기" onclick="window.location='mQnAForm.jsp?pageNum=<%=pageNum %>'">
					</td>
				</tr>
			</table>
	</form>
</body>
<%}else{ %>
	<script>
		alert("관리자만 이용 가능합니다.");
		window.location="mQnAForm.jsp";
	</script>
<%} %>
<jsp:include page="mFooter.jsp"/>	
</html>