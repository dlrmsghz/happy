<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>부트스트랩 기본 틀</title>
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/custom.css" rel="stylesheet">
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<title>header</title>
</head>
<body>
<h1>I will make everything I learned on this page.</h1>
<h2>2019.12.13 K LEE</h2>
<jsp:useBean id="date" class="java.util.Date"></jsp:useBean>
<%=date%>
</body>
</html>