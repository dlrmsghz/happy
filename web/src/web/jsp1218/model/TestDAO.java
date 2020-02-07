package web.jsp1218.model;

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
	public void insertMember(SignupFormVO dto) {
			try {
			conn=getConnection();
			
			String sql = "insert into CA values(?,?,?,?,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getId());
			pstmt.setString(2,dto.getPw());
			pstmt.setString(3,dto.getName());
			pstmt.setInt(4,dto.getAge());
			pstmt.setString(5,dto.getGender());
			pstmt.setString(6,dto.getEmail());
			pstmt.setString(7,dto.getJob());
			pstmt.setString(8,dto.getBio());
			
			pstmt.executeUpdate();  
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException e) {e.printStackTrace();}
			if(pstmt != null)try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
			if(conn != null)try {conn.close();}catch(SQLException e) {e.printStackTrace();}
		}
		
	}
}
