<%@page import="web.project.model.FishDTO"%>
<%@page import="web.project.model.FishDAO"%>
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
	<script>
		function check(){
			var inputs = document.inputsForm;
			if(!inputs.name.value){
				alert("책 제목을 입력해 주세요");
				inputs.name.focus;
				return false;
			}
			if(!inputs.img.value){
				alert("이미지를 선택해주세요.");
				return false;
			}
			if(!inputs.genre.value){
				alert("장르를 입력해주세요.");
				return false;
			}
			if(!inputs.writer.value){
				alert("저자를 입력해주세요.");
				return false;
			}
			if(!inputs.content.value){
				alert("줄거리를 입력해주세요.");
				return false;
			}
			if(!inputs.date.value){
				alert("발행일을 선택해주세요.");
				return false;
			}
		}
	</script>
<%
	FishDAO dao = FishDAO.getInstance();
	if(session.getAttribute("memId") == null){ %>
		<script>
			alert("로그인후 사용해 주세요");
			window.location.href = "mLoginForm.jsp";
		</script>
<%	} else { %>
<body>
	<p class="txt" align="center"> 책 등록 Page</p>
	<form action="nBookListInputPro.jsp" enctype="multipart/form-data" method="post" name="inputsForm" >
		<table class="table">
			<tr>
				<td>책 제목 * </td>
				<td align = "center"><input type="text" name="name" style = "width:300px" placeholder = "제목 입력."/></td>
			</tr>
			<tr>
				<td>이미지 * </td>
				<td><input type="file" name = "img" style = "width:300px" /></td>
			</tr>
			<tr>
				<td>장르 * </td>
					<td>
					<select name="select" style="color:black; width:300px">
						<option value="판타지" style = "font-size:20px; color:blue;">판타지</h1></option>
						<option value="공포" style = "font-size:20px; color:red;">공포</option>
						<option value="로맨스" style = "font-size:20px; color:green;">로맨스</option>
					</select>
			</tr>
			<tr>
				<td>저자 * </td>
				<td><input type="text" name="writer" style = "width:300px" placeholder = "저자 입력."/></td>
			</tr>
			<tr>
				<td>줄거리 * </td>
				<td><textarea rows = "20" cols = "70" name="content" style = "width:400px" placeholder = "줄거리 입력."></textarea></td>
			</tr>
			<tr>
				<td>책 등록일 * </td>
				<td><input type="date" name="date" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="등록" />
					<input type="button" value="취소" onclick="window.location.href='nBookListForm.jsp'" /> 
				</td>
			</tr>
		</table>
	</form>
</body>
<% }
%>
<jsp:include page="mFooter.jsp"/>	
</html>