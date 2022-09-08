<%@page import="java.sql.ResultSet"%>
<%@page import="com.test.common.MysqlService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홍당무 마켓</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<!-- bootstrap CDN link -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<!-- jquery slim 제거-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<style>
.wrap {width: 1000px; margin: auto; }
header {background-color: coral; height:150px;} 
.logo {color:white; height:90px;}
.nav {color:white; font-weight:bold; font-size:18px;}
.goods {border:2px solid coral;
	width:320px; height:230px;
	margin:6px}
.coral {color:coral;}
</style>

</head>
<body>
<%
	MysqlService ms = MysqlService.getInstance();
	ms.connect();
	
	String SelectQuery = "select U.*, S.* from `seller` as S  join `used_goods` as U  on S.id = U.sellerId";
	ResultSet result = ms.select(SelectQuery);

%>
<div class="wrap">
	<jsp:include page="header.jsp"/>
	<jsp:include page="list.jsp"/>
	
	
<main>
	<section class="mt-2 mb-5 d-flex flex-wrap justify-content-start">
<%
	while (result.next()) {
%>
	<div class="goods">
	<div>
	<% String pic =result.getString("U.pictureUrl");
		if (pic == null ) {
	%>	
		<h4 class="text-center text-secondary mt-5 mb-5">이미지 없음</h4>
	<%		
		}else {
	  %>
	<img src="<%= result.getString("U.pictureUrl") %>" alt="상품 이미지" height=150px>
	<% } %>
	</div>
	<span class="font-weight-bold"><%= result.getString("U.title") %></span><br>
	<span class="text-secondary "><%= result.getInt("U.price") %> </span> <br>
	<span class="coral"><%= result.getString("S.nickname") %> </span>
	
	</div>
<%} %>	
	</section>
</main>

	<jsp:include page="footer.jsp"/>

</div>
<%
	ms.disconnect();
%>

</body>
</html>