package web.jsp1219.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs=null;
	
	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)env.lookup("jdbc/orcl");
		return ds.getConnection();
	}
	public void insertMember(MemberDTO member) {
			
		try {
			conn = getConnection();
			
			String sql = "insert into member values(?,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getBirth());
			pstmt.setString(5, member.getEmail());
			
			rs = pstmt.executeQuery();

			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();}catch(SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
			if(conn!=null)try {conn.close();}catch(SQLException e) {e.printStackTrace();}
		}
	}
	// 로그인 확인 메서드 : id-pw 일치하는지 확인 
	public boolean loginCheck(String id, String pw) {
		boolean check = false;
		try {
			conn= getConnection();
			String sql="select * from member where id=? and pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				check = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs !=null) try {rs.close();}catch(SQLException e) {e.printStackTrace();}
			if(pstmt !=null) try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
			if(conn !=null) try {conn.close();}catch(SQLException e) {e.printStackTrace();}
		}return check;
	}	
	
	// 지정한 회원 정보 가져오기
	public MemberDTO getMember(String id) {
		MemberDTO member=null;
		try {
			conn = getConnection();
			String sql="select * from member where id=?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member=new MemberDTO();
				member.setId(rs.getString("id"));; // rs 에 저장된 id 값을 get 해서  member에 Id 값을 셋 해놔라
				member.setPw(rs.getString("pw"));;
				member.setName(rs.getString("name"));;
				member.setBirth(rs.getString("birth"));;
				member.setEmail(rs.getString("email"));;
				member.setReg(rs.getTimestamp("reg"));;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs !=null) try {rs.close();}catch(SQLException e) {e.printStackTrace();}
			if(pstmt !=null) try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
			if(conn !=null) try {conn.close();}catch(SQLException e) {e.printStackTrace();}			
		}
		return member;
	}
	//회원 정보 수정 메서드
	public void updateMember(MemberDTO member) {
		try {
			conn = getConnection();
			String sql="update member set pw=?, birth=?, email=? where id=?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, member.getPw());
			pstmt.setString(2, member.getBirth());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getId());
			
			pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(pstmt !=null) try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
			if(conn !=null) try {conn.close();}catch(SQLException e) {e.printStackTrace();}
		}
	}
	//회원 탈퇴 메서드
	public int deleteMember(String id, String pw){ //  이 메서드를 실행 시키려면  sql 에서 불러와서 수정 하는 두 값  아이디 비번을 적어 주는 형태로 기입을 해야함
		int x = -1;
		String dbpw ="";
		try {
			conn=getConnection();
			//DB에서 해당 id의 비번 가져오기
			String sql= "select pw from member where id=?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) { //db에서 꺼내온 pw가 있다면, 커서를 가르키고
				dbpw = rs.getString("pw");
				if(dbpw.equals(pw)) {
					//회원정보 삭제
					sql="delete from member where id=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					x =1; //회원 탈퇴 성공					
				}else {
					System.out.println("비번 오류");
					x = 0; //비밀번호 오류
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(pstmt !=null) try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
			if(conn !=null) try {conn.close();}catch(SQLException e) {e.printStackTrace();}
		}
	
	return x;	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}