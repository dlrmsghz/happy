<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
	request.setCharacterEncoding("UTF-8");

	String id =request.getParameter("id");
	String pw =request.getParameter("pw");
	String name =request.getParameter("name");
	int age =Integer.parseInt(request.getParameter("age"));
	String gender =request.getParameter("gender");
	String email =request.getParameter("email");
	String sweet =request.getParameter("sweet");
	String salty =request.getParameter("salty");
	String sour =request.getParameter("sour");
	String spicy =request.getParameter("spicy");
	String bitter =request.getParameter("bitter");
	String RED =request.getParameter("RED");
	//String[] flavor =request.getParameterValues("flavor");
	String animal =request.getParameter("animal");
	String bio =request.getParameter("bio");
%>
<%	

	// #2. DB연결해서 저장
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String user = "java15", passwd = "java15";
	String url = "jdbc:oracle:thin:@192.168.0.252:1521:ORCL";
	Connection conn = DriverManager.getConnection(url, user, passwd);
	// 쿼리 작성, pstmt

	String sql = "insert into VP values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	//place holder (?로 치환시켜 놓은 곳)에 들어갈 값을 차례로 채워주기
	pstmt.setString(1,id);
	pstmt.setString(2,pw);
	pstmt.setString(3,name);
	pstmt.setInt(4,age);
	pstmt.setString(5,gender);
	pstmt.setString(6,email);
	pstmt.setString(7,sweet);
	pstmt.setString(8,salty);
	pstmt.setString(9,sour);
	pstmt.setString(10,spicy);
	pstmt.setString(11,bitter);
	pstmt.setString(12,RED);
	pstmt.setString(13,animal);
	pstmt.setString(14,bio);

	
	
	
	
	//쿼리 실행
	pstmt.executeUpdate();
		
	//객체 반환
	pstmt.close(); // close 순서 지킬 것
	conn.close();
	%>
	
	
	<h1> <%=id %> 님이 가입 완료되었습니다!!<br/></h1>
	
	<table border="">
		<tr>
			<td colspan="2"> <jsp:include page="header.jsp"/></td>
		
		</tr>
		<tr>
			<td> 
				<jsp:include page="left.jsp"/>
			</td>
	
	
			<td>
				
				<form>
					<table border="" style="width: 750px;">
						
						<tr>
							<td>ID <br/><%=id %></td>	
									
						</tr>
						
						<tr>
							<td>PW <br/> <%=pw %></td>			
									
						</tr>
						
						<tr>
							<td>Name <br/><%=name %></td>		
									
						</tr>
						
						<tr>
							<td>Age <br/><%=age %></td>		
									
						</tr>
						
						<tr>
							<td>Gender <br/><%=gender %> </td>	
									
						</tr>
						
						<tr>
							<td>Email <br/><%=email %> </td>	
									
						</tr>
						
						<tr>
							<td>Flavor <br/>
							<% if (sweet==null){%>
							<%="" %>
						    <%}else{%>
						    <%=sweet %>
							<%}%>
							
							<% if (salty==null){%>
							<%="" %>
						    <%}else{%>
						    <%=salty %>
							<%}%>
							
							<% if (sour==null){%>
							<%="" %>
						    <%}else{%>
						    <%=sour %>
							<%}%>
							
							<% if (spicy==null){%>
							<%="" %>
						    <%}else{%>
						    <%=spicy %>
							<%}%>
							
							<% if (bitter==null){%>
							<%="" %>
						    <%}else{%>
						    <%=bitter %>
							<%}%>
							
							<% if (RED==null){%>
							<%="" %>
						    <%}else{%>
						    <%=RED %>
							<%}%>	
												    
							</td>	
									
						</tr>
					
						<tr>					
							<td>Favorite animal<br/><%=animal %></td>			
										
						</tr>
							
						<tr>
							<td>Bio<br/><%=bio %></td>
									
						</tr>
		
												
					</table>
				</form>		
			</td>
		</tr>	
		<tr>
			<td colspan="2"><jsp:include page ="bottom.jsp"/></td>
		</tr>
	  
	</table>


</body>
</html>