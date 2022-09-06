package com.test.lesson04;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.common.MysqlService;

@WebServlet ("/lesson04/quiz01")
public class DBquiz01 extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/plain");
		
		// db 연동
		MysqlService ms = MysqlService.getInstance();
		ms.connect();
		
		// insert
		//	String insertQuery = "insert into `real_estate` (realtorId,address,area,type,price,rentPrice) "
		//		+ "values (3, '헤라펠리스 101동 5305호', 350, '매매', 1500000,null );";
		
		// select
		String selectQuery = "select `address`, `area`, `type` from `real_estate` order by `id` desc limit 10;";

		try {
//			ms.update(insertQuery);
			ms.update(selectQuery);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		
		try {
			ResultSet resultSet = ms.select(selectQuery);
			
			PrintWriter out = response.getWriter();

			while (resultSet.next()) {
				String address = resultSet.getString("address");
				int area = resultSet.getInt("area");
				String type = resultSet.getString("type");  //Integer < null 가능
				out.println("매물주소: " + address + "면적: " + area + "타입: " + type);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		ms.disconnect();
	}
}
