<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		int check = (Integer)request.getAttribute("check"); //getAttribute 로 가져오면 전부 Obeject 상태로 가져오기 때문에 int 로 형변환 해줘야 함
		if(check==1){
			out.println("로그인 성공!!");
		}else{
			out.println("로그인 실패!!");	
		}
	%>
	
</body>
</html>