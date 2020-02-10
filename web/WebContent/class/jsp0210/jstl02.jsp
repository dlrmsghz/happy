<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	<% //request.setCharacterEncoding("UTF-8"); 동일%>
	<fmt:requestEncoding value="UTF-8"/> <!-- 위와 동일 -->
	
	<!-- 컨트롤러에서 request를 통해 보내준 Date 객체 받아 출력 -->
	<fmt:formatDate value= "${day}"/>
	<fmt:formatDate value= "${day}" type="date"/><br/>
	<fmt:formatDate value= "${day}" type="time"/><br/>
	<fmt:formatDate value= "${day}" type="both"/><br/>
	<br/>
	
	<fmt:formatDate value= "${day}" type="both" dateStyle="short"/><br/>
	<fmt:formatDate value= "${day}" type="both" dateStyle="medium"/><br/>
	<fmt:formatDate value= "${day}" type="both" dateStyle="long"/><br/>
	<fmt:formatDate value= "${day}" type="both" dateStyle="full"/><br/>
	<br/>

	<fmt:formatDate value= "${day}" type="both" timeStyle="short"/><br/>
	<fmt:formatDate value= "${day}" type="both" timeStyle="medium"/><br/>
	<fmt:formatDate value= "${day}" type="both" timeStyle="long"/><br/>
	<fmt:formatDate value= "${day}" type="both" timeStyle="full"/><br/>
	<br/>
	<fmt:formatDate value= "${day}" pattern="yyyy년 MM월 dd일"/><br/>
	<br/>
	

	<!-- 숫 자 관 련 -->
	
	<fmt:formatNumber value="1000000" groupingUsed="true"/> <br/>	
	<fmt:formatNumber value="1000000" groupingUsed="false"/> <br/>	
	
	<fmt:formatNumber value="1000000" type="number"/> <br/>
	
	<fmt:formatNumber value="1000.25" type="currency" currencySymbol="\\"/> <br/> 
	<!-- 쌍따옴표 안에 escape 문자 달아노면 그냥 escape 만 되니까 두개를 써야 하나가 문자열로 출력 -->
	<fmt:formatNumber value="1000.25" type="currency" currencySymbol="$"/> <br/>
	
	<fmt:formatNumber value="0.3" type="percent"/> <br/>
	
	<fmt:formatNumber value="100.1234" pattern=".0"/> <br/>
	<fmt:formatNumber value="100.1234" pattern=".00"/> <br/>
	
	<fmt:timeZone value="GMT"> 
		GMT 영국 :  <fmt:formatDate value ="${day }" type="both"/> <br/>
	</fmt:timeZone>
	
	<fmt:timeZone value="GMT-8"> 
		GMT-8 뉴욕 :  <fmt:formatDate value ="${day }" type="both"/> <br/>
	</fmt:timeZone>
	
	
	<!-- 문자열을 숫자로 변환해주는 기능 -->
	<fmt:parseNumber value="10000.2222" var="result1" />
	<fmt:parseNumber value="10000.2222" var="result" integerOnly="true"/>
	출력 -> 실수 : ${result1}<br/>
	출력 -> 정수 : ${result}<br/>
	
	
	
	

</body>
</html>