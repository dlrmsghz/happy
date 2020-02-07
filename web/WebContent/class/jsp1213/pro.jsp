<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:useBean id="vo" class="web.jsp1213.test.FormVO"/>

<body>

		<% request.setCharacterEncoding("UTF-8"); %>
		<jsp:setProperty name="vo" property="*"/>
		<%--
		<jsp:setProperty name="vo property="id"/>
		<jsp:setProperty name="vo property="pw"/>
		<jsp:setProperty name="vo property="name"/>
		<jsp:setProperty name="vo property="age"/>
		--%>
		
		
		id: <jsp:getProperty name="vo" property="id"/> <br/>
		id: <jsp:getProperty name="vo" property="pw"/> <br/>
		id: <jsp:getProperty name="vo" property="name"/> <br/>
		id: <jsp:getProperty name="vo" property="age"/> <br/>

</body>
</html>














	<%  
	
		//	String id = request.getParameter("id");
	//	String pw = request.getParameter("pw");
	//	String name = request.getParameter("name");
	//	int age = Integer.parseInt(request.getParameter("age"));
	//	
		// 위 데이터를 담을 수 있는 빈 작성. FormVO
	//
	//	vo.setId(id);
	//	vo.setPw(pw);
	//	vo.setName(name);
	//	vo.setAge(age);
	%>
