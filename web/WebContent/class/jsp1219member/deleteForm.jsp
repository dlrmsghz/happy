<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<br/>
	<h2 align="center">회원 탈퇴</h2>
	<form action="deletePro.jsp" method="post">
		<table>
			<tr>
				<td><input type="password" name="pw"/></td>
			</tr>
			<tr>
				<td><input type="submit" value="회원탈퇴"/></td>
				<td><input type="button" value="취소" onclick="window.location.href='main.jsp'"/></td>
			</tr>
		</table>	
	</form>
</body>
</html>