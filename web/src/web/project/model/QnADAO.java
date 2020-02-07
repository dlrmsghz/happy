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

import web.project.model.*;

public class QnADAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private static QnADAO instance = new QnADAO(); 
	private QnADAO() {}
	public static QnADAO getInstance() { 
		return instance;
	}
	
	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)env.lookup("jdbc/orcl");
		return ds.getConnection();
	}
	
	public void insertArticle(QnADTO article) {
		int num = article.getNum();				
		int number = 0;							
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select max(num) from qna");
			rs = pstmt.executeQuery();
			if(rs.next()) number = rs.getInt(1) + 1; 
			else number = 1;
			String sql = "insert into qna(num, writer, title, email, content, reg) values("
					+ "qna_seq.nextval,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getTitle());
			pstmt.setString(3, article.getEmail());
			pstmt.setString(4, article.getContent());
			pstmt.setTimestamp(5, article.getReg());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException e) {e.printStackTrace();}
			if(pstmt != null)try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
			if(conn != null)try {conn.close();}catch(SQLException e) {e.printStackTrace();}
		}
	} 

	public int getArticleCount() {
		int x = 0;
		try {
			conn = getConnection();
			String sql = "select count(*) from qna";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException e) {e.printStackTrace();}
			if(pstmt != null)try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
			if(conn != null)try {conn.close();}catch(SQLException e) {e.printStackTrace();}
		}
		return x;
	} 

	public List getArticles(int start, int end) {
		List articleList = null;
		try {
			conn = getConnection();
			String sql = "select num,writer,title,email,content,reg,read_count,r "
		               + "from (select num,writer,title,email,content,reg,read_count,rownum r "
		               + "from (select num,writer,title,email,content,reg,read_count "
		               + "from qna order by num desc) order by num desc) "
		               + "where r >= ? and r <= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				articleList = new ArrayList(end);
				do {
					QnADTO article = new QnADTO();
					article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setTitle(rs.getString("title"));
					article.setEmail(rs.getString("email"));
					article.setContent(rs.getString("content"));
					article.setReg(rs.getTimestamp("reg"));
					article.setRead_count(rs.getInt("read_count"));
					articleList.add(article);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException e) {e.printStackTrace();}
			if(pstmt != null)try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
			if(conn != null)try {conn.close();}catch(SQLException e) {e.printStackTrace();}
		}
		return articleList;
	} 

	public QnADTO getArticle(int num) {
		QnADTO article = null;
		try {
			conn = getConnection();
			String sql = "update qna set read_count=read_count+1 where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			sql = "select * from qna where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				article = new QnADTO();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setTitle(rs.getString("title"));
				article.setEmail(rs.getString("email"));
				article.setContent(rs.getString("content"));
				article.setReg(rs.getTimestamp("reg"));
				article.setRead_count(rs.getInt("read_count"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException e) {e.printStackTrace();}
			if(pstmt != null)try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
			if(conn != null)try {conn.close();}catch(SQLException e) {e.printStackTrace();}
		}
		return article;
	} 

	public void updateArticle(QnADTO article) {
		try {
				conn = getConnection();
				String sql = "update qna set writer=?, title=?, email=?, content=? where num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, article.getWriter());
				pstmt.setString(2, article.getTitle());
				pstmt.setString(3, article.getEmail());
				pstmt.setString(4, article.getContent());
				pstmt.setInt(5, article.getNum());
				pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally{
				if(pstmt != null)try {pstmt.close();}catch(SQLException s) {}
				if(conn != null)try {conn.close();}catch(SQLException s) {}
			}
	} 

	public void deleteArticle(QnADTO article) {
		try{
	        conn = getConnection();
	        String sql = "delete from qna where num=?";	
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, article.getNum());
	        pstmt.executeQuery();	   
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }finally{
	    	if(rs != null)try{rs.close();}catch(SQLException e){}
	    	if(pstmt != null)try{pstmt.close();}catch(SQLException e){}
	        if(conn != null)try{conn.close();}catch(SQLException e){}
	    }
	}		
}
