<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 탈퇴</title>
	<link href="style.css" rel="stylesheet" type="text/css" >
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
	if(session.getAttribute("memId") == null) { %>
		<script>
			alert("로그인 해주세요!!");
			window.location.href="mLoginForm.jsp";
		</script>
<%	}else{
%>
<body>
	<p class="txt" align="center"> 회원 탈퇴 </p>
	<form action="mDeletePro.jsp" method="post">
		<table class="table"> 
			<tr>
				<td>비밀번호</td>
					<td><input type="password" name="pw" /></td>
			</tr>
			<tr>
				<td colspan ="2"><input type="submit" value="회원 탈퇴" />
				<input type="button" value="취소" onclick="window.location.href='mMain.jsp'" />
				</td>
			</tr>
		
		</table>
	</form>

</body>
<%	} %>

</html>