<%@page import="web.project.model.BookDTO"%>
<%@page import="web.project.model.BookDAO"%>
<%@page import="web.project.model.MemberDTO"%>
<%@page import="web.project.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>mMyPriceForm</title>
	<link href = "style.css" rel="stylesheet" type = "text/css"/>
	<style>
		p.txt {
			color:white; 
			font-size:18px;
			background-color: #333;
		}
		.div{
			background-color: #333;
		}
		.table{
			width:80%;
			margin-right: auto;
			margin-left: auto;
			margin-bottom:0;
			border:5px solid #333;
			padding:5px;
			overflow:hidden;
			background-color: #d9d9d9;
		}		
	</style>
</head>
	<jsp:include page="mHeader.jsp"/>
<%
	if(session.getAttribute("memId")==null){ %>
			<script>
			alert("로그인후 이용해 주세요");
			window.location.href="mLoginForm.jsp";
			</script>
<%  }else{
			String id = (String)session.getAttribute("memId");
			MemberDAO dao = new MemberDAO();
			MemberDTO dto = dao.getMember(id);
			
			String buyList = dto.getBuylist();
			String [] books = null;
			
			if(buyList != null){
				books = buyList.split(",");
			}
	
%>
		<body>
			<p class="txt" align = "center"> 구매내역 </p>
			<div class="div">
				<table class="table">
					<tr>
						<td colspan="3"><b style="color:black; font-size: large;"> <%=session.getAttribute("memId")%>님</b></td>
					</tr>
					<tr>
						<td><b>보유 포인트 : </b></td>
						<td style="color:black"><b><%=dto.getMoney() %>원</b></td>
						<td style="color:black"><button onclick = "window.location.href='mMyPointForm.jsp'">충전</button></td>
					</tr>
				</table>		
				<table class="table">
					<tr>						
						<td>No.</td>
						<td>책사진</td>
						<td>제  목</td>
						<td>저  자</td>
						<td>책장르</td>
						<td>발행일</td>
						<td>책가격</td>
					</tr>
					<%	// 장바구니가 0개 일 때,
					BookDAO bookDao=BookDAO.getInstance();
					if(buyList == null){%>						
					<tr>	
						<td colspan="7"> 없습니다. </td>
					</tr>
					<% }else{
							for(int i = 1; i <books.length; i++){
								int book = Integer.parseInt(books[i]);
								BookDTO article = bookDao.getArticle(book);
						%>	
								<tr>
									<td><%=article.getNum()%></td>
									<td><img width="100" height="150" src ="/web/mSave/<%=article.getImg() %>"></td>
									<td><a href = "mContentForm.jsp?num=<%=article.getNum() %>&cart=cart"><%=article.getName() %></a></td>
									<td><%=article.getWriter() %></td>
									<td><%=article.getGenre() %></td>
									<td><%=article.getRegs() %></td>
									<td><%=article.getPrice() %></td>
								</tr>
						<% } %>
						<%} %>
		<%}%>
					<tr>
						<td colspan="7">
							<button onclick = "window.location.href='mMypageForm.jsp'">마이페이지</button>
						</td>
					</tr>
				</table>
			</div>
<jsp:include page="mFooter.jsp"/>	
</body>
</html>