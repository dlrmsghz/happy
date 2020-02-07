<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!-- 선언부 -->
<%!
	// 태그 안은 자바영역으로 자바 문법 이용.
	// 선언부 : 클래스 영역
	// 클래스변수, 인스터스변수
	static int num = 5;
	int num2 = 10;
	// 메서드
	public int multiply(int a, int b){
		int c = a * b;
		return c;
	}
%>
<%-- 출력문 : 메서드 호출가능 --%>
10 * 20 = <%= multiply(10,20) %> <br />
<%= num %> <br />

<!-- 스크립트릿 -->
<%
	// 스크립트릿 : 메서드 영역(지역변수 만들어서 사용)
	for(int i = 0; i < num; i++){
		out.println("java server page " + i + "<br />");
	}

	String col = "yellow";

%>

<body bgcolor="<%=col%>">


</body>





















