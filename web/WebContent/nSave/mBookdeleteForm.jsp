<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 탈퇴</title>
	<link href="style.css" rel="stylesheet" type="text/css" >
</head>
<%
	String bk_num = request.getParameter("bk_num");

	if(session.getAttribute("memId") == null) { %>
		<script>
			alert("로그인 해주세요!!");
			window.location.href="mLoginForm.jsp";
		</script>
<%	}else{
%>
<body>
	<br />
	<h2 align="center"> 책 삭제 </h2>
	<form action="mBookdeletePro.jsp?bk_num=<%=bk_num%>" method="post">
		<table> 
			<tr>
				<td>비밀번호</td>
					<td><input type="password" name="pw" /></td>
			</tr>
			<tr>
				<td colspan ="2"><input type="submit" value="책 삭제" />
				<input type="button" value="취소" onclick="window.location.href='mMain.jsp'" />
				</td>
			</tr>
		
		</table>
	</form>

</body>
<%	} %>

</html>