<%@page import="web.jsp1219.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정 출력</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="member" class="web.jsp1219.member.MemberDTO"/>
<jsp:setProperty property="*" name="member" />

<%
	// 넘어오는 데이터 : 비밀번호, 생년월일, email
	// form에서 id 안넘어옴 : id를 알기위해 session에서 id 꺼내기
	String id = (String)session.getAttribute("memId");
	member.setId(id); // dto에 직접 id 세팅해서
	// db에 수정할 데이터를 adto 통으로 보내, 회원정보 수정하기.
	MemberDAO dao = new MemberDAO();
	dao.updateMember(member);	
%>
<body>		
	<h1 align ="center">회원정보 수정</h1>
	<table>
		<tr>
			<td><b>회원정보가 수정되었습니다.</b><br/></td>
		</tr>
		<tr>
			<td>
				<button onclick="window.location.href='main.jsp'">메인으로</button>
			</td>
		</tr>
	
	</table>
</body>
</html>