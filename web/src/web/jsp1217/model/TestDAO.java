package web.jsp1217.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class TestDAO {
	// 자주 사용하는 클래스 3개 변수 인스턴스로 만들기
	private Connection conn = null; // private쓰는 이유 메서드 를 생성 했을 때만 사용 할 수 있게 
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	
	
	
	
	
	//#2. DB 연결을 담당하는 커넥션 메서드
	//Connection 타입
	private Connection getConnection()throws Exception{
		Context ctx = new InitialContext();
		Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)env.lookup("jdbc/orcl");
		Connection conn = ds.getConnection();
		// Connection 타입 의 conn 을 리턴
		return conn; // conn 리턴하면 getConnection() 메서드를 실행 해라 라는 뜻 이렇게 해서 저 네문장의 코드를 줄여 쓸 수 있음 (복붙 x)
	}
	
	
	
	
	// #1. 회원 정보 모두 가져오기
	public List selectAll() {
		List list = null;
		
		try {
			//conn = getConnection(); //Connection 타입에서 만들어 놓은 get Connection Throw 하는거 여기서 받음
			/*
			Context ctx = new InitialContext();
			Context env = (Context)ctx.lookup("java:comp/env");
			DataSource ds = (DataSource)env.lookup("jdbc/orcl");
			Connection conn = ds.getConnection();
			*/
			conn = getConnection();
			//String sql = "select * from test";
			pstmt = conn.prepareStatement("select * from test");
			rs = pstmt.executeQuery();
			
			list = new ArrayList();
			
				while(rs.next()) {
					//한 레코드의 정보를 DTO 단위로 하나씩 객체생성해 담아서 list에 각각추가
					TestDTO dto = new TestDTO();
				//	String id = rs.getString("id");
				//	dto.setId(id); // 원형 밑에 축약
					dto.setId(rs.getString("id"));
					
					String pw = rs.getString("pw");
					dto.setPw(pw);
					
					int age = rs.getInt("age");
					dto.setAge(age);
					
					Timestamp reg = rs.getTimestamp("reg");
					dto.setReg(reg);
					list.add(dto);
			//		list.add(id);
			//		list.add(pw);
			//		list.add(age);
			//		list.add(reg);
					
				}
		
			}catch(Exception e){
				e.printStackTrace();
			
		//DB연결
		//쿼리작성
		//결과 추출해 리스트에 담고
		//리스트 리턴
			}finally{
				//사용 후 객체 반
				if(rs != null)try {rs.close();}catch(SQLException e) {e.printStackTrace();}
				if(rs != null)try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
				if(rs != null)try {conn.close();}catch(SQLException e) {e.printStackTrace();}
				
			//	rs.close();
			//	pstmt.close();
			//	conn.close();
			}
		return list;	
	}
	// id들만 가져오는 메서드
	public List selectIds() {
		
		List list = null;
		
		try {
/*			Context ctx = new InitialContext();
			Context env = (Context)ctx.lookup("java:comp/env");
			DataSource ds = (DataSource)env.lookup("jdbc/orcl");
			더이상 ㄴ
	*/
			conn= getConnection();
			
			String sql= "select id from test";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			list = new ArrayList();
			while (rs.next()) {
				list.add(rs.getString("id"));
				
			}
			rs.close();
			pstmt.close();
			conn.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
	
	
	
	
	
	

}
