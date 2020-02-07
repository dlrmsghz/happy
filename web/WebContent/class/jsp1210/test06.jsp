<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<h2> test06.jsp 파일 </h2>
<!-- HTML 주석 -->
<%-- JSP 주석 --%>
<h2> test06.jsp 파일 </h2>

<% for(int i = 0; i < 10; i++){ %>
	<h1> hello </h1>
<%} %>



	
	
	
	
	
	<body>
   <div>
      <h3>구구단을 외우자!</h3>
      <table>
      <%
      for(int i = 1; i < 10; i++) {
      %>
         <tr>
         <%
         for(int j = 2; j < 10; j++) {
         %>
            <td>
               <%=Integer.toString(j) 
                   + " X " + Integer.toString(i) 
                   + " = " + Integer.toString(j * i) 
               %>
            </td>
         <%
         }
         %>
         </tr>
      <%
      }
      %>
      </table>
   </div>
</body>
</html>