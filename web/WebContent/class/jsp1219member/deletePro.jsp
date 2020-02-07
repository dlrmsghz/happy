<%@page import="web.jsp1219.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
<title>deletePro</title>
</head>
<% 
	// 회원 탈퇴 로직 작성
	//DB 에서 데이터 삭제
	//session에서 아이디 꺼내기
	String id = (String)session.getAttribute("meId");
	//form페이지에서 넘어온 비밀번호 받기
	String pw = request.getParameter("pw");
	
	MemberDAO dao = new MemberDAO();
	int result = dao.deleteMember(id, pw);
	// result : -1(아이디 이상향), 0 (비번오류), 1(탈퇴 정상처리)
	if(result ==1){//탈퇴처리가됬다면,
	//로그아웃
		session.invalidate();
		// + 쿠키가 있다면 쿠키도 삭제 %>

<body>
	<table>
		<tr>
			<td><b>회원정보가 삭제되었습니다.</b><br/></td>
		</tr>
		<tr>
			<td>
				<button onclick="window.location.href='main.jsp'">메인으로</button>
			</td>
		</tr>
	</table>
</body>
		
<%}else{//비밀번호 오류 : 회원탈퇴 실패%>
		<script>
			
		</script>
<%}
%>	
</html>