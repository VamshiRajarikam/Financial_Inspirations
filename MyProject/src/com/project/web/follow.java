package com.project.web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class follow extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			resp.setContentType("text/html");
			//PrintWriter out = resp.getWriter();

			Class.forName("com.mysql.jdbc.Driver");

			Connection connect = DriverManager
					.getConnection("jdbc:mysql://localhost:3309/myproject?" + "user=root&password=");
			String usernamedb = null;
			String salarydb;
			Cookie ck[] = req.getCookies();
			if (ck.length > 0) {
				usernamedb = ck[1].getValue();
			}
			PreparedStatement statement= connect.prepareStatement("SELECT salary FROM user WHERE user_name=?");
			statement.setString(1, usernamedb);
			ResultSet result=statement.executeQuery();
			while(result.next()){
				salarydb=result.getString("salary");
			}
			String select[] = req.getParameterValues("stock");

			if(select!= null && select.length !=0){
			for(int i =0; i<select.length;i++){
			String query="insert into user_follow(user_name, interest) values(?,?)";
			PreparedStatement ps = connect.prepareStatement(query);
			ps.setString(1, usernamedb);
			ps.setString(2, select[i]);
			//ps.setString(3, salarydb);
			ps.addBatch();
			ResultSet rs;
			int results = ps.executeUpdate();
			//System.out.println("gwew");
			resp.sendRedirect("Home.jsp");
			
			}
			
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}

	