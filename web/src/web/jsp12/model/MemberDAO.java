package web.jsp12.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	// 싱글턴 : DAO클래스자체를 싱글턴으로 만들어 jsp 페이지 마다 DAO객체 생성을 못하게 하기위해(메모리 낭비 막기)
	private static MemberDAO instance = new MemberDAO();
	private MemberDAO() {}
	public static MemberDAO getInstance() {
		return instance;
	}
	
	// 커넥션풀
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();						
		Context env = (Context)ctx.lookup("java:comp/env");		
		DataSource ds = (DataSource)env.lookup("jdbc/orcl");		
		return ds.getConnection();
	}
	
	// 회원가입
	public void insertMember(MemberDTO dto) {
		try {
			conn = getConnection();
			String sql = "insert into imgMember values(?,?,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getBirth());
			pstmt.setString(5, dto.getEmail());			
			pstmt.setString(6, dto.getPhoto());			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) try {pstmt.close();}catch(SQLException s) {}
			if(conn != null) try {conn.close();}catch(SQLException s) {}
		}
	}
	
	// 로그인 확인 메서드
	public boolean loginCheck(String id, String pw) {
		boolean result = false;
		try {
			conn = getConnection();
			String sql = "select * from imgMember where id=? and pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException s) {}
			if(pstmt != null)try {pstmt.close();}catch(SQLException s) {}
			if(conn != null)try {conn.close();}catch(SQLException s) {}
		}
		return result;
	}
	
	// 지정 회원정보 가져오기
	public MemberDTO getMember(String id) {
		MemberDTO member = null;
		try {
			conn = getConnection();
			String sql = "select * from imgMember where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new MemberDTO();
				member.setId(rs.getString("id"));
				member.setPw(rs.getString("pw"));
				member.setName(rs.getString("name"));
				member.setBirth(rs.getString("birth"));
				member.setEmail(rs.getString("email"));
				member.setPhoto(rs.getString("photo"));
				member.setReg(rs.getTimestamp("reg"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			if(rs != null)try {rs.close();}catch(SQLException s) {}
			if(pstmt != null)try {pstmt.close();}catch(SQLException s) {}
			if(conn != null)try {conn.close();}catch(SQLException s) {}
		}
		return member;
	}
	
	// 회원정보 수정
	public void updateMember(MemberDTO member) {
		try {
			conn = getConnection();
			String sql = "update imgMember set pw=?, birth=?, email=?, photo=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getPw());
			pstmt.setString(2, member.getBirth());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getPhoto());
			pstmt.setString(5, member.getId());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			if(pstmt != null)try {pstmt.close();}catch(SQLException s) {}
			if(conn != null)try {conn.close();}catch(SQLException s) {}
		}
	}
	
	// 회원 탈퇴
	public int deleteMember(String id, String pw) {
		int x = -1;
		String dbpw = "";
		try {
			conn = getConnection();
			// DB���� �ش� id�� �����������
			String sql = "select pw from imgMember where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dbpw = rs.getString("pw");
				// DB�� ����� �Է��� ��� ��Ȯ�� 
				if(dbpw.equals(pw)) {
					// ȸ����������
					sql = "delete from imgMember where id=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);
					pstmt.executeQuery();
					x = 1;	// ȸ��Ż�� ����
				}else {
					System.out.println("�������");
					x = 0;	// ��й�ȣ ����
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			if(rs != null)try {rs.close();}catch(SQLException s) {}
			if(pstmt != null)try {pstmt.close();}catch(SQLException s) {}
			if(conn != null)try {conn.close();}catch(SQLException s) {}
		}
		return x;
	}
	
	// id 확인
	public int confirmId(String id) {
		int x = -1;
		try {
			conn = getConnection();
			String sql = "select id from imgMember where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException s) {}
			if(pstmt != null)try {pstmt.close();}catch(SQLException s) {}
			if(conn != null)try {conn.close();}catch(SQLException s) {}
		}
		return x;
	}
	
	// # jsp12 추가 : 지정한 회원수 돌려주기
	public int getSearchMemberCount(String selector, String search) {
		int x = 0;
		try {
			conn = getConnection();
			String sql = "select count(*) from imgMember where "+selector+" like '%"+search+"%'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException s) {}
			if(pstmt != null)try {pstmt.close();}catch(SQLException s) {}
			if(conn != null)try {conn.close();}catch(SQLException s) {}
		}
		return x;
	}

	// # jsp12 추가 : 전체 회원수 돌려주기
	public int getMemberCount() {
		int x = 0; 
		try {
			conn = getConnection();
			String sql = "select count(*) from imgMember";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException s) {}
			if(pstmt != null)try {pstmt.close();}catch(SQLException s) {}
			if(conn != null)try {conn.close();}catch(SQLException s) {}
		}
		return x;
	}
	// # jsp12 추가 : 지정한 회원 리스트로 돌려주기
	public List getSearchMemberList(int startRow, int endRow, String selector, String search) {
		List memberList = null;
		try {
			conn = getConnection();
			String sql = "select id,pw,name,birth,email,photo,reg,r "
			+ "from (select id,pw,name,birth,email,photo,reg,rownum r "
			+ "from (select * from imgMember where "+selector+" like '%"+search+"%')) where r >= ? and r <= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				memberList = new ArrayList();
				do {
					MemberDTO member = new MemberDTO();
					member.setId(rs.getString("id"));
					member.setPw(rs.getString("pw"));
					member.setName(rs.getString("name"));
					member.setBirth(rs.getString("birth"));
					member.setEmail(rs.getString("email"));
					member.setPhoto(rs.getString("photo"));
					member.setReg(rs.getTimestamp("reg"));
					memberList.add(member);
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException s) {}
			if(pstmt != null)try {pstmt.close();}catch(SQLException s) {}
			if(conn != null)try {conn.close();}catch(SQLException s) {}
		}
		return memberList;
	}
	// # jsp12 추가 : 전체 회원 리스트로 돌려주기
	public List getMemberList(int startRow, int endRow) {
		List memberList = null;
		try {
			conn = getConnection();
			String sql = "select id,pw,name,birth,email,photo,reg,r "
			+ "from (select id,pw,name,birth,email,photo,reg,rownum r "
			+ "from (select * from imgMember)) where r >= ? and r <= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				memberList = new ArrayList();
				do {
					MemberDTO member = new MemberDTO();
					member.setId(rs.getString("id"));
					member.setPw(rs.getString("pw"));
					member.setName(rs.getString("name"));
					member.setBirth(rs.getString("birth"));
					member.setEmail(rs.getString("email"));
					member.setPhoto(rs.getString("photo"));
					member.setReg(rs.getTimestamp("reg"));
					memberList.add(member);
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException s) {}
			if(pstmt != null)try {pstmt.close();}catch(SQLException s) {}
			if(conn != null)try {conn.close();}catch(SQLException s) {}
		}
		return memberList;
	}
	
}
