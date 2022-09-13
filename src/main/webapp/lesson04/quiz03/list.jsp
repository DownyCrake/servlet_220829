<%@page import="java.sql.ResultSet"%>
<%@page import="com.test.common.MysqlService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%
	MysqlService ms = MysqlService.getInstance();
	ms.connect();
	
	String SelectQuery = "select U.*, S.* from `seller` as S  join `used_goods` as U  on S.id = U.sellerId order by U.id desc";
	ResultSet result = ms.select(SelectQuery);

%>

	<main>
	<section class="mt-2 mb-5 d-flex flex-wrap justify-content-start">
<%
	while (result.next()) {
%>
	<div class="goods">
		<div>
			<% String pic = result.getString("U.picture");
				if (pic == null ) {
			%>	
				<h4 class="text-center text-secondary mt-5 mb-5">이미지 없음</h4>
			<%		
				}else {
			  %>
			<img src="<%= result.getString("U.picture") %>" alt="상품 이미지" height=150px>
			<% } %>
		</div>
		<span class="font-weight-bold"><%= result.getString("U.title") %></span><br>
		<span class="text-secondary "><%= result.getInt("U.price") %> </span> <br>
		<span class="coral"><%= result.getString("S.nickname") %> </span>
	
	</div>
<%} %>	
	</section>
</main>

<%
	ms.disconnect();
%>