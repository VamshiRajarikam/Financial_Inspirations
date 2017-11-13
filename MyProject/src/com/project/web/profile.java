package com.project.web;

import java.sql.*;

public class profile extends login{

	public static void main(String[] args) {
		try{
		Class.forName("com.mysql.jdbc.Driver");

	    Connection connect = DriverManager
	            .getConnection("jdbc:mysql://localhost:3309/myproject?" + "user=root&password=");
	    if(connect != null)
	    	System.out.println("Connection successfull");
	    
	    
	    Statement statement = connect.createStatement();
	    ResultSet resultSet = statement.executeQuery("Select user_name,email,phone FROM user WHERE user_name= ?");
	    
	    //reading from db
	    while(resultSet.next()){
	    	String firstname= resultSet.getString("user_name");
	    	String username= resultSet.getString("user_name");
	    	System.out.println("First Name: " + firstname);
	    	System.out.println("Username: " + username);
	    }
	    
	    }
		catch(Exception e){
			e.printStackTrace();
		}
	}

}
