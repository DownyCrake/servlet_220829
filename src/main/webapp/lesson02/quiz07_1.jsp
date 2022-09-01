<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
List<Map<String, Object>> list = new ArrayList<>();
Map<String, Object> map = new HashMap<String, Object>() {{ put("name", "버거킹"); put("menu", "햄버거"); put("point", 4.3); } };
list.add(map);
map = new HashMap<String, Object>() {{ put("name", "BBQ"); put("menu", "치킨"); put("point", 3.8); } };
list.add(map);
map = new HashMap<String, Object>() {{ put("name", "교촌치킨"); put("menu", "치킨"); put("point", 4.1); } };
list.add(map);
map = new HashMap<String, Object>() {{ put("name", "도미노피자"); put("menu", "피자"); put("point", 4.5); } };
list.add(map);
map = new HashMap<String, Object>() {{ put("name", "맥도날드"); put("menu", "햄버거"); put("point", 3.8); } };
list.add(map);
map = new HashMap<String, Object>() {{ put("name", "BHC"); put("menu", "치킨"); put("point", 4.2); } };
list.add(map);
map = new HashMap<String, Object>() {{ put("name", "반올림피자"); put("menu", "피자"); put("point", 4.3); } };
list.add(map);
%>

<%
	String order = request.getParameter("order");
	String exception = request.getParameter("exception");

	List<Map<String, Object>> newlist = new ArrayList<>();
	
	if ( list != null) { 
		for (int i = 0; i < list.size(); i++) {
			if (order.equals(list.get(i).get("menu")) ){
				map = new HashMap<String, Object>(list.get(i));
				newlist.add(map);
			}
		}
	}
	
	if (exception != null) {
		
		for( Iterator<Map<String, Object>> iter = newlist.iterator(); iter.hasNext();) {
            Map<String, Object> del = iter.next();
                if( (double)del.get("point") <= 4  )  {
                iter.remove();
                }
        }
	}
	
%>

<div class="contaioner">
<h1 class="text-center">검색 결과</h1>
<table class="table text-center">
	<thead>
		<tr>
			<th>메뉴</th>
			<th>상호</th>
			<th>별점</th>
		</tr>
	</thead>
	<tbody>
<%
	for (int i = 0; i < newlist.size(); i++) {
		String name = String.valueOf( newlist.get(i).get("menu") );
		String menu = String.valueOf( newlist.get(i).get("name") );
		String point = String.valueOf( newlist.get(i).get("point") );
%>
	<tr>
		<td> <%= name %> </td>
		<td> <%= menu %> </td>
		<td> <%= point %> </td>
	</tr>
<%
	}
%>
	</tbody>
</table>

<div>
</body>
</html>