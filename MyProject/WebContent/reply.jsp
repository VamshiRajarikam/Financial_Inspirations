<%@ page
    import="java.sql.*, java.util.Date, java.text.*,java.util.Random"
    language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
        Class.forName("com.mysql.jdbc.Driver");

        Connection connect = DriverManager
                .getConnection("jdbc:mysql://localhost:3309/myproject?" + "user=root&password=");
        request.getParameter("");
        String postquery="";
        PreparedStatement ps = connect.prepareStatement(postquery);
        
        
        String replyquery = "insert into reply_table(post_id, reply) values(?,?)";
        String postid = "";
        String postuser1 = "vamshirajarikam";
        String postdescription = request.getParameter("posting");
        PreparedStatement ps1 = connect.prepareStatement(postquery);
        ps.setString(1, postid);
        ps.setString(2, postuser1);
        ps.setString(3, postdescription);
        // ps.setString(4, timeStamp);
        ps.addBatch();
        ps.executeUpdate();
        response.sendRedirect("Home.jsp");
        
        %>
</body>
</html>