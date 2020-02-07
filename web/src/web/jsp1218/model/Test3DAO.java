package web.jsp1218.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Test3DAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs=null;
	
	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)env.lookup("jdbc/orcl");
		return ds.getConnection();
	}
	public boolean loginCheck(String id, String pw) {
		boolean result = false;
		
		try {
			conn = getConnection();
			//id 와  pw가 존재하는지 확인. 두개다 일치 하면 하나 긁어 올거고  둘중 하나라도 불일치면 아무것도 안긁어 옴
			String sql = "select * from test where id=? and pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery(); // 쿼리 실행해서 결과 받아오기
			// rs에 결과가 있으면 id/pw 일치
			// rs에 결과가 없으면 id/pw 불일치
			if(rs.next()) {
				result=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();}catch(SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
			if(conn!=null)try {conn.close();}catch(SQLException e) {e.printStackTrace();}
		}return result;
	}
	
	

}
