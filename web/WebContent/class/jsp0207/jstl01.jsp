<%@page import="web.jsp0207.mvc.TestVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL01</title>
</head>
<body>
	<!-- #1. 변수 선언 : set
			
			var : 변수명
			홑 태그 - value : 값
			쌍 태그 - 태그 중간에 값 작성			
	-->
		
	<c:set var="id" value="java1" />
	<c:set var ="pw">123</c:set>
	<h2>id : ${id}</h2>	
	<h2>id : ${pw}</h2>	
<%-- 	
	프로퍼티 값 설정  (방식을 통일해서 사용하기)
 	<%TestVO vo = new TestVO(); %>
 	<jsp:setProperty name = "vo" property="id" value="test"/> 이걸 해보겠다
	<c:set target="<%=vo%>" property="id" value="test"/>
	<h2>vo.id = ${vo.id}</h2> <!-- 안될때 있다...? (호환이 안될 때가 있음) -->
	<h2>vo.id = <%=vo.getId()%></h2> <!-- 걍 이걸로 해라 -->
	<h2>vo.id = <%=vo.getId()%></h2> <!-- 걍 이걸로 해라 --> --%>
	
	<jsp:useBean id="vo" class="web.jsp0207.mvc.TestVO"/>
	<c:set target="<%=vo%>" property="id" value="test"/>
	<h2>vo.id = ${vo.id}</h2>
	
	<!-- #2. 변수 삭제 -->
	<c:remove var="id"/>
	<c:remove var="pw"/>
	<h2>id = ${id}</h2>
	<h2>pw = ${pw}</h2>
	
	<!-- #3. if 
		test : 조건식 EL로 작성
		c: if 태그 사이에 조건식이 참일 경우 실행 (출력)할 내용 작성
	-->
	<c:set var="num" value="100"/> <!-- 변수 선언 -->
	
	
	<c:if test="${num>=100 }">
		<h2>${num} 은 100보다 크거나 같다. </h2>
	</c:if>
	<c:if test="${num<100 }">
		<h2>${num} 은 100보다 작다.</h2>
	</c:if>	
	
	<!-- #4. choose -->
	<c:choose>
		<c:when test="${num>100}">
			<h2>100보다 크다</h2>
		</c:when>
		<c:when test="${num<100}">
			<h2>100보다 작다</h2>
		</c:when>
		<c:otherwise>
			<h2>100과 같다</h2>
		</c:otherwise>
	</c:choose>

	<!-- #5. forEach 업그레이드 포문이랑 비슷
		var : 반복하여 데이터를 담아 줄 변수 선언
		items : 반복시킬 배열변수 지정
	 -->
	<%-- <c:set var="arr" value="<%=new int[]{1,2,3,4,5}%>"/>
	<c:forEach var="i" items="${arr}">
		<h2>${i}</h2>
	</c:forEach> --%>
<%-- 	<%	// forEach와 비슷환 맥락
		int [] arr = {1, 2, 3, 4, 5};
		for(int i : arr) {
			syso(i)
		}
		int [] arr = {1, 2, 3, 4, 5};
		for(int i : arr) {
			syso(arr[i])
		}
	%> --%>
		
<%-- 		<!-- 기본 for문 처럼 쓸 수 있는 방법 -->
	<c:forEach var = "i" begin="1" end="10" step="1">
		<h2>${i}</h2>
	</c:forEach>	 --%>
	<c:set var="arr" value="<%=new int[]{1,2,3,4,5}%>"/>
	<c:forEach var = "i" begin="0" end="4" step="1">
		<h2>${arr[i]}</h2>
	</c:forEach>	
	
	<%-- <table border="1"> <!-- 구구단 -->
	<c:forEach var ="i" begin = "1" end = "9" step="1">	
		<tr>
				<c:forEach var ="j" begin = "1" end = "9" step="1">	
				<td>${i} X ${j}=${i*j}</td>
				</c:forEach>			
		</tr>
	</c:forEach>
	</table> --%>
	
	<c:forEach var="i" items="${arr}" varStatus="status">
		<h2>${status.count} : ${status.index} : ${status.current}</h2>
	</c:forEach>
	
		<!-- status.index : 0부터 시작하는 루프의 인덱스
		status.count : 현재 몇 번째 루프인지 값. 1부터 시작
		status.current : var 속성 값.
		status.first : 현재 첫번째 루프이면 참입니다.
		status.last : 현재 마지막 루프이면 참입니다.
		 -->
		 
		 
	<c:forTokens var="a" items="a,b,c,d,e,f,g" delims=",">
		<h2>${a}</h2>
	</c:forTokens>
	
<%-- 	<c:forTokens var="temp" items="a,b,c,d,e,f,g" delims=",">
		<h2>${temp}</h2>
	</c:forTokens>
	 --%>
	<!-- c:import : include 와 비슷 -->
	<c:import var="test" url="test.jsp"/>
	${test} 
	
	<%-- redirect : response.sendRedirect() 와 동일한 기능
	<c:redirect url="test.jsp"/> --%>
	
	<!-- url -->
	
	<c:url var= "u" value="test.jsp">
		<c:param name="id" value="java1"/>		
		<c:param name="pw" value="1234"/>
	</c:url> <!-- 설정해주고 -->
	<c:redirect url ="${u}"/> <!-- 이것도 같이 써줘야 param 넘어감 --> 
	
	
	<!-- 한방에 보낼수도 있음!~!! -->
	<c:redirect url="test.jsp">
		<c:param name="id" value="java1"/>
		<c:param name="pw" value="1234"/>	
	</c:redirect>
	
	
	<%-- <c:set var="num" value="100"/> <!-- 변수 선언 --> --%>
	
	
	
	<c:out value="${num}"/> 
	${num}
	
	
	
<%-- 	legnth 써서 쓰는 법 있는데  나중에 알려 줄 것 임
	<c:forEach var = "i" begin="i" end=<%=arr.length %> step="1">
		<h2><%=arr{i]%></h2>
	</c:forEach> --%>
	
	
	
	
	
	
		
</body>
</html>