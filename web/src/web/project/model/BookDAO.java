package web.project.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import web.jsp12.model.MemberDTO;

public class BookDAO {	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private static BookDAO instance = new BookDAO(); 
	private BookDAO() {}
	public static BookDAO getInstance() {
		return instance;
	}	
	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)env.lookup("jdbc/orcl");
		return ds.getConnection();
	}

	public void insertBook(BookDTO article) {
		String sql = "";
		try {
			conn = getConnection();
			sql = "insert into book_list values (book_list_seq.nextVal,?,?,?,?,?,?,?,?,sysdate,?)";			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,article.getName());
			pstmt.setString(2, article.getImg());
			pstmt.setInt(3, article.getPrice());
			pstmt.setString(4, article.getGenre());
			pstmt.setString(5, article.getWriter());
			pstmt.setString(6, article.getPublisher());
			pstmt.setString(7, article.getContent());
			pstmt.setString(8, article.getRegs());
			pstmt.setInt(9, article.getReadcount());
			pstmt.executeUpdate();			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
			if(conn != null) try {conn.close();}catch(SQLException e) {e.printStackTrace();}
		}	
	}
		public int getArticleCount() {
			int x = 0;
			try {
				conn = getConnection();
				String sql = "select count(*) from book_list";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					x = rs.getInt(1);
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
		public List getArticle(int start, int end) {
			List articleList = null;
			
			try {
				conn = getConnection();
				String sql = "select bk_num,bk_name,bk_img,bk_price,bk_genre,bk_writer,bk_publisher,bk_regs,bk_read_count,r "
						+ "from (select bk_num,bk_name,bk_img,bk_price,bk_genre,bk_writer,bk_publisher,bk_regs,bk_read_count,rownum r "
						+ "from (select bk_num,bk_name,bk_img,bk_price,bk_genre,bk_writer,bk_publisher,bk_regs,bk_read_count "
						+ "from book_list order by bk_num desc) order by bk_num desc)  "
						+ "where r >= ? and r <= ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					articleList = new ArrayList();
					do {
						BookDTO article = new BookDTO();
						article.setNum(rs.getInt("bk_num"));
						article.setName(rs.getString("bk_name"));
						article.setImg(rs.getString("bk_img"));
						article.setPrice(rs.getInt("bk_price"));
						article.setGenre(rs.getString("bk_genre"));
						article.setWriter(rs.getString("bk_writer"));
						article.setPublisher(rs.getString("bk_publisher"));
						article.setRegs(rs.getString("bk_regs"));
						article.setReadcount(rs.getInt("bk_read_count"));
						
						articleList.add(article);
						
					}while(rs.next());
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null) try {rs.close();}catch(SQLException e) {e.printStackTrace();}
				if(pstmt != null) try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
				if(conn != null) try {conn.close();}catch(SQLException e) {e.printStackTrace();}
			}		
			return articleList;
		}

		public BookDTO getArticle(int num) {
			BookDTO article = null;
			try {
				conn = getConnection();
				String sql = "update book_list set bk_read_count = bk_read_count + 1 where bk_num = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
				sql = "select * from book_list where bk_num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					article = new BookDTO();
					article.setNum(rs.getInt("bk_num"));
					article.setName(rs.getString("bk_name"));
					article.setImg(rs.getString("bk_img"));
					article.setPrice(rs.getInt("bk_price"));
					article.setGenre(rs.getString("bk_genre"));
					article.setWriter(rs.getString("bk_writer"));
					article.setPublisher(rs.getString("bk_publisher"));
					article.setContent(rs.getString("bk_content"));
					article.setRegs(rs.getString("bk_regs"));
					article.setReg(rs.getTimestamp("bk_reg"));
					article.setReadcount(rs.getInt("bk_read_count"));
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null) try {rs.close();}catch(SQLException e) {e.printStackTrace();}
				if(pstmt != null) try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
				if(conn != null) try {conn.close();}catch(SQLException e) {e.printStackTrace();}
			}		
			return article;
		}

		public void updateBook(BookDTO book) {
			try {
				conn = getConnection();
				String sql = "update book_list set bk_name=?, bk_img=?, bk_price=?, bk_publisher=?, bk_content=? where bk_num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, book.getName());
				pstmt.setString(2, book.getImg());
				pstmt.setInt(3, book.getPrice());
				pstmt.setString(4, book.getPublisher());
				pstmt.setString(5, book.getContent());
				pstmt.setInt(6, book.getNum());
				int r = pstmt.executeUpdate();
				System.out.println(r);
			}catch(Exception e) {
				e.printStackTrace();
			}finally{
				if(pstmt != null)try {pstmt.close();}catch(SQLException s) {}
				if(conn != null)try {conn.close();}catch(SQLException s) {}
			}
		}

		public void deleteBookList(int number) {	
			try {
				conn = getConnection();
				String sql = "delete from book_list where bk_num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, number);
				pstmt.executeQuery();		
			}catch(Exception e) {
				e.printStackTrace();
			}finally{
				if(pstmt != null)try {pstmt.close();}catch(SQLException s) {}
				if(conn != null)try {conn.close();}catch(SQLException s) {}
			}
		}

		public int getSearchArticleCount(String sel, String search) {
			int x = 0;
			try {
				conn = getConnection();
				String sql = "select count(*) from book_list where "+sel+" like '%"+search+"%'";
				pstmt = conn.prepareStatement(sql); // 쿼리문에서 search 가 들어간 sel 들을 긁어와라 like %search%
				rs = pstmt.executeQuery();
				if(rs.next()) {
					x = rs.getInt(1);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null) try { rs.close(); }catch(SQLException s) {}
				if(pstmt != null) try { pstmt.close(); }catch(SQLException s) {}
				if(conn != null) try { conn.close(); }catch(SQLException s) {}
			}
			return x;
		}
		
		public List getSearchArticles(int startRow, int endRow, String sel, String search) {
			List articleList = null;
			try {
				conn = getConnection();
				String sql = "select bk_num,bk_name,bk_img,bk_price,bk_genre,bk_writer,bk_publisher,bk_content,bk_regs,bk_reg,bk_read_count,r "
						+ "from (select bk_num,bk_name,bk_img,bk_price,bk_genre,bk_writer,bk_publisher,bk_content,bk_regs,bk_reg,bk_read_count, rownum r "
						+ "from (select * from book_list where "+sel+" like '%"+search+"%' order by bk_num desc) "
						+ "order by bk_num desc) where r >= ? and r <= ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					articleList = new ArrayList();
					do {
						BookDTO article = new BookDTO();
						article.setNum(rs.getInt("bk_num"));
						article.setName(rs.getString("bk_name"));
						article.setImg(rs.getString("bk_img"));
						article.setPrice(rs.getInt("bk_price"));
						article.setGenre(rs.getString("bk_genre"));
						article.setWriter(rs.getString("bk_writer"));
						article.setPublisher(rs.getString("bk_publisher"));
						article.setContent(rs.getString("bk_content"));
						article.setRegs(rs.getString("bk_regs"));
						article.setReg(rs.getTimestamp("bk_reg"));
						article.setReadcount(rs.getInt("bk_read_count"));
						articleList.add(article);
					}while(rs.next());
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null) try { rs.close(); }catch(SQLException s) {}
				if(pstmt != null) try { pstmt.close(); }catch(SQLException s) {}
				if(conn != null) try { conn.close(); }catch(SQLException s) {}
			}
			return articleList;
		}	

		public List getGenreArticle(String genre,int start, int end) {
			List articleList = null;
			
			try {
				conn = getConnection();
				String sql = "select bk_num,bk_name,bk_img,bk_price,bk_genre,bk_writer,bk_publisher,bk_regs,bk_read_count,r "
						+ "from (select bk_num,bk_name,bk_img,bk_price,bk_genre,bk_writer,bk_publisher,bk_regs,bk_read_count,rownum r "
						+ "from (select bk_num,bk_name,bk_img,bk_price,bk_genre,bk_writer,bk_publisher,bk_regs,bk_read_count "
						+ "from  book_list where bk_genre = ? order by bk_num desc) order by bk_num desc)  "
						+ "where r >= ? and r <= ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, genre);
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
				rs = pstmt.executeQuery();
				if(rs.next()
						) {
					articleList = new ArrayList();
					do {
						BookDTO article = new BookDTO();
						article.setNum(rs.getInt("bk_num"));
						article.setName(rs.getString("bk_name"));
						article.setImg(rs.getString("bk_img"));
						article.setPrice(rs.getInt("bk_price"));
						article.setGenre(rs.getString("bk_genre"));
						article.setWriter(rs.getString("bk_writer"));
						article.setPublisher(rs.getString("bk_publisher"));
						article.setRegs(rs.getString("bk_regs"));
						article.setReadcount(rs.getInt("bk_read_count"));
						
						articleList.add(article);
						
					}while(rs.next());
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null) try {rs.close();}catch(SQLException e) {e.printStackTrace();}
				if(pstmt != null) try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
				if(conn != null) try {conn.close();}catch(SQLException e) {e.printStackTrace();}
			}			
			return articleList;
				}

		public int getGenreArticleCount(String genre) {
			int x = 0;
			try {
				conn = getConnection();
				String sql = "select count(*) from book_list where bk_genre = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, genre);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					x = rs.getInt(1);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(rs != null) try {rs.close();}catch(SQLException e) {e.printStackTrace();}
				if(pstmt != null) try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
				if(conn != null) try {conn.close();}catch(SQLException e) {e.printStackTrace();}
			}
			return x;	
		}		
}
