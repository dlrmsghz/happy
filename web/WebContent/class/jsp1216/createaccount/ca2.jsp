<%@page import="java.sql.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ca2</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");

//	System.out.println("정보기입 값 저장");
//	response.sendRedirect("ca3.jsp");

	// #1. form 에서 보낸 데이터 받기
	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	int age = Integer.parseInt(request.getParameter("age"));
	String Namee=request.getParameter("Namee");
	String gender=request.getParameter("gender");
	String email=request.getParameter("email");
	String job=request.getParameter("job");
	String bio=request.getParameter("bio"); 

	
	
%>
<%	

	// #2. DB연결해서 저장
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String user = "java15", passwd = "java15";
	String url = "jdbc:oracle:thin:@192.168.0.252:1521:ORCL";
	Connection conn = DriverManager.getConnection(url, user, passwd);
	// 쿼리 작성, pstmt
	//String sql = "insert into test valuses("+id+", "+pw+", :"+age+", sysdate)"; 이렇게 해두면 해킹당하기 때문에 절대로 써서는 안되는 코드다 저얼대!!
	//insert into CA values('java', '1234', 10, sysdate)
	String sql = "insert into CA values(?,?,?,?,?,?,?,?,sysdate)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	//place holder (?로 치환시켜 놓은 곳)에 들어갈 값을 차례로 채워주기
	pstmt.setString(1,id);
	pstmt.setString(2,pw);
	pstmt.setInt(3,age);
	pstmt.setString(4,Namee);
	pstmt.setString(5,gender);
	pstmt.setString(6,email);
	pstmt.setString(7,job);
	pstmt.setString(8,bio);
	
	
	
	
	//쿼리 실행
	pstmt.executeUpdate();
		
	//객체 반환
	pstmt.close(); // close 순서 지킬 것
	conn.close();
	%>
	
	
	<h2> <%=id %> 님이 가입 완료되었습니다!!</h2>
<table>
	<tr> 
		<td>
			ID = <%=id%> <br/>
		</td>
	</tr>
	
	<tr> 
		<td>
			PW = <%=pw%><br/>
		</td>
	</tr>
	
	<tr> 
		<td>
			age = <%=age%>	<br/>
		</td>
	</tr>
	
	<tr> 
		<td>
			Namee = <%=Namee%>	<br/>
		</td>
	</tr>

	
	<tr> 
		<td>
			Gender = <%=gender%>	<br/>
		</td>
	</tr>
	
	<tr> 
		<td>
			Email = <%=email%>	<br/>
		</td>
	</tr>
	
	<tr> 
		<td>
			Job = <%=job%><br/>
		</td>
	</tr>
	
	
	<tr> 
		<td>자기소개 =<br/>
			<%=bio %>	<br/>
		</td>
	</tr>

</table>

	<h2> <%=id %> 님이 가입 완료되었습니다!!</h2>


</body>
</html>