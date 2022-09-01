<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이번달 달력</title>

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

</head>
<body>
<%
Calendar date = Calendar.getInstance();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
int today = date.get(Calendar.DATE);
date.add(Calendar.DATE, -today + 1 );		
int firstWeek =  date.get(Calendar.DAY_OF_WEEK);
int lastDay = date.getActualMaximum(Calendar.DAY_OF_MONTH);

String dateArr[] = new String[lastDay + firstWeek - 1]; 
for (int i = 0; i < firstWeek - 1 ; i++ ){
	dateArr[i] = ""; 	
}
for (int i = firstWeek - 1 ; i < lastDay + firstWeek - 1; i++ ){
	dateArr[i] = String.valueOf(i - firstWeek + 2 );  
}
%>
<div class="container">
	<h1 class="text-center"><%= sdf.format(date.getTime()) %></h1>
	<table class="table text-center">
		<thead>
			<tr>
				<th class="text-danger">일</th>
				<th>월</th>
				<th>화</th>
				<th>수</th>
				<th>목</th>
				<th>금</th>
				<th>토</th>
			</tr>
		</thead>
		<tbody class="display-4">
			<tr>
		<% for (int i = 0; i < dateArr.length; i++) { %>
				<td>
					<%= dateArr[i] %>						
				</td>
		<% if (i%7 == 6){out.print("</tr><tr>"); } %>		
			<% 
			} %>
		</tbody>
	</table> 
</div>
</body>
</html>