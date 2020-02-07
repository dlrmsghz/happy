<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="style.css" rel="stylesheet" type="text/css">
	<style>
	@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);  /* 구글 웹 폰트 */
		body{
		
			font-family:'Nanum Gothic', 돋움; 
		}
		.wrapper{
			width:100%;
			height:auto;
			margin: 0 auto;	
		}
		.bbb{
			width:100%;
			height:auto;
			margin: 0 auto;	
			background-color: black;
			float: right;
		}
		nav{
			width: 100%;
			height: 150px;
			background-color: black;
			float: left;
			width:100%;
			margin-top: 0px;			
		}
		nav ul{
			list-style-type:none;	
		}
		nav ul li{
			display: inline;
			float: left;	
			font-weight:bold;
			margin: 15px;
		}
		.ccc{
			display: inline;
			float: left;
			font-size:medium;	
			font-weight:bold;
			margin:50px;
			display:block;  /* 블록 레벨 요소 */
			border:1px solid black;  /* 테두리 */
			cursor:pointer;  /* 마우스 포인터 */			
		}
		.ccc:hover{  /* 버튼 위로 마우스 포인터 올렸을 때 스타일 */
			background-color:black;  /* 배경색 */
			border:1px solid gray;  /* 테두리 */
			color:#529215; /* 글자색 */
		}
		.aaa{
			display: inline;
			float: right;	
			font-size:x-small;
			font-weight:bold;
			margin:10px;
		}
		nav a:link, nav a:visited {
			color:white;
			text-decoration:none;	
		}				
	</style>
	<script type="text/javascript">
		function validate(){
			var s=document.s;
			if(!s.search.value){
				alert("검색어를 입력하세요");
				return false;
			}
		}
	</script>
</head>
<%
	// 로그인 상태확인	
	// 세션이 없다면 로그인을 하지 않은 상태
if(session.getAttribute("memId") == null){//로그인 안했다면,
	
			String id = null, pw = null;
			Cookie[] cs = request.getCookies();
			
			if(cs != null){	// 쿠키가 있다면
				for(Cookie coo : cs){ // 쿠키들 반복
					if(coo.getName().equals("autoId")) id = coo.getValue();
					if(coo.getName().equals("autoPw")) pw = coo.getValue();
				}
			}			
			if(id != null && pw != null){
				response.sendRedirect("mLoginPro.jsp");
			}
%>
<body>
	<header>		
		<div class="wrapper">
			<nav>
				<ul>
					<li><a href="mMain.jsp"><img src="img\noname3.png" height="155" width="160"/></a>
					<li class="ccc"><a href='mBookListForm.jsp'>책 목록 전체보기</a></li>
					<li class="ccc"><a href='mBookListForm.jsp?genre=판타지'>판타지</a></li>
					<li class="ccc"><a href='mBookListForm.jsp?genre=공포'>공포</a></li>
					<li class="ccc"><a href='mBookListForm.jsp?genre=로맨스'>로맨스</a></li>
					<li class="ccc"><a href='nBookListForm.jsp'>야너두작가될수있어</a></li>	
					<li class="aaa"><a href='mSignupForm.jsp'>회원가입</a></li> 
					<li class="aaa"><a href='mLoginForm.jsp'>로그인</a></li>
				</ul>
			</nav>
		</div>
	</header>
</body>
<body>
	<div class="bbb">
		<form action = "mBookListForm.jsp" method ="post" name="s" onsubmit="return validate();">
				<table>
					<tr>
						<td>
							<select name = "sel" style="color:black; height: 30px;">
								<option value ="bk_name">제 목</option><%--value => DB에 있는 이름으로 써야 함.--%>
								<option value ="bk_writer">저 자</option>					
							</select>
							<input type="text" name ="search" style="width: 400px; height: 30px;">
							<input type="submit" value ="검색"  style="height: 30px;">
						</td>
					</tr>
				</table>
		</form>	
	</div>				
</body>
<% }else{ //로그인 했다면,	
	String id=(String)session.getAttribute("memId");
%>
<body>
	<header>
		<div class="wrapper">
			<nav>
				<ul>
					<li><a href="mMain.jsp"><img src="img\noname3.png" height="155" width="160"/></a>
					<li class="ccc"><a href='mBookListForm.jsp'>책 목록 전체보기</a></li>
					<li class="ccc"><a href='mBookListForm.jsp?genre=판타지'>판타지</a></li>
					<li class="ccc"><a href='mBookListForm.jsp?genre=공포'>공포</a></li>
					<li class="ccc"><a href='mBookListForm.jsp?genre=로맨스'>로맨스</a></li>
					<li class="ccc"><a href='nBookListForm.jsp'>야너두작가될수있어</a></li>	
				</ul>
				<ul>
					<li class="aaa"><a href='mLogOut.jsp'>로그아웃</a></li>				
					<li class="aaa"><a href='mMypageForm.jsp'>마이페이지</a></li>	
						<%if(id!=null&&id.equals("admin")){ %>
					<li class="aaa"><a href='mAllprice.jsp'>총 매출</a></li>
					<li class="aaa"><a href='mMemberList.jsp'>회원 리스트</a></li>
						<%} %> 
					<li class="aaa"><%=session.getAttribute("memId")%>님 환영합니다</li>
				</ul>
			</nav>
		</div>
</header>	
</body>
<body>
	<div class="bbb">
		<form action = "mBookListForm.jsp" method ="post" name="s" onsubmit="return validate();">
				<table>
					<tr>
						<td>
							<select name = "sel" style="color:black; height: 30px;">
								<option value ="bk_name">제 목</option><%--value => DB에 있는 이름으로 써야 함.--%>
								<option value ="bk_writer">저 자</option>					
							</select>
							<input type="text" name ="search" style="width: 400px;  height: 30px;" >
							<input type="submit" value ="검색" style="height: 30px;">
							
						</td>
					</tr>
				</table>
		</form>	
	</div>				
</body>
<% } %>
</html>