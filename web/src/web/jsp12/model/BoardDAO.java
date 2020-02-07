package web.jsp12.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	// 프로그램 시작하면 클래스 실행하고  static이 가장 먼지 실행됨
	//private 안 붙으면 외부에서 DAO.instance = null;.
	
	
	private static BoardDAO instance = new BoardDAO(); // set메서드 같은 느낌임 instance 이름의 객체를 내 클래스 타입으로 내부 생성함  static 이니까 내부에서 딱 한번만 생성하고 끝 3.instance 를 private 으로 생성 (보드 DAO 전체를 다 가져다 쓰게 되는 것)
	// static  특징이 클래스명.변수명 꼴로 불러서 실생할 수 있는건데 new 로 객채 생성 하는걸 막았으니까 스태틱을 줘서 이렇게 실행 할 수 있게 만듬
	private BoardDAO() {} //4. 생성자가 private 이니까 클래스 밖에서는 객체 생성 못하게 막아버리는 이 메서드의 핵심 , 빡에서 new로 생성해서 객체 변환 못시키게 막음
	public static BoardDAO getInstance() { //인스턴스는 밖에서 객체 생성 해야 쓸 수 있는데  그걸 private 으로 막아놨으니까 static 줘서 위와 동일 하게 사용 하늘 수 있도록 만들어줌 // 1. 메서드 호출
		return instance; //2. instance (자신의 객체) 를 리턴 // 위에 instance 객체에 전부 담겨있음 private static BoardDAO instance = new BoardDAO(); instance 객체 로 자기 자신 boarddao 타입을 생성 해놨으니까 instance 안에 전부 값이 담겨있음
	}
	
	private Connection getConnection() throws Exception  {
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/orcl");
		return ds.getConnection();
	}
	

	public int getArticleCount() {
		int x = 0;
		try {
			conn = getConnection();
			String sql = "select count(*) from board"; //전체 게시글 숫자
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {				
				x = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try { rs.close(); }catch(SQLException s) {}
			if(pstmt != null) try { pstmt.close(); }catch(SQLException s) {}
			if(conn != null) try { conn.close(); }catch(SQLException s) {}
		}
		return x;
	}
	
	// 게시글들 (전체) 가져오기
	public List getArticles(int start, int end) { // 디비에 있는 항목들    num, writer, subject... 등등 을 어레이리스트에 한줄 씩 담아주려고 
		List articleList = null;	// list 타입의 어레이 리스트 변수 선언
		try {
			conn = getConnection();
			String sql = "select num,writer,subject,email,content,pw,reg,readcount,ip,ref,re_step,re_level,r "
					+ "from (select num,writer,subject,email,content,pw,reg,readcount,ip,ref,re_step,re_level,rownum r " // 3. 정렬을 한거에서 숫자를 한번 더 붙힘(rowrum r 이 오라클에서 지정한 숫자를 뿌려주는(인덱스처럼) 콜룸 생성 하는 명렁 어)
					+ "from (select num,writer,subject,email,content,pw,reg,readcount,ip,ref,re_step,re_level " // 2. 정렬을 한거 에서 한번 더 뽑음
					+ "from board order by ref desc, re_step asc) order by ref desc, re_step asc) where r >= ? and r <= ?"; // 1. 정렬을 한번 하고
					// ref desc -> 커리문에서 가져올때 애초에 차순(내림 desc, 오름 asc)으로 정리해서 가져옴 
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				articleList = new ArrayList(end);
				do {
					BoardDTO article = new BoardDTO(); 
					article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setSubject(rs.getString("subject"));
					article.setEmail(rs.getString("email"));
					article.setContent(rs.getString("content"));
					article.setPw(rs.getString("pw"));
					article.setReg(rs.getTimestamp("reg"));
					article.setReadcount(rs.getInt("readcount"));
					article.setIp(rs.getString("ip"));
					article.setRef(rs.getInt("ref"));
					article.setRe_step(rs.getInt("re_step"));
					article.setRe_level(rs.getInt("re_level"));
					articleList.add(article);
				}while(rs.next()); //에리이 리스트에 dto 추가  반복 (모든게시글을 다 담을 때 까지)
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try { rs.close(); }catch(SQLException s) {}
			if(pstmt != null) try { pstmt.close(); }catch(SQLException s) {}
			if(conn != null) try { conn.close(); }catch(SQLException s) {}
		}
		return articleList;  // 다담으면 articlelist 로 리턴 해주고  boardlist 에 메서드 호출 한곳으로 쏨  #연결 자리 표식######
	}
	
	// 게시글 저장
	public void insertArticle(BoardDTO article) {
		// 조정, 확인이 필요한 값들 꺼내기
		int num = article.getNum();					// 글번호(새글작성이면 0 , 댓글일때 1이상)
		int ref = article.getRef();					// 글 그룹 1
		int re_step = article.getRe_step();			// 정렬 순서 0
		int re_level = article.getRe_level();		// 답글 레벨 0
		int number = 0;								// DB에 저장할 글 고유번호
		String sql = "";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select max(num) from board");	// 가장 큰 글 고유번호 : num컬럼에 가장 큰수
			rs = pstmt.executeQuery();
			if(rs.next()) number = rs.getInt(1) + 1;	// 게시글이 존재하면 가져온 제일 큰 번호에 1을 더해 담아라
			else number = 1;							// 게시글이 없으면 1번으로 지정
			
			if(num != 0) { 	// #6.2 답글 일 때
				sql = "update board set re_step=re_step+1 where ref = ? and re_step > ?"; // 답글이 하나 달릴 때 마다 이전에 달려있는 답글들은 1씩 높여줌 (밀리니까)
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				pstmt.executeQuery();
				// 답글은 DB에 저장하기전에, 받아온 초기값 0에서 1이 되게 더해줌.
				re_step = re_step+1; // 지금에다가 1을 더해준 것 ( 넘어올때 0으로 오니까, 지금 답글 다는거니까 0이 아니라 1이 됨, 0은 항상 일반게시글
				re_level = re_level+1;
			}else {			// #4 새 글 작성일때
				ref = number;		// 그룹번호와 글 고유번호를 동일하게
				re_step = 0; 		
				re_level = 0;
			}
			// readcount를 제외한 나머지를 저장해야 해서 각각 지정
			// 1로 올려준다음에 저장함
			sql = "insert into board(num,writer,subject,email,content,pw,reg,";
			sql += "ip,ref,re_step,re_level) values(board_seq.nextVal,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getSubject());
			pstmt.setString(3, article.getEmail());
			pstmt.setString(4, article.getContent());
			pstmt.setString(5, article.getPw());
			pstmt.setTimestamp(6, article.getReg());
			pstmt.setString(7, article.getIp());
			pstmt.setInt(8, ref);
			pstmt.setInt(9,	re_step);
			pstmt.setInt(10, re_level);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try { rs.close(); }catch(SQLException s) {}
			if(pstmt != null) try { pstmt.close(); }catch(SQLException s) {}
			if(conn != null) try { conn.close(); }catch(SQLException s) {}
		}
	}
	
	// 지정한 게시글 가져오기
	public BoardDTO getArticle(int num) {
		BoardDTO article = null;
		try {
			conn = getConnection();
			// 먼저 조회수 올려서 저장하기
			String sql = "update board set readcount=readcount+1 where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeQuery();
			
			// 다시 해당번호 레코드 가져오기
			sql = "select * from board where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				article = new BoardDTO();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setSubject(rs.getString("subject"));
				article.setEmail(rs.getString("email"));
				article.setContent(rs.getString("content"));
				article.setPw(rs.getString("pw"));
				article.setReg(rs.getTimestamp("reg"));
				article.setReadcount(rs.getInt("readcount"));
				article.setIp(rs.getString("ip"));
				article.setRef(rs.getInt("ref"));
				article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try { rs.close(); }catch(SQLException s) {}
			if(pstmt != null) try { pstmt.close(); }catch(SQLException s) {}
			if(conn != null) try { conn.close(); }catch(SQLException s) {}
		}
		return article;
	}
	
	// 업데이트용 메서드
	public int updateArticle(BoardDTO article) {
		int x = -1;
		String dbpw = "";
		try {
			conn = getConnection();
			// 비번확인
			// 글 고유번호에 해당되는 pw를 db에서 가져오기
			String sql = "select pw from board where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, article.getNum());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dbpw = rs.getString("pw");
				if(dbpw.equals(article.getPw())) {
					sql = "update board set writer=?,subject=?,email=?,content=?,pw=? where num = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, article.getWriter());
					pstmt.setString(2, article.getSubject());
					pstmt.setString(3, article.getEmail());
					pstmt.setString(4, article.getContent());
					pstmt.setString(5, article.getPw());
					pstmt.setInt(6, article.getNum());
					pstmt.executeUpdate();
					x = 1;
				}else {	// 비번 틀림.
					x = 0;
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try { rs.close(); }catch(SQLException s) {}
			if(pstmt != null) try { pstmt.close(); }catch(SQLException s) {}
			if(conn != null) try { conn.close(); }catch(SQLException s) {}
		}
		return x;
	}
	
	// 게시글 삭제
	public int deleteArticle(int num, String pw) {
		int x = -1;
		String dbpw = "";
		try {
			conn = getConnection();
			String sql = "select pw from board where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dbpw = rs.getString("pw");
				if(dbpw.equals(pw)) {
					sql = "delete from board where num = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, num);
					pstmt.executeQuery();
					x = 1;
				}else {
					x = 0;
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try { rs.close(); }catch(SQLException s) {}
			if(pstmt != null) try { pstmt.close(); }catch(SQLException s) {}
			if(conn != null) try { conn.close(); }catch(SQLException s) {}
		}
		return x;
	}
	
	// # 해당 아이디의 전체 글개수 가져오기
	public int getMyArticleCount(String id) {
		int x = 0;
		try {
			conn = getConnection();
			String sql = "select count(*) from board where writer = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try { rs.close(); }catch(SQLException s) {}
			if(pstmt != null) try { pstmt.close(); }catch(SQLException s) {}
			if(conn != null) try { conn.close(); }catch(SQLException s) {}
		}
		return x;
	}

	// #해당 아이디의 전체 글 가져오기 (전체글 가져오는 것에서 조금만 수정)
	public List getMyArticles(int start, int end, String id) {
		List articleList = null;
		try {
			conn = getConnection();
			String sql = "select num,writer,subject,email,content,pw,reg,readcount,ip,ref,re_step,re_level,r "
					+ "from (select num,writer,subject,email,content,pw,reg,readcount,ip,ref,re_step,re_level,rownum r "
					+ "from (select * from board where writer = ? order by ref desc, re_step asc) order by ref desc, re_step asc) where r >= ? and r <= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				articleList = new ArrayList();
				do {
					BoardDTO article = new BoardDTO();
					article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setSubject(rs.getString("subject"));
					article.setEmail(rs.getString("email"));
					article.setContent(rs.getString("content"));
					article.setPw(rs.getString("pw"));
					article.setReg(rs.getTimestamp("reg"));
					article.setReadcount(rs.getInt("readcount"));
					article.setIp(rs.getString("ip"));
					article.setRef(rs.getInt("ref"));
					article.setRe_step(rs.getInt("re_step"));
					article.setRe_level(rs.getInt("re_level"));
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
	
	
	// # 관리자 전용 게시글 삭제
	public void deleteArticleByAdmin(int num) {
		try {
			conn = getConnection();
			String sql = "delete from board where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeQuery();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) try { pstmt.close(); }catch(SQLException s) {}
			if(conn != null) try { conn.close(); }catch(SQLException s) {}
		}
	}
	
	// # 검색한 글 총 개수 돌려주기
	public int getSearchArticleCount(String sel, String search) {
		int x = 0;
		try {
			conn = getConnection();
			String sql = "select count(*) from board where "+sel+" like '%"+search+"%'";
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
	// # 검색한 글 리스트 돌려주기
	public List getSearchArticles(int startRow, int endRow, String sel, String search) {
		List articleList = null;
		try {
			conn = getConnection();
			String sql = "select num,writer,subject,email,content,pw,reg,readcount,ip,ref,re_step,re_level,r "//3. 그걸 r 의 숫자까 지 쭉 거르고
					+ "from (select num,writer,subject,email,content,pw,reg,readcount,ip,ref,re_step,re_level,rownum r " //2. rownum r 가상의 번호 가장 작은 수이고 위의 
					+ "from (select * from board where "+sel+" like '%"+search+"%' order by ref desc, re_step asc) " //1. 전체 보드에서 가져오고  어떤 sel 이  search string 값을 포함  ordery by 로 정렬된
					+ "order by ref desc, re_step asc) where r >= ? and r <= ?";//4. 그걸 r 값 만큼 범위 지정을 해줌 
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				articleList = new ArrayList();
				do {
					BoardDTO article = new BoardDTO();
					article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setSubject(rs.getString("subject"));
					article.setEmail(rs.getString("email"));
					article.setContent(rs.getString("content"));
					article.setPw(rs.getString("pw"));
					article.setReg(rs.getTimestamp("reg"));
					article.setReadcount(rs.getInt("readcount"));
					article.setIp(rs.getString("ip"));
					article.setRef(rs.getInt("ref"));
					article.setRe_step(rs.getInt("re_step"));
					article.setRe_level(rs.getInt("re_level"));
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
	
	// # 글 내용보기전에 비번 확인 메서드
	public boolean isContentPwCorrect(int num, String pw) {
		boolean res = false;
		String dbpw = "";
		try {
			conn = getConnection();
			String sql = "select pw from board where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dbpw = rs.getString("pw");
				if(pw.equals(dbpw)) {
					res = true;
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try { rs.close(); }catch(SQLException s) {}
			if(pstmt != null) try { pstmt.close(); }catch(SQLException s) {}
			if(conn != null) try { conn.close(); }catch(SQLException s) {}
		}
		return res;
	}
	
	
	
	
	
	
	
	
	
	
}
