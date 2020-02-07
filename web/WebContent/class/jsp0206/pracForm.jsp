<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 	<form action="/class/jsp0206/loginPro.jsp"> 원래 쓰던건데 web.xml 에 이렇게 받아오도록 컨트롤러 설정을 해뒀으니까 경로 지정 이렇게 해줌 -->
	<form action="/web/pracPro.kun">	<!-- JSP 파일에 넌 절대 경로를 다 적어주는 것이 더 효율적 -->
		<table>
			<tr> 
			
				<td>id : <input type = "text" name = "id"/></td>
				<td>pw : <input type = "password" name = "pw"/></td>
				<td><input type = "submit" value = "로그인"/></td> <!-- submit 누르면 파라미터( name 값 전부 들고 loginPro 로 넘어감)  이전까지는 이걸 pro 에서 getParameter 로 뽑아서 썻었는데 이제 컨트롤러를 거쳐옴
					 											그후에 DAO 객체 생성해서 String id= dao.idXX() 이런식으로 객체 생성 해서 썼는데 다 컨트롤러에서 다 해버리겠따 더이상 Pro에서 안할 것임  
						 												Pro 가서 확인-->
			</tr>			 												
		</table>					 												
	</form>
</body>
</html>