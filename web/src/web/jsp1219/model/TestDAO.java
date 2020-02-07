package web.jsp1219.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class TestDAO {
	
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
			
			String sql = "select * from test where id=? and pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();

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

