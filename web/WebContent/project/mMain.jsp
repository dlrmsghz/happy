<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>mMain</title> 
	<style>
		.table{
			width: 100%;
			margin-right: auto;
			margin-left: auto;
			margin-bottom:0;
			/* border:5px solid #333; */
			padding:5px;
			overflow:hidden;
			background-color:black;
			text-overflow: ellipsis;
		}		
	</style>
</head>
			
<body>
		<jsp:include page="mHeader.jsp"/>
		<table class="table">
			<tr>
				<td>
					<img src="img/book.gif" height="500" width="1000">
				</td>
			</tr>
		</table>
		
</body>

<body>
	<jsp:include page="mFooter.jsp"/>
	<!-- <footer id="mFooter"></footer> -->
</body>
</html>