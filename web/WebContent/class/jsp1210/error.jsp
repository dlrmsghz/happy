<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isErrorPage="true"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error</title>
</head>
<body>
	<h2> 죄송합니다. 페이지 공사중 입니다.  </h2>
	<% exception.toString(); %>
	<h4> isErrorPage="true"이면 exception 내부객체 사용가능.</h4>
</body>
</html>