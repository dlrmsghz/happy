<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="web.jsp12.model.BoardDAO"%>
<%@page import="web.jsp12.model.BoardDTO"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>board</title>
	<link href="style.css" rel="stylesheet" type="text/css">
</head>

<%
	// 현재 페이지에 보여주고 싶은것 세팅
	
	int pageSize = 10; //현재 게시판에서 몇개의 글을 보여줄것인가 
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd - HH:mm");	// 현재 날짜 폼 정하기 (예쁘게 보여주려고)  괄호안에 알파벳 형태만 지켜주면 맘대로
	
	
	String pageNum = request.getParameter("pageNum");	// 요청된 페이지 번호 담기 ( 10개 초과시 다른페이지로 이동되는 기능 중 하나)
	if(pageNum == null){	// 처음 페이지를 열면 받은 페이지가 없으니까 (파라미터로 받음) 그럼 페이지 1 출력
		pageNum = "1";
	}
	
	// - 현재 페이지에 보여줄 게시글의 시작과 끝 등등 정보 세팅
	int currentPage = Integer.parseInt(pageNum);		// 위에서 받은 페이지 넘버 계산 위해서 인트로 형변환 하고 currentPAge 로 받음
	int startRow = (currentPage - 1) * pageSize + 1; // 계산해보면 각 페이지 별로 start row 값 맞는 식임
	int endRow = currentPage * pageSize;		//이하동문
	int count = 0;					// 전체 게시글의 갯수가 몇개인지
	int number = 0;				// 게시판 만에서의 고유번호 (게시판 고유번호, DB 연관 X)
	
	// - 게시판 글 가져오기
	List articleList = null; //arraylist의 부모격 타입 (인터페이스)

	BoardDAO dao = BoardDAO.getInstance(); // dao 쓰려고 객체 얻어온거

	// # 검색 목록
	String sel = request.getParameter("sel");
	String search = request.getParameter("search");
	System.out.println(sel);
	System.out.println(search);
	if(sel != null && search != null) {
		count = dao.getSearchArticleCount(sel,search);	//  검색된 글 수
		if(count > 0){
			articleList = dao.getSearchArticles(startRow, endRow, sel, search); //  검색된 글 리스트받기
		}
	}else{
		// # 일반 전체 목록 
		count = dao.getArticleCount();	 // 위에 변수 생성 이미해둠	
		if(count > 0) {						
			articleList = dao.getArticles(startRow, endRow);	//  DAO 에 있는 메서드 (게시글 보여줄것 정하는 ) 설명 거기있음
		}// #연결 자리 표식######
	}
	// 게시판에 뿌려줄 글번호 담기
	number = count - (currentPage-1)*pageSize;
	//현재 페이지에서의 첫번째 게시판 글번호  = 전체글의 갯수 - (현재페이지 - 1) * 10(페이지 사이즈 설정 수) 
%>
<body>
	<br />
	<h1 align="center"> 게시판 </h1>
	
	<%-- 게시글 없을때와 있을때로 구분해서 처리 --%>
	<% if(count == 0) {%>
	<table>
		<tr>
			<td><button onclick="window.location='boardWriteForm.jsp'"> 글쓰기 </button></td>
		</tr>
		<tr>
			<td align="center">게시글이 없습니다.</td>
		</tr>
	</table>
	<%}else{ %>
	<table class="listTable">
		<tr>
		<%if(session.getAttribute("memId") != null){ // 로그인이 되어있으면 (세션값 있으면) 만약 로그인이 아니더라도  session.setAttribute("animal", rabit) 각 페이지에 이렇게  animal 이름의 rabit의 값을 줄 수 있음;   d%>
					<!-- 로그아웃 할때 까지 session 은 모든페이지에서 이름으로 (animal)로 rabbit 을 꺼내 쓸 수 있음,   -->
					<!-- 만약 다음으로 넘어가는 페이지에서만 꺼내 쓸꺼면 request.setAttribute 로 (저장하고) request.getAttribute로 꺼내 쓸 수 있음 -->
			<td colspan="6" align="right">
				<button onclick="window.location='myArticles.jsp'"> 내 글보기 </button>
				<button onclick="window.location='boardWriteForm.jsp'"> 글쓰기 </button>
			</td>
		<%}else{%>
			<td colspan="6" align="right"><button onclick="window.location='boardWriteForm.jsp'"> 글쓰기 </button></td>
		<%}%>
		</tr>
		<tr>
			<td>No.</td>
			<td>제  목</td>
			<td>작성자</td>
			<td>시  간</td>
			<td>조회수</td>
			<td>IP주소</td>
		</tr>
		<%-- 게시글 반복해서 뿌려주기 --%>
		<% for(int i = 0; i < articleList.size(); i++){ // array리스트 에서는 size 가 배열에서의 length 임
			BoardDTO article = (BoardDTO)articleList.get(i); // 어레이 리스트 dto 단위로 받았으니까 뺄때돌 dto 단위로 빼서 줌
		%>
		<tr>
			<td><%=number--%></td> <!--  게시글 하나 출력하면 게시글 번호 출력하는데 돌리니까 하나씩 줌 -->
			<td>
				<%	// 대댓글 달기 위해 필요한 변수 생성
					int wid = 0; //~~~~~???? 0;++ 라고 되있었음;;
					if(article.getRe_level() > 0) { //  그냥 게시글은 0 댓글은 1 대댓글은 2 계속 증가...
						wid = 8*(article.getRe_level()); // 배경화면 블럭의 사이즈가 8 픽셀이고 ( 댓글 창 한 블럭단위) 댓글이 달리면 그만큼 뒤로 밀리게 하는 글 , 사진이 8픽셀이니까 8 설정 한거고 들여 써지는 길이 만큼 정하면 됨
				%>
					<img src="img/tabImg.PNG" width="<%=wid%>" /> <%-- 배경색으로 들여쓰기 효과  wid 로 지정해논 숫자만큼 늘어나게 할 것 임--%>
					<img src="img/replyImg.png" width="11"/> <%--댓글일 경우에만 댓글 받는 표식 출력하는것 --%>
				<%	}%>
				<a href="contentPwCheck.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage %>&from=boardList"><%=article.getSubject() %></a>
						<!--  얘 는  artiocle.getNum을 num parameter 에  담아준거고   -->										<!--얘는 그냥 제목 출력문 -->
			</td><!-- jsp?num 여기서 의 num  이 뒤의 article.getNum() 의 이름 붙인것임 ( num 으로 변수(parameter, STring 만 전송가능) 이름과 데이터 생성해서 보내는 것,
			 객체생성 하는 것 처럼) & and pagenum 파라미터 이름으로 currentPage의 번호를 보내겠다 , 이걸 안해주면 21 보고 있다가 보고 돌아와도 1로 다시 돌아가니까 설정 해주는 것
			 게시판 리스트가 여러개 있으니까 혼동되니까 어디서 왔는지 설정  &from=boardList ex boartdlist 랑 my articlese-->
			<td><a href="mailto:<%=article.getEmail()%>"><%=article.getWriter() %></a></td> <!-- 작성자랑 이메일 뿌려주고  바로 해당 작성자한테 메일 보낼 수 있는 기능 추가 -->
				<!-- 메일 주소받은걸 a href 로 메일 보낼 수 있게 하고 작성자 출력된걸 누르면 mailto 실행     -->
			<td><%=sdf.format(article.getReg()) %></td><!--시간 포멧 형태로 뿌려줌   위에 sdf 르 객체선언 해준것 대로 사용 하는메서드 -->
			<td><%=article.getReadcount() %></td>
			<td><%=article.getIp() %></td>
		</tr>
		<%}%>
	</table>
	<%} %>
	<%-- 목록의 페이지번호 뷰어 설정 --%>
	<div align="center">
		<br />
	<%
		if(count > 0){
			
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1); // 현재 몇페이지가 출력될지
			int pageBlock = 5;			//5개만 보이게
			int startPage = (int)(currentPage/pageBlock)*pageBlock + 1; // 계산해보면 이해감
			int endPage = startPage + pageBlock - 1; // 계산해보면 이해감
			if(endPage > pageCount) endPage = pageCount; // 페이지 엔드가 5 인데 그거보다 글이 적게 있을 때를 대비해서 그런 경우 엔드페이지랑 페이지 카운트랑 같게

			if(startPage > pageBlock){ %>
				<a href="boardList.jsp?pageNum=<%= startPage-pageBlock %>" > &lt; </a> <!-- 앞으로 가기 -->
			<%}
			for(int i = startPage; i <= endPage; i++){ %>
				<a href="boardList.jsp?pageNum=<%=i %>" name="list"> &nbsp; <%=i %> &nbsp; </a><!-- 숫자 뿌려주기 -->
			<%}
			if(endPage < pageCount){ %>
				<a href="boardList.jsp?pageNum=<%= startPage+pageBlock %>" > &gt; </a> <!-- 뒤로가기 -->
			<%}
		}%>
		
		<br /><br />
		<%-- # 작성/내용 검색   --%>
		<form action="boardList.jsp" >
			<select name="sel">
				<option value="writer">작성자</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="search" />
			<input type="submit" value="검색" />
		</form>
		
		<%-- # 메인으로 가는 버튼 추가 --%>
		<br />
		<button onclick="window.location='main.jsp'"> 메인으로 </button>
	</div>
	
</body>
</html>