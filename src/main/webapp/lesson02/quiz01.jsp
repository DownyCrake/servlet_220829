<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Arrays"%>
<%-- <%@ page import="java.util.*" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 퀴즈1</title>
</head>
<body>
	<div class="container">
		<div>
			<h3>1. 1부터 n까지의 합계를 구하는 함수</h3>
			<%!public int sumNum(int n) {
			int num = 0;
			for (int i = 1; i <= n; i++) {
				num += i;
			}
			return num;
			}%>
			<%=sumNum(50)%>

		</div>
		<div>
			<h3>2. 점수들의 평균 구하기</h3>

			<%
			int[] scores = { 80, 90, 100, 95, 80 };
			float sumScores = 0;
			for (int i = 0; i < scores.length; i++) {
				sumScores += scores[i];
			}
			float avg = sumScores / scores.length;
			%>
			<%=avg%>
		</div>

		<div>
			<h3>3. 채점 결과</h3>
			<%
			List<String> scoreList = Arrays.asList(new String[] { "X", "O", "O", "O", "X", "O", "O", "O", "X", "O" });
			int listLength = scoreList.size();
			int correct = 0;
			for (int i = 0; i < listLength; i++) {
				if (scoreList.get(i).equals("O") ) correct ++;
			}
			int score = (100/listLength) * correct;
			%>
			<%= score %>
		</div>
		
		<div>
			<h3>4. 나이 구하기</h3>
			<%
			String birthDay = "20010820";
			int birth = Integer.valueOf(birthDay.substring(0, 4));
			int age = 2022 - birth;
			%>
			<%= age %>
		</div>
		
		<div>
			<h2>1부터 50까지의 합은 <%=sumNum(50)%> 입니다.</h2>
			<h2>평균 점수는 <%=avg %>입니다.</h2>
			<h2>채점 결과는 <%= score %>점 입니다. </h2>
			<h2>20010820의 나이는 <%= age %>세 입니다. </h2>
		</div>

	</div>
</body>
</html>