package com.project.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class login extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("Username");
		String password = req.getParameter("password");
		String usernamedb;
		String passworddb = null;
		try {
			resp.setContentType("text/html");
			PrintWriter out = resp.getWriter();

			Class.forName("com.mysql.jdbc.Driver");

			Connection connect = null;
			connect = DriverManager.getConnection("jdbc:mysql://localhost:3309/myproject?" + "user=root&password=");

			// Querying
			PreparedStatement st = connect.prepareStatement("SELECT password FROM user WHERE user_name=?");
			st.setString(1, username);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				passworddb = rs.getString("password");
			}
			if (passworddb.equals(password)) {
				Cookie ck = new Cookie("username",username);
				resp.addCookie(ck);
				resp.sendRedirect("Home.jsp");
			} else {
				resp.sendRedirect("newlogin.html");
			}
			// ResultSet pass = st.executeQuery("SELECT password FROM user WHERE
			// user_name=" + username);
			// out.print(pass)

		}

		catch (

		SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}
}
