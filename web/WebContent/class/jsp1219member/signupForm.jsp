<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<br />
	<h1 align="center">회원가입</h1>
	<form action="signupPro.jsp" method="post">
	<table>
		<tr>
			<td>아이디 * </td>
			<td><input type="text" name="id" /></td>
		</tr>
		<tr>
			<td>비밀번호 * </td>
			<td><input type="password" name="pw" /></td>
		</tr>
		<tr>
			<td>비밀번호 확인* </td>
			<td><input type="password" name="pwCh" /></td>
		</tr>
		<tr>
			<td>이름 *</td>
			<td><input type="text" name="name" /></td>
		</tr>
		<tr>
			<td>생년월일 </td>
			<td><input type="text" name="birth" maxlength="8" placeholder="YYYYMMDD" /></td>
		</tr>
		<tr>
			<td>Email </td>
			<td><input type="text" name="email" /></td>
		</tr>
		<tr>			
			<td colspan="2" align ="center">
			<input type="submit" value="가입" /> 
			<input type="reset" value="재입력" />	
			<input type="button" value="취소" onclick="window.location.href='main.jsp'"/>	
			</td>
		</tr>
	</table>
	</form>
</body>
</html>