<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ca1</title>
</head>
<body>

  <form action="ca2.jsp" method="post">
	<table border="">
		<tr>
			<td><h1>회원가입</h1></td>
			<td><br/></td>
		</tr>
		
		<tr>		
			<td> 아이디 :<input type="text" name="id" /><br/></td>
		</tr>
		
		<tr>
			<td> 비밀번호 : <input type="password" name="pw" /><br/></td>		
		</tr>
		
		<tr>
			<td> 이름 : <input type="text" name="name" /><br/></td>
		</tr>
		<tr>
			<td> 나이 : <input type="text" name="age" /><br/></td>
		</tr>
		
		<tr>
			<td>성별<br/>
			남자 <input type="radio" name="gender" value="male" checked/>
			여자<input type="radio" name="gender" value="female"/><br/></td>
		</tr>
		
		<tr>
			<td>이메일 : <input type="email" name="email"/></td>
			<td><br/></td>
		</tr>
		
		<tr>
			<td>Job<br/>
			<select name = "job">
			<option value ="owner"selected>Owner</option>
			<option value ="pro"> 전문직</option>
			<option value ="per">계약직</option>
			<option value ="part"> 알바</option>
			<option value ="slave">노예</option>
			</select>
			</td>
		</tr>
		
	
		<tr>
			<td>자기소개<br/>
			<textarea name="bio" rows="15" cols="30"></textarea></td>
		</tr>
		
		<tr>
		<td><input type="submit" value="submit"/>
		<input type="reset" value="reset"/></td>
		</tr>

	</table>
  </form>




</body>
</html>