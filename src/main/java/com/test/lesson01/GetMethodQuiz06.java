package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/quiz06")
public class GetMethodQuiz06 extends HttpServlet{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/json");
		
		int n1 = Integer.valueOf(request.getParameter("number1"));
		int n2 = Integer.valueOf(request.getParameter("number2"));
		
		PrintWriter out = response.getWriter();
		
		out.print("{\n"
				+ "\"addtion\":" + (n1 + n2) + ",\n\"subtraction\":" + (n1 -n2) + ",\n\"multiplication\":" + (n1 * n2) +
				",\n\"division\":" + (n1 /n2) +  "\n}");
	}
}
