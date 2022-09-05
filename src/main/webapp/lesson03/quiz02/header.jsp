<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<header class="d-flex align-items-center ">
		<div class="col-2">
		<a href="/lesson03/quiz02/template.jsp">
		<h1 class="text-success">Melong</h1>
		</a>
		</div>
		<form method="post" action="/lesson03/quiz02/template.jsp" class="col-10">
			<div class="d-flex">
				<input type="text" name="title" class="form-control col-5">
				<input type="submit" class="btn btn-info" value="검색">
			</div>
		</form>
	</header>