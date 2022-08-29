<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<!-- HTML 주석: 소스 보기에서 보임 -->
	<%-- JSP 주석: 소스 보기에서 보이지 않음 --%>
	
	<%
		// 스크립틀릿
		// java 문법 시작
		int sum = 0;
		for(int i = 0; i <=10; i++) {
			sum += i;
		}
	%>
	<strong>합계:</strong>
	<input type="text" value="<%=sum%>">
	<br>
	
	<%!
		// 선언문 - 클래스 느낌 (필드, 메소드)
		
		// 필드
		private int num = 100;
	
		// 메소드
		public String getHelloWorld() {
			return "Hello world";
		}
		
	%>
		
	<%= getHelloWorld() %>
	<br>
	<%= num + 200 %>
	<br>
	
</body>
</html>