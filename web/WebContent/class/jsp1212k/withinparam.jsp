<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import= "java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>초기화 파라미터 읽기</title>
</head>

<%
	Enumeration paramName= request.getHeaderNames(); 
%>

<body>

	<h3>초기화 파라미터 목록</h3>
	<ul>
	<%
		// 초기 파라미터들의 이름 목록 가져오기 
		Enumeration iniParamNames = application.getInitParameterNames();
		// 반복해서 이름과 값을 꺼내서 리스트 형식으로 화면에 보여주기 
		while(iniParamNames.hasMoreElements()){ // 목록이 있을떄 까지 반복해라 
			// 목록에서 다음요소 꺼내서 변수에 담기 
			String ParamName= (String)iniParamNames.nextElement(); %> 
		
			<li> <%=ParamName%> = <%=application.getInitParameter(ParamName) %> </li>
	<%	}
	
	%>
	</ul>
</body>
</html>