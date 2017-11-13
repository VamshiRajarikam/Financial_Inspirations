<%@ page
	import="java.sql.*, java.util.Date, java.text.*,java.util.Random"
	language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Post enter</title>
</head>
<body>

	<%
		Class.forName("com.mysql.jdbc.Driver");

		Connection connect = DriverManager
		        .getConnection("jdbc:mysql://localhost:3309/myproject?" + "user=root&password=");
		String postquery = "insert into post_table(post_id, post_user,post_description, timestamp) values(?,?,?,?)";
		String timeStamp = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Date());
		Random rand = new Random();
		int ran = rand.nextInt(1000) + 1;
		String postid = Integer.toString(ran);
		String cookiename=null;
		Cookie ck[]= request.getCookies();
        if(ck.length>0){
            cookiename=ck[1].getValue();
        }
		String postdescription = request.getParameter("posting");
		PreparedStatement ps = connect.prepareStatement(postquery);
		ps.setString(1, postid);
		ps.setString(2, cookiename);
		ps.setString(3, postdescription);
		ps.setString(4, timeStamp);
		ps.addBatch();
		ps.executeUpdate();
		response.sendRedirect("Home.jsp");
	%>
</body>
</html>