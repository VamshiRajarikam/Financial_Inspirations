<%@ page
	import="java.sql.*, java.util.Date, java.text.*,java.util.Random,javax.servlet.http.Cookie"
	language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<!--Navigation CSS-->
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>FI Login</title>
<!-- Custom fonts for this template -->
<link href="vendor/font-awesome/css/font-aweso  me.min.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- Custom styles for this template -->
<link href="css/freelancer.min.css" rel="stylesheet">
<!--Navigation CSS-->
<!-- CSS -->
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="assets/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/form-elements.css">
<link rel="stylesheet" href="assets/css/style.css">






<style type="text/css">
#customBtn:hover {
	cursor: pointer;
}

body {
	background-color: #18bc9c;
}

.nav-item {
	float: left;
}
</style>
<style>
html, body, h1, h2, h3, h4, h5 {
	font-family: "Open Sans", sans-serif
}
</style>

<title>Insert title here</title>
</head>

<body class="w3-theme-l5">
	<!-- Navbar -->

	<div class="w3-top">

		<div class="w3-bar w3-theme-d2 w3-left-align w3-large">

			<a
				class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2"
				href="javascript:void(0);" onclick="openNav()"><i
				class="fa fa-bars"></i></a> <a href="Home.jsp"
				class="w3-bar-item w3-button w3-padding-large w3-theme-d4"><i
				class="fa fa-home w3-margin-right"></i>Home</a> <a href="#"
				class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"
				title="Account Settings"><i class="fa fa-user"></i></a> <a href="#"
				class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"
				title="Messages"><i class="fa fa-envelope"></i></a>

			<div class="w3-dropdown-hover w3-hide-small">

				<button class="w3-button w3-padding-large" title="Notifications">

					<i class="fa fa-bell"></i><span
						class="w3-badge w3-right w3-small w3-green">3</span>

				</button>

				<div class="w3-dropdown-content w3-card-4 w3-bar-block"
					style="width: 300px">

					<a href="#" class="w3-bar-item w3-button">One new friend

						request</a> <a href="#" class="w3-bar-item w3-button">John Doe

						posted on your wall</a> <a href="#" class="w3-bar-item w3-button">Jane

						likes your post</a>

				</div>

			</div>

			<a href="#"
				class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white"
				title="My Account">
		</div>

	</div>


	<!-- Navbar on small screens -->

	<div id="navDemo"
		class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium w3-large">

		<a href="#" class="w3-bar-item w3-button w3-padding-large">Link 1</a>

		<a href="#" class="w3-bar-item w3-button w3-padding-large">Link 2</a>

		<a href="#" class="w3-bar-item w3-button w3-padding-large">Link 3</a>

		<a href="#" class="w3-bar-item w3-button w3-padding-large">My

			Profile</a>

	</div>


	<!-- Page Container -->

	<div class="w3-container w3-content"
		style="max-width: 1400px; margin-top: 40px">

		<h1 class="w3-center ">
			<strong>Financial Inspiration </strong>
		</h1>

		<%
			String cookiename = null;
			Cookie ck[] = request.getCookies();
			if (ck.length > 0) {
				cookiename = ck[1].getValue();
			}
			Class.forName("com.mysql.jdbc.Driver");

			Connection connect = DriverManager
			        .getConnection("jdbc:mysql://localhost:3309/myproject?" + "user=root&password=");
		
			PreparedStatement statement = connect.prepareStatement("select category,interest FROM follow_table");
			ResultSet resultSet = statement.executeQuery();
			
			String usersalary=null;
			  PreparedStatement statSal = connect.prepareStatement("select salary FROM user WHERE user_name= ?");
			  statSal.setString(1,cookiename);
			  ResultSet resulti= statSal.executeQuery();
			  while(resulti.next()){
			    usersalary= resulti.getString("salary");  
			    //System.out.println(usersalary);
			  }
			
		%>
		<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
}

/* Create three equal columns that floats next to each other */
.column {
	float: left;
	width: 33.33%;
	padding: 10px;
	height: 1500px; /* Should be removed. Only for demonstration */
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}
</style>
<div class="row">
<div class="column" style="background-color:#C5D8DE;">
  <h2>Stock</h2>
  <form action="follow" method="post">
  <p align= "left"><input type="checkbox" name="stock" value="alphabet inc"> Alphabet inc</p><br>
  <p align= "left"><input type="checkbox" name="stock" value="amazon.com"> Amazon</p><br>
  <p align= "left"><input type="checkbox" name="stock" value="tesla"> tesla</p><br>
  <p align= "left"><input type="checkbox" name="stock" value="apple.com"> apple.com</p><br>
  <p align= "left"><input type="checkbox" name="stock" value="nvidia"> nvidia</p><br>
  <p align= "left"><input type="checkbox" name="stock" value="intel"> intel</p><br>
  <p align= "left"><input type="checkbox" name="stock" value="at&t"> at&t</p><br>
  <p align= "left"><input type="checkbox" name="stock" value="General Electric"> General Electric</p><br>
  <p align= "left"><input type="checkbox" name="stock" value="exxonmobil"> exxonmobil</p><br>
  <input type="submit" value="follow"><br><br><br>
  <%

  PreparedStatement statemen = connect.prepareStatement("select category,interest FROM follow_table WHERE salary <?");
  statemen.setString(1, usersalary);  
  ResultSet resultSe = statemen.executeQuery();
  out.print("<h4><b>Your suggestion list for Stock</b></h4>");
  while(resultSe.next()){
     String categorydb = resultSe.getString("category");
  if (categorydb.equals("stock")) {  
	  String s=resultSe.getString("interest");
	  out.println(s+",");
  }}
  out.println(".");
  %>
</form>
  </div>

<div class="column" style="background-color:#B2D4DE;">
  <h2>Mutual Funds</h2>
  <form action="follow" method="post">
  <p align= "left"><input type="checkbox" name="stock" value="l & t mutual funds"> l & t mutual funds</p><br>
  <p align= "left"><input type="checkbox" name="stock" value="fidelity contrafund"> fidelity contrafund</p><br>
  <p align= "left"><input type="checkbox" name="stock" value="Hancock horizon funds"> Hancock horizon funds</p><br>
  <p align= "left"><input type="checkbox" name="stock" value="Meeder murifield fund">Meeder murifield fund</p><br>
  <p align= "left"><input type="checkbox" name="stock" value="profound ultrachic">profound ultrachic</p><br>
  <p align= "left"><input type="checkbox" name="stock" value="american funds global balanced">american funds global balanced</p><br>
  <p align= "left"><input type="checkbox" name="stock" value="us bank">us bank</p><br>
  <p align= "left"><input type="checkbox" name="stock" value="vanguard small cap"> vanguard small cap</p><br>
  <p align= "left"><input type="checkbox" name="stock" value="bank of america"> bank of america</p><br>
  <input type="submit" value="follow"><br><br><br>
   <%
   PreparedStatement statement1 = connect.prepareStatement("select category,interest FROM follow_table WHERE salary <?");
   statement1.setString(1, usersalary);  
   ResultSet resultSet1 = statement1.executeQuery();
  out.print("<h4><b>Your suggestion list for Mutual Funds</b></h4>");
  while(resultSet1.next()){
     String categorydb = resultSet1.getString("category");
  if (categorydb.equals("mutual funds")) {  
      String s1=resultSet1.getString("interest");
      out.println(s1+",");
  }}
  out.println(".");
  %>
</form>
  </div>

<div class="column" style="background-color:#9ECCD9;">
  <h2>Real Estate</h2>
  <form action="follow" method="post">
  <p align= "left"><input type="checkbox" name="stock" value="century 21"> century 21</p><br>
  <p align= "left"><input type="checkbox" name="stock" value="coldwell banker"> coldwell banker</p><br>
  <p align= "left"><input type="checkbox" name="stock" value="acadian mining corporation"> acadian mining corporation</p><br>
  <p align= "left"><input type="checkbox" name="stock" value="the corcoran group">the corcoran group</p><br>
  <p align= "left"><input type="checkbox" name="stock" value="Camden property trust">Camden property trust</p><br>
  <p align= "left"><input type="checkbox" name="stock" value="bumper france">bumper france</p><br>
  <p align= "left"><input type="checkbox" name="stock" value="airport city group">airport city group</p><br>
  <p align= "left"><input type="checkbox" name="stock" value="arbico plc">arbico plc</p><br>
  <p align= "left"><input type="checkbox" name="stock" value="asia cement"> asia cement/p><br>
  <p align= "left"><input type="checkbox" name="stock" value="b & b realty ltd">b & b realty ltd</p><br>
  <p align= "left"><input type="checkbox" name="stock" value="Zillow">Zillow</p><br>
  <p align= "left"><input type="checkbox" name="stock" value="br malls">br malls</p><br>
  <p align= "left"><input type="checkbox" name="stock" value="better homes and gardens real estate">better homes and gardens real estate</p><br>
  <p align= "left"><input type="checkbox" name="stock" value="block real estate services"> block real estate services</p><br>
  <input type="submit" value="follow"><br><br><br>
  <%
  
   PreparedStatement statement2 = connect.prepareStatement("select category,interest FROM follow_table WHERE salary < ?");
   statement2.setString(1, usersalary);    
   ResultSet resultSet2 = statement2.executeQuery();
  out.print("<h4><b>Your suggestion list for Real estate</b></h4>");
  while(resultSet2.next()){
     String categorydb = resultSet2.getString("category");
  if (categorydb.equals("real estate")) {  
      String s2=resultSet2.getString("interest");
      out.println(s2+",");
  }}
  out.println(".");
  %>
  </form>
  </div>
  
</div>						
</div>
</body>
</html>