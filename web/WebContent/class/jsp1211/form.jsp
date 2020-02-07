<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form</title>
</head>
<body>
	

	<form action="post1.jsp" method="post">
		id : <input type ="text" name="id" /> <br/>
		pw : <input type ="password" name="pw" /> <br/>
		좋아하는 동물:
			<input type="checkbox" name = "pet" value="dog"  /> 강아지
			<input type="checkbox" name = "pet" value="cat" /> 고양이
			<input type="checkbox" name = "pet" value="tiger"  /> 호랑이
		
		
			 <input type ="submit" value='전송'/><br/>
	
			 
			 
	</form>

<!-- 주소창에서 값 변경 하는 방법 POST 형식의 특성  
http://localhost:8080/web/jsp1211/post1.jsp?id=sdfsadfasdf&pw=123123123 -->

</body>
</html>