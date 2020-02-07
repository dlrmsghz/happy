<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>기존 : <%=request.getAttribute("name") %></h2> 
	<h2>기존  : <%=request.getAttribute("id") %></h2> 
	<h2>EL : ${requestScope.num}</h2>
	<h2>EL : ${id}</h2>
	<h2>기존 : <%=request.getAttribute("data") %></h2>
	<h2>EL : ${data}</h2>
	
	<h2>기존 : age = <%--=(Integer)request.getAttribute("age") + 10--%></h2>
	<h2>EL : ${age+10}</h2>
	<h2>EL : ${age+"10"}</h2>
	<%-- <h2>EL : ${age+"hello"}</h2> --%>
	<h2>EL : ${age;"hello"}</h2>
	
	<h2>num : ${num}</h2> <!-- request 값 저장 된거 먼저 불러옴 우선순위 1. -->
	<h2>memId : ${memId}</h2>

	<h2>num : ${sessionScope.num}</h2> <!-- 세션값을 불러오고 싶으면 이렇게 지정  -->
	<h2>memId : ${memId}</h2>
	
	<h2>arr : ${arr[0]}</h2> <!-- 1번 방 -->
	<h2>arr : ${arr[1]}</h2> <!-- 2번 방 -->
		
	<h2>list : ${list}</h2> <!-- 전체 정보 -->	
	<h2>list : ${list[0]}</h2> <!-- 1번 방 -->
	<h2>list : ${list.get(0)}</h2> <!-- 1번 방 -->
	
	<h2>vo : ${vo}</h2> <!--  -->	
	<h2>vo : ${vo.getId()}</h2> <!-- VO에서 id 출력 -->	
	<h2>vo : ${vo.id}</h2> <!-- get 메서드 쓰지 않고 VO 에서 id 호출 -->	
	<h2>vo : ${vo.name}</h2> <!-- get 메서드 쓰지 않고 VO 에서 name 호출 -->	
	<h2>vo : ${vo.age}</h2> <!-- get 메서드 쓰지 않고 VO 에서 age 호출 -->	
	
		
</body>
</html>