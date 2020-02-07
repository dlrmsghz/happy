<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>main</title>
	<link href="style.css" rel="stylesheet" type="text/css">
</head>
<%
	
	if(session.getAttribute("memId")==null){
		String id = null, pw = null, auto= null;
		Cookie[] cs = request.getCookies();	
		if(cs !=null){
			for(Cookie coo:cs){		
				if(coo.getName().equals("autoId")) {id=coo.getValue();}
				if(coo.getName().equals("autoPw")) {pw=coo.getValue();}
				if(coo.getName().equals("autoCh")) {auto=coo.getValue();}
			}
		}
		
		if(auto !=null && id !=null && pw!=null){
			response.sendRedirect("loginPro.jsp");	
		}
%>		
		<body>
			<br/>
			<h1 align="center">메인페이지</h1>
			<table>
				<tr>
					<td>로그인 원하시면 버튼을 누르세요<br/>
						<button onclick="window.location.href='loginForm.jsp'">로그인</button>
					</td>
				</tr>
				<tr>
					<td>
						<a href="signupForm.jsp">회원가입</a>
					</td>
				</tr>
			</table>
			<br/><br/><br/><br/>
			<div align="center">
				<img src="img/forest.jpg" width="800"/>
			</div>
		</body>
<%		}else{//로그인 된 상태%>
		<body>
			<br/>
			<h1 align="center">메인페이지</h1>
			<table>
				<tr>
					<td><%=session.getAttribute("memId")%>님 환영합니다.<br/>
						<button onclick="window.location.href='logout.jsp'">로그아웃</button>
						<button onclick="window.location.href='modify.jsp'">회원정보변경</button>
					</td>
				</tr>
			</table>
			<br/><br/><br/><br/>
			<div align="center">
				<img src="img/forest.jpg" width="800"/>
			</div>
		</body>	
<%	}
%>
</html>