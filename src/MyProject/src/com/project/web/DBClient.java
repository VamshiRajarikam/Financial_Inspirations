package com.project.web;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
//import com.mysql.jdbc.Connection;

public class DBClient extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			resp.setContentType("text/html");
			PrintWriter out = resp.getWriter();

			Class.forName("com.mysql.jdbc.Driver");

			Connection connect = DriverManager
					.getConnection("jdbc:mysql://localhost:3309/myproject?" + "user=root&password=");
			if (connect != null) {
				System.out.println("Connection established");
			}
			String timeStamp = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Date());
			String query = "insert into user(first_name,last_name,password,phone,address,email,date_created) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = connect.prepareStatement(query);
			ps.setString(1, req.getParameter("first_name"));
			ps.setString(2, req.getParameter("last_name"));
			ps.setString(3, req.getParameter("password"));
			ps.setString(4, req.getParameter("phone"));
			ps.setString(5, req.getParameter("address"));
			ps.setString(6, req.getParameter("mail"));
			ps.setString(7, timeStamp);
			ps.addBatch();
			
			int[] results = ps.executeBatch();

			// statement.executeQuery("insert into
			// user(first_name,last_name,password,phone,address,email,date_created)
			// values(firstnameDb,lastnameDb,passwordDb,phoneDb,addressDb,emailDb,dateCreatedDb)");

			out.println("Welcome");
			out.close();
			// PreparedStatement ps = connect.prepareStatement("insert into
			// user(first_name,last_name,password,phone,address,email,date_created)
			// values(firstnameDb,lastnameDb,passwordDb,phoneDb,addressDb,emailDb,dateCreatedDb)");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
