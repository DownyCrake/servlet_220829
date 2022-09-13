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
	<div class="m-5">
		<h1>물건 올리기</h1>
		<form method="post" action="">
			<div class="d-flex justify-content-around">
				<select class="form-control mb-3 col-3" name="sellerId">
				<%
				while (result.next()) {
				%>
					<option class=" bg-secondary text-white" value=" <%= result.getString("S.id")%>">
						<%= result.getString("S.nickname") %>
					</option>
				<%
				}
				%>
				</select>

				<input type="text" class="form-control col-5 mb-3" name="title"
					placeholder="제목">

				<div class="input-group col-3 mb-3">
					<input type="text" class="form-control" name="price"
						placeholder="가격">
					<div class="input-group-prepend">
						<span class="input-group-text">원</span>
					</div>
				</div>

			</div>
			<textarea class="form-control mb-3" name="" rows="5"></textarea>
			
			<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">이미지 url</span>
					</div>
					<input type="text" class="form-control" name="picture">
				</div>
			
			<input type="submit" class="btn btn-light w-100 mb-3" value="저장">
		</form>
	</div>

</main>