<%-- <%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="vo" class="web.life.allDTO"/>
<jsp:setProperty name="vo" property="*" />

	
	<h1><br/></h1>
	
	<table border="">
		<tr>
			<td colspan="2"> <jsp:include page="header.jsp"/></td>
		
		</tr>
		<tr>
			<td> 
				<jsp:include page="left.jsp"/>
			</td>
	
	
			<td>
				
				<form>
					<table border="" style="width: 750px;">
						
						<tr>
							<td>ID <br/><jsp:getProperty name="vo" property="id"/></td>	
									
						</tr>
						
						<tr>
							<td>PW <br/> <jsp:getProperty name="vo" property="pw"/></td>			
									
						</tr>
						
						<tr>
							<td>Name <br/><jsp:getProperty name="vo" property="name"/></td>
									
						</tr>
						
						<tr>
							<td>Age <br/><jsp:getProperty name="vo" property="age"/></td>		
									
						</tr>
						
						<tr>
							<td>Gender <br/><jsp:getProperty name="vo" property="gender"/> </td>	
									
						</tr>
						
						<tr>
							<td>Email <br/><jsp:getProperty name="vo" property="email"> </td>	
									
						</tr>
						
						<tr>
							<td>Flavor <br/>
							<% if (sweet==null){%>
							<%="" %>
						    <%}else{%>
						    <%=sweet %>
							<%}%>
							
							<% if (salty==null){%>
							<%="" %>
						    <%}else{%>
						    <%=salty %>
							<%}%>
							
							<% if (sour==null){%>
							<%="" %>
						    <%}else{%>
						    <%=sour %>
							<%}%>
							
							<% if (spicy==null){%>
							<%="" %>
						    <%}else{%>
						    <%=spicy %>
							<%}%>
							
							<% if (bitter==null){%>
							<%="" %>
						    <%}else{%>
						    <%=bitter %>
							<%}%>
							
							<% if (RED==null){%>
							<%="" %>
						    <%}else{%>
						    <%=RED %>
							<%}%>	
												    
							</td>	
									
						</tr>
					
						<tr>					
							<td>Favorite animal<br/><%=animal %></td>			
										
						</tr>
							
						<tr>
							<td>Bio<br/><%=bio %></td>
									
						</tr>
		
												
					</table>
				</form>		
			</td>
		</tr>	
		<tr>
			<td colspan="2"><jsp:include page ="bottom.jsp"/></td>
		</tr>
	  
	</table>


</body>
</html> --%>