<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%
	//request에 setAttribute()해서 세팅된 객체 꺼내기 
	//객체 타입이 뭔지 모르기 때문에 맞는 타입으로 형변환 해서 사용 해야 한다. 
	
	Calendar cal = (Calendar)request.getAttribute("cal"); 
%>

<body>
		<h1> timeMaker</h1>
	현재 시간: <%=cal.get(Calendar.HOUR)%> 시  <!-- 상수를 이용해서 꺼낸다.  -->
			<%=cal.get(Calendar.MINUTE)%> 분  
			<%=cal.get(Calendar.SECOND)%> 초

</body>
</html>