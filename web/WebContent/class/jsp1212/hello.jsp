<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table width="400" border="1">
	<tr>
		<td colspan="2">헤더</td>
		<jsp:include page="header.jsp"/>
	</tr>
	<tr>
		<td>left</td>
		<jsp:include page="left.jsp"/>
	</tr>
	<tr>
		<td colspan="2">푸터</td>
		<jsp:include page="footer.jsp"/>
	</tr>
	<tr>
		<td></td>
	</tr>
	
	
	
	





  <form action="ca2.jsp" method="post"> <!-- 이거 post get 관련자료 한번 찾아서 볼것!!!!!!!!!!! --> 
  <table>
	<tr>
		<td><h1>회원가입</h1></td>
		<td><br/></td>
	</tr>
	
	<tr>
		<td> 아이디 :<input type="text" name="id" /></tr>
		<td><br/></td>
	</tr>
	
	<tr>
		<td> 비밀번호 : <input type="password" name="pw" /></tr>
		<td><br/></td>
	</tr>
	
	<tr>
		<td> 이름 : <input type="text" name="Name" /></td>
		<td><br/></td>
	</tr>
	
	<tr>
		<td>성별<br/></td>
		<td>남자 <input type="radio" name="gender" value="male" checked/><br/></td>
		<td>여자<input type="radio" name="gender" value="female"/><br/></td>
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
		<td>인생의 정답</tr>
		<td><input type="checkbox" name="nothing" value="없음"/><br/>없음</td>
		<td><input type="checkbox" name="nothing" value="없음"/><br/>없음</td>
		<td><input type="checkbox" name="nothing" value="없음"/><br/>없음</td>
		<td><input type="checkbox" name="nothing" value="없음"/><br/>없음</td>
		<td><input type="checkbox" name="nothing" value="없음"/><br/>없음</td>
	</tr>
	
	<tr>
		<td>자기소개<br/>
		<textarea name="bio" rows="15" cols="30"></textarea></td>
	</tr>
	
	<tr>
	<td><input type="submit" value="가입완료"/>
	<input type="reset" value="다시기입"/></td>
	</tr>
	</table>
  </form>
</table>

</body>
</html>