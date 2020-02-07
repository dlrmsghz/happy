<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>초기화 파라미터 목록</title>
</head>
<body>

<%-- 	<%
		// 초기 파라미터들의 이름 목록 가져오기
		Enumeration iniParamNames = application.getInitParameterNames();
		// 반복해서 이름과 값을 꺼내서 리스트 형힉으로 화면에 보여주기.
		while(iniParamNames.hasMoreElements()){
			String paramName= (String)iniParamNames.nextElement();
			
	%>

	<%
		Enumeration.
	%>

			
			
			<li><%= paramName %> = <%=application.getInitParameter(paramName) %></li>
			<li><%= paramName %> = <%=application.getInitParameter(paramName) %></li>
			<li><%= paramName %> = <%=application.getInitParameter(paramName) %></li>
			<li><%= paramName %> = <%=application.getInitParameter(paramName) %></li>
			<li><%= paramName %> = <%=application.getInitParameter(paramName) %></li>
			<li><%= paramName %> = <%=application.getInitParameter(paramName) %></li>
			
	<%	}
	
	%>
 --%>
</body>
</html>