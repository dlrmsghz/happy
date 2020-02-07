<%@page import="web.jsp1217.model.TestDTO"%>
<%@page import="web.jsp1217.model.Test2DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="dto" class="web.jsp1217.model.TestDTO"/>
<%--form 페이지에서 넘어온 데이터들 모두 dto에 set메서드 호출하여 저장 --%>
<jsp:setProperty property="*" name = "dto"/>

<%
	// 회원가입  로직
	//form 에서 넘어온 데이터 뽑기
//	String id = request.getParameter("id");
	//String pw = request.getParameter("pw");
//	int age = Integer.parseInt(request.getParameter("age"));
	
	// db 연결해서 form 에서 받은 데이터를 db에 저장
	Test2DAO dao = new Test2DAO();
	//TestDTO dto = new TestDTO();
	//dto.setId(id);
	//dto.setPw(pw);
	//dto.setAge(age);		
	dao.insertMember(dto);
	
	 
	
%>


<body>
	
	<h3><jsp:getProperty property="id" name="dto"/> 회원가입 완료!!</h3>
	<h3><%=dto.getId() %> 회원가입 완료!!</h3>

</body>
</html>