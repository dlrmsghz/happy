package web.jsp1218.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Test2DAO {
	
	// 자주 사용하는 클래스 3개
	private Connection conn = null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	
	// 커넥션 메서드
	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)env.lookup("jdbc/orcl");		
		return ds.getConnection();		
	}
	
	// 회원가입 메서드 : DB에 전체 회원이 가입한 데이터 저장
	public void insertMember(TestDTO dto) {
		//id, pw, age, reg(sysdate)
		try {
			//db 커넥션 필요
			conn=getConnection();
			//쿼리 작성
			String sql = "insert into test values(?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1,id);
			pstmt.setString(1,dto.getId());
			//pstmt.setString(2,pw);
			pstmt.setString(2,dto.getPw());
			//pstmt.setInt(3,age);
			pstmt.setInt(3,dto.getAge());
			//쿼리 실행
			pstmt.executeUpdate();  // db 내용 좀 업데이트 해줘
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(pstmt != null)try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
			if(conn != null)try {conn.close();}catch(SQLException e) {e.printStackTrace();}
			
		}
		
		
	}
}
