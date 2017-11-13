package com.project.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class registration extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			resp.setContentType("text/html");
			//PrintWriter out = resp.getWriter();

			Class.forName("com.mysql.jdbc.Driver");

			Connection connect = DriverManager
					.getConnection("jdbc:mysql://localhost:3309/myproject?" + "user=root&password=");
			if (connect != null) {
				System.out.println("Connection established");
			}
			//String timeStamp = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Date());
			String query = "insert into user(first_name,last_name,user_name,email,password,salary,phone) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = connect.prepareStatement(query);
			ps.setString(1, req.getParameter("firstname"));
			ps.setString(2, req.getParameter("lastname"));
			ps.setString(3, req.getParameter("username"));
			ps.setString(4, req.getParameter("mail"));
			ps.setString(5, req.getParameter("pwd"));
			ps.setString(6, req.getParameter("salary"));
			ps.setString(7, req.getParameter("contactNumber"));
			ps.addBatch();
			ResultSet rs;
			int[] results = ps.executeBatch();
			
			// statement.executeQuery("insert into
			// user(first_name,last_name,password,phone,address,email,date_created)
			// values(firstnameDb,lastnameDb,passwordDb,phoneDb,addressDb,emailDb,dateCreatedDb)");
			resp.sendRedirect("newlogin.html");
			// PreparedStatement ps = connect.prepareStatement("insert into
			// user(first_name,last_name,password,phone,address,email,date_created)
			// values(firstnameDb,lastnameDb,passwordDb,phoneDb,addressDb,emailDb,dateCreatedDb)");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
