<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
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
<%
	/* 12/16에 훈련한 방법  [Way 1]
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String user = "java15", pw = "java15";
	String url = "jdbc:oracle:thin:@192.168.0.252:1521:ORCL";
	//커넥션을 하기위한 네가지 준비물 
	Connection conn = DriverManager.getConnection(url,user,pw);
	*/
	// Server > context.xml에 설정해놓은 Resource를 가지고와서 커넥션 작업 [Way 2]
	Context ctx = new InitialContext();
	// InitialContext 의 리턴타입을 context ctx 로 담겠다 라는 의미
	// InitialCointext()객체를 생성해서 Context 타입의 ctx 레퍼런스에 할당
	Context env = (Context)ctx.lookup("java:comp/env");
	// lookup은 찾아주는 기능을 가진 메서드 
	// java 기술로 만들어진 (java :)환경 정보만(comp/env) 찾아와서 context에 다시 담기 
	DataSource ds = (DataSource)env.lookup("jdbc/orcl");
	// 그걸 자바 orcl (jdbc/orcl) 로도 찾을거 인데  Servers/ context.xml/ recource 항목에 javax.sql.DateSource 형태이니까 형변화 해줄거다 
	//Type 속성에 지정해놓은 DataSource 로 담기.
	Connection conn = ds.getConnection();
	
	
	
	
	
	//#3. 쿼리문작성, PreparedStatement 객체 생성
	String sql = "select * from test";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	//#4. 쿼리 실행
	ResultSet rs = pstmt.executeQuery();
	//#5. 결과 추출 -> 출력
	while(rs.next()){
		String id = rs.getString("id");
		String passwd = rs.getString("pw");
		int age = rs.getInt("age");
		Timestamp reg = rs.getTimestamp("reg");
%>
		<p>id : <%=id %> / pw : <%=passwd %> / age : <%=age %> / reg : <%=reg %> / </p>
<%	}
	//#6. 객체 반환
	rs.close();
	pstmt.close();
	conn.close();
	
	


%>

<body>

</body>
</html>