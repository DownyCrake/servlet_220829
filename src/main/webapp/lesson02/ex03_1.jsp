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
	String nickname = request.getParameter("nickname");
	String hobby = request.getParameter("hobby");
	String animal = request.getParameter("animal");
	String[] foodArr = request.getParameterValues("food"); // 선택 항목이 여러개일때
	String fruit = request.getParameter("fruit");
	%>

	<table border="1">
		<tr>
			<th>별명</th>
			<td><%=nickname%></td>
		<tr>
			<th>취미</th>
			<td><%=hobby%></td>
		<tr>
			<th>동물</th>
			<td><%=animal%></td>
		<tr>
			<th>음식</th>
			<td>
				<%
					if (foodArr != null) {
						String result = "";
						for (String food: foodArr) {
							result += food + ",";
						}
						//abc=> ab substring()
						result = result.substring(0,result.length() - 1);		
						out.print(result);
					}
				%>
				
			</td>
			<tr>
			<th>과일</th>
	<td><%=fruit%></td>
		
	</table>

</body>
</html>