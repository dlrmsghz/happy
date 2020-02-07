package web.project.model.K;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import web.project.model.MemberDTO;

public class MemberDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)env.lookup("jdbc/orcl");		
		return ds.getConnection();
	}
	
	// 회원가입 메서드
	public void insertMember(MemberDTO member) {
		try {
			conn = getConnection();
			String sql = "insert into book_member values(?,?,?,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getPhone());
			pstmt.setString(5, member.getEmail());
			pstmt.setInt(6, member.getMoney());
			pstmt.setString(7, member.getCart());
			pstmt.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null)try {pstmt.close();}catch(SQLException e) {}
			if(conn != null)try {conn.close();}catch(SQLException e) {}
		}
	}
	
	// 아이디 중복 확인 메서드
	public boolean mConfirmId(String id) {
		boolean check = false;
		try {			
			conn = getConnection();
			String sql = "select bk_id from book_member where bk_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				check = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException e) {e.printStackTrace();}
			if(pstmt != null)try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
			if(conn != null)try {conn.close();}catch(SQLException e) {e.printStackTrace();}
		}
		
		return check;
	}
	
	
	// 로그인 메서드
	public boolean mLoginCheck(String id ,String pw) {
		boolean check = false;
		try {
			conn = getConnection();
			String sql = "select * from book_member where bk_id=? and bk_pw=?";
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
			if(rs != null) try {rs.close();}catch(SQLException e) {e.printStackTrace();}
			if(pstmt != null) try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
			if(conn != null) try {conn.close();}catch(SQLException e) {e.printStackTrace();}
		}
		
		return check;		
	}
	
	// 지정한 회원정보 가져오기
	public MemberDTO getMember(String id) {
		MemberDTO member = null;
		try {
			conn = getConnection();
			String sql = "select * from book_member where bk_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member = new MemberDTO();
				member.setId(rs.getString("bk_id"));
				member.setPw(rs.getString("bk_pw"));
				member.setName(rs.getString("bk_name"));
				member.setPhone(rs.getString("bk_phone"));
				member.setEmail(rs.getString("bk_email"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException e) {e.printStackTrace();}
			if(pstmt != null) try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
			if(conn != null) try {conn.close();}catch(SQLException e) {e.printStackTrace();}
		}
		return member;
	}
	
	
	
	
	// 회원정보 수정 메서드
	
	public void updateMember(MemberDTO member) {	
		try {
			conn = getConnection();
			String sql = "update book_member set bk_pw=?, bk_phone=?, bk_email=? where bk_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getPw());
			pstmt.setString(2, member.getPhone());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getId());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null)try {pstmt.close();}catch(SQLException e) {}
			if(conn != null)try {conn.close();}catch(SQLException e) {}
		}
	}
	
	// 회원 탈퇴 메서드
		public int deleteMember(String id, String pw) {
			int x = -1;			// id가 일치 하지 않는 경우 
			String dbpw = "";
			try {
				conn = getConnection();
				// DB에서 해당 id의 비번 가져오기
				String sql = "select bk_pw from book_member where bk_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				if(rs.next()) {		// db에서 꺼내온 pw가 있다면, 커서를 가르키고
					dbpw = rs.getString("bk_pw");
					if(dbpw.equals(pw)) { // 비번이 서로 일치하면
						// 회원정보 삭제
						sql = "delete from book_member where bk_id=?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, id);
						pstmt.executeUpdate();
						x = 1;	// 회원 탈퇴 성공
					}else {  // 비번이 서로 일치하지 않을 경우
						x = 0;	// 비밀번호 오류
					}
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null) try {rs.close();}catch(SQLException e) {e.printStackTrace();}
				if(pstmt != null) try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
				if(conn != null) try {conn.close();}catch(SQLException e) {e.printStackTrace();}
			}
			return x;
		}
	
		//책 장바구니에 저장하는 메소드
		public void addBook(String id, String num) {
			String bk_cart = null;
			try {
				conn = getConnection();
				
				String sql = "select bk_cart from book_member where bk_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if(rs.next()) { 
					bk_cart = rs.getString(1);
					if(bk_cart == null) {
						bk_cart = ","+num+",";
					}else {
						bk_cart = bk_cart + num + ",";
					}
				}
				
				
				sql = "update book_member set bk_cart= ? where bk_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bk_cart);
				pstmt.setString(2, id);
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null) try {rs.close();}catch(SQLException e) {e.printStackTrace();}
				if(pstmt != null) try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
				if(conn != null) try {conn.close();}catch(SQLException e) {e.printStackTrace();}
			}
			
			
		}
		
		// 회원 장바구니에 담긴걸 꺼내오는 메서드
		public String getCart(String id) {
			String book_cart = null;
			try {
				conn = getConnection();
				String sql = "select bk_cart from book_member where bk_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					book_cart = rs.getString("bk_cart");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null) try {rs.close();}catch(SQLException e) {e.printStackTrace();}
				if(pstmt != null) try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
				if(conn != null) try {conn.close();}catch(SQLException e) {e.printStackTrace();}
			}
			return book_cart; 
		}
		// 콜룸에서 삭제
		public List deleteCart(String num) { // 삭제를 위해 불러오기 위한 툴
			
			List deletelist = null;
			
			try {
				conn = getConnection();
				String sql = "select bk_id, bk_cart from book_member where bk_cart like '%,"+num+",%'";
				System.out.println("sql 뭐뜨지 : " +sql);
				pstmt = conn.prepareStatement(sql);
				// ? (space holder) 가 있을경우 아래 setString(1, id) 같이 체워준다. 이경우는 필요없으니 작성하면 오류생김.
				//pstmt.setString(1, id); 
				//pstmt.setString(2, num); 
				rs = pstmt.executeQuery();
				if(rs.next()) { //얘를 while로 수정하고
					deletelist = new ArrayList();
					
					do{
						MemberDTO del = new MemberDTO();
						del.setId(rs.getString("bk_id"));
						del.setCart(rs.getString("bk_cart"));
						
						deletelist.add(del);
						
					}while(rs.next());{}
								
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null) try {rs.close();}catch(SQLException e) {e.printStackTrace();}
				if(pstmt != null) try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
				if(conn != null) try {conn.close();}catch(SQLException e) {e.printStackTrace();}
			}
			return deletelist; 
		}
		
		public void updateBk_cart(String id, String bk_cart) {
		/* String[] newSize = null; */
			try {
				conn = getConnection();
				
			/*
			 * String sql = "select bk_cart from book_member where bk_id=?"; pstmt =
			 * conn.prepareStatement(sql); pstmt.setString(1, newSize); rs =
			 * pstmt.executeQuery(); if(rs.next()) { bk_cart = rs.getString(1); if(bk_cart
			 * == null) { bk_cart = newSize + ","; }else { bk_cart = bk_cart + newSize +
			 * ","; } }
			 */
				// set bk_cart = ?
				
				String sql = "update book_member set bk_cart=? where bk_id=?";
				System.out.println("sql 뭐뜨지 : " +sql);
//				MemberDTO del = new MemberDTO();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bk_cart);
				pstmt.setString(2, id);
				
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				close(conn, pstmt, rs);
			}
			
			
		}
	
		public void close(Connection conn,PreparedStatement pstmt,ResultSet rs) {
		      
	         if(rs!=null) {
	            try {
	               rs.close();
	            }
	            catch(SQLException e){
	               e.printStackTrace();
	            }
	         }
	         if(pstmt!=null) {
	            try {
	               pstmt.close();
	            }
	            catch(SQLException e){
	               e.printStackTrace();
	            }
	         }
	         if(conn!=null) {
	            try {
	               conn.close();
	            }
	            catch(SQLException e){
	               e.printStackTrace();
	            }
	         
	         }
	      }
		
		
	
	}


	
	
	
	
	
	
	
	
	
	
	
	
	
	

