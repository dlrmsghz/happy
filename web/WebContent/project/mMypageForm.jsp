<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href = "style.css" rel ="stylesheet" type="text/css"/>
	<style>
		p.txt {
			color:white; 
			font-size:20px;
			background-color: #333;
		}
		.table{
			width: 100%;
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
	if(session.getAttribute("memId") == null){  %>
		<script>
			alert("로그인을 해주세요 !!.");
			window.location.href="mLoginForm.jsp";
		</script>	
<%	}else{
%>
<body>
	<p class="txt" align = "center">  </p>
	<table class="table">
		<tr>
			<td align = center>
				<input type = "button" value = "메인화면" style="width: 120px; height: 30px; font: icon;" onclick= "window.location.href='mMain.jsp'"/></td></tr>
			<tr><td align = center>	<input type = "button" value = "회원정보수정" style="width: 120px; font: icon; height: 30px;" onclick = "window.location.href='mModifyForm.jsp'"/></tr>
			<tr><td align = center>	<input type = "button" value = "구매내역" style="width: 120px; font: icon; height: 30px;" onclick = "window.location.href='mMyPriceForm.jsp'"/></tr>
			<tr><td align = center>	<input type = "button" value = "장바구니" style="width: 120px; font: icon; height: 30px;" onclick = "window.location.href='mMyshopForm.jsp'"/></tr>
			<tr><td align = center>	<input type = "button" value = "포인트 조회" style="width: 120px; font: icon; height: 30px;" onclick = "window.location.href='mMyPointForm.jsp'"/></tr>
			<tr><td align = center>	<input type = "button" value = "내 리뷰" style="width: 120px; font: icon; height: 30px;" onclick = "window.location.href='mMyReviewForm.jsp'"/>
			
		</tr>
	</table>
	
	
</body>
<% }  %>
<jsp:include page="mFooter.jsp"/>	
</html>