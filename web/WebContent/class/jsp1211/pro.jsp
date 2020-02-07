<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pro page</title>
</head>
	<h1> Pro page!!! </h1> <br/><br/><br/>
<%

	// post 방식 인코딩 처리! 한글 때짐 방지 : 데이터 꺼내기 전에 작성!!!
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	out.println("id : " + id + "<br />");
	out.println("pw : " + pw + "<br />");

//	String[] pets = request.getParameterValues("pet");
//	if(pets != null) {
		
//	}
	
//	for(int i = 0; i < pets.length; i++){
//		out.println(pets[i]+"");
//	}
	
	out.println("<br />");	
	
	
//	Enumeration paraNames = request.getParameterNames();
	// Enumeration 이라는 클래스를 호출 하기 위해서 위에 Enumeration 호출 해준 것임
	// 이름 목록 출력
	//while(paraNames.hasMoreElements()){
	//	String name = (String)paraNames.nextElement();
	//	out.println(name+ "");
	//}

	
%>



</body>

</html>













<!-- 
<body>

	<table border="1">
		<tr>
			<td>id</td>
			<td><%=id %></td>		
		</tr>
			
		<tr>
			<td>pw</td>
			<td><%=pw %></td>		
		</tr>
					
		<tr>
			<td>pet</td>
			<td>
			<input type="checkbox" name = "pet" value="dog" 
			<%if(pets !=null){
				for(String p: pets){
					if(p.equals("dogs")){%>
					checked
				<%	} 	
				}
			}  
			%>
			
			/> 강아지
			<input type="checkbox" name = "pet" value="cat" /> 고양이
			<input type="checkbox" name = "pet" value="tiger" /> 호랑이
			</td>	
		</tr>
	
	
	</table>


</body>
 -->