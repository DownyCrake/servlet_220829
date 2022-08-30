<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
	Date now = new Date();
	SimpleDateFormat time = new SimpleDateFormat("현재 날짜는 MM월 dd일 입니다.");
	%>
	<h2><%= time.format(now) %></h2>
</body>
</html>