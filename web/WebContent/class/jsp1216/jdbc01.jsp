<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> JDBC </title>
</head>
<body>

<%
	// #1. JDBC 드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");
	// #2. DB연결 : Connection 객체 생성
	String user = "java15", pw = "java15";
	String url = "jdbc:oracle:thin:@192.168.0.252:1521:ORCL";
	Connection conn = DriverManager.getConnection(url,user,pw);
	
	// #3. 쿼리문작성, Statement 객체 생성
	String sql = "select * from test";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	//conn.prepareStatement("select * from test"); 직접 기입도 가능
	
	// #4. 쿼리 실행
	ResultSet rs = pstmt.executeQuery();	
	// 결과를 ResultSet 타입으로 리턴해줌.
	
	// #5. 결과값 추출~사용
	while(rs.next()){
		String id = rs.getString("id");
		String passwd = rs.getString("pw");
		int age = rs.getInt("age");
		Timestamp reg = rs.getTimestamp("reg"); %>
		
		<h3>id : <%=id %> / pw : <%=passwd %> / age : <%=age %> / reg : <%=reg %> /</h3> 
		
		
<%		
	}
	
	// #6. 사용된 객체 반환시켜서 메모리 해제
		rs.close();
	pstmt.close();	
	// #7. 커넥션객체 변환
	conn.close();

%>

</body>
</html>