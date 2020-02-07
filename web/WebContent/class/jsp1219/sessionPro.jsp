<%@page import="web.jsp1219.model.TestDAO"%>
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
	String id =request.getParameter("id");
	String pw =request.getParameter("pw");
	//입력을 했는지 체크를 해줘야 되니까 DB 사용해야지 -> DAO 생성 
	// DAO 생성 완료 후 밑에 작업
	
	TestDAO dao = new TestDAO();
	boolean check = dao.loginCheck(id, pw);
	
	//check가 true이면 로그인이 잘된 상태 --> 세션을 만들어야 로그인상태로 세팅
	if(check == true){
		//세션 추가
		session.setAttribute("sid",id);
		session.setAttribute("spw",pw);
		
		
		//세션 생성하는 방법.
		//HttpSession session = request.getSession();
		
	}
	response.sendRedirect("sessionMain.jsp");
%>

</body>
</html>