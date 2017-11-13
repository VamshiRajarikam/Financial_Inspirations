<%@ page import="java.sql.*, java.util.Date, java.text.*,java.util.Random,javax.servlet.http.Cookie" language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html,body,h1,h2,h3,h4,h5 {font-family: "Open Sans", sans-serif}
</style>
<title>Financial Inspiration</title>
</head>
<!-- Nav bar -->
<body>
	<div class="w3-top">
		<div class="w3-bar w3-theme-d2 w3-left-align w3-large">
			<a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()">
			     <i class="fa fa-bars"></i></a> 
			<a href="Home.jsp" class="w3-bar-item w3-button w3-padding-large w3-theme-d4">
			     <i class="fa fa-home w3-margin-right"></i>Home</a> 
			<a href="Follow.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Follow">
			     <i class="fa fa-globe"></i></a> 
			<a href="logout.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Log out">
			     <i class="fa fa-user"></i></a> 
			<a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"	title="Messages">
			     <i class="fa fa-envelope"></i></a>
			<div class="w3-dropdown-hover w3-hide-small">
				<button class="w3-button w3-padding-large" title="Notifications">
					<i class="fa fa-bell"></i>
					<span class="w3-badge w3-right w3-small w3-green">3</span>
				</button>
				<div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width: 300px">
					<a href="#" class="w3-bar-item w3-button">One new friend request</a> 
					<a href="#" class="w3-bar-item w3-button">John Doe posted on your wall</a> 
					<a href="#" class="w3-bar-item w3-button">Jane likes your post</a>
				</div>
			</div>
		</div>
	</div>
    
    <div class="w3-container w3-content" style="max-width:1400px;margin-top:40px"> 
     <h1 class="w3-center ">
            <strong>Financial Inspiration </strong>
        </h1>
        </div>
  <!-- The Grid -->
  <div class="w3-row">
    <!-- Left Column -->
    <div class="w3-col m3">
      <!-- Profile -->
      <div class="w3-card w3-round w3-white">
        <div class="w3-container">
         <h4 class="w3-center">My Profile</h4>
         <%
         String cookiename=null;
         Cookie ck[]= request.getCookies();
         if(ck.length>0){
        	 cookiename=ck[1].getValue();
         }
         Class.forName("com.mysql.jdbc.Driver");

         Connection connect = DriverManager
                 .getConnection("jdbc:mysql://localhost:3309/myproject?" + "user=root&password=");
         
         //Statement statement = connect.createStatement();
         //String userquery= "Select user_name,email FROM user Where user_name="+cookiename;
         //Statement statement2 = connect.createStatement();
         //ResultSet resultSet= statement2.executeQuery(userquery);
         PreparedStatement statement = connect.prepareStatement("select user_name,email FROM user Where user_name= ?");    
         statement.setString(1, cookiename);    
         ResultSet resultSet = statement.executeQuery();
         //ps2.setString(1,cookiename);
         //ps2.addBatch();
         //ResultSet resultSet = ps2.executeBatch();
         
         //reading from db
         while(resultSet.next()){
             //String firstname= resultSet.getString("first_name");
             String username= resultSet.getString("user_name");
             String email= resultSet.getString("email");
             out.print("<hr>");
             //out.print("<p>"+firstname+"</p>");
             out.print("<p>Hello @" + username+"</p>");
             out.print("<p>" + email+"</p>");
         }
         %>
        </div>
      </div>
      <br>
      
      <!-- Accordion -->
      <div class="w3-card w3-round">
        <div class="w3-white">
          <button onclick="myFunction('Demo1')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i> My Groups</button>
          <div id="Demo1" class="w3-hide w3-container">
            <p>Some text..</p>
          </div>
          <button onclick="myFunction('Demo2')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i> My Events</button>
          <div id="Demo2" class="w3-hide w3-container">
            <p>Some other text..</p>
          </div>
          <button onclick="myFunction('Demo3')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-users fa-fw w3-margin-right"></i> My Photos</button>
          <div id="Demo3" class="w3-hide w3-container">
         <div class="w3-row-padding">
         <br>
           <div class="w3-half">
             <img src="/w3images/lights.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="/w3images/nature.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="/w3images/mountains.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="/w3images/forest.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="/w3images/nature.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="/w3images/fjords.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
         </div>
          </div>
        </div>      
      </div>
      <br>
      
      <!-- Interests --> 
      <div class="w3-card w3-round w3-white w3-hide-small">
        <div class="w3-container">
          <p>Interests</p>
          <p><% PreparedStatement statem = connect.prepareStatement("select interest FROM user_follow Where user_name= ?");    
          statem.setString(1, cookiename);    
          ResultSet resul = statem.executeQuery();
          while(resul.next()){
        	  String inter=resul.getString("interest");
          %>
            <span class="w3-tag w3-small w3-theme-d5"><%out.print(inter); %></span>
          <%} %>
          </p>
        </div>
      </div>
      <br>
      
      <!-- Alert Box -->
      <div class="w3-container w3-display-container w3-round w3-theme-l4 w3-border w3-theme-border w3-margin-bottom w3-hide-small">
        <span onclick="this.parentElement.style.display='none'" class="w3-button w3-theme-l3 w3-display-topright">
          <i class="fa fa-remove"></i>
        </span>
        <p><strong>Hey!</strong></p>
        <p>People are looking at your profile. Find out who.</p>
      </div>
    
    <!-- End Left Column -->
    </div>
    
    <!-- Middle Column -->
    <div class="w3-col m7">
    
      <div class="w3-row-padding">
        <div class="w3-col m12">
          <div class="w3-card w3-round w3-white">
            <div class="w3-container w3-padding">
              <h6 class="w3-opacity">Post your views</h6>
              <form action="insertPost.jsp" method="post">
              <input contenteditable="true" type="text" name="posting" class="w3-border w3-padding" size="79"><br><p>
              <button type="submit" class="w3-button w3-theme"><i class="fa fa-pencil"></i> Post</button>
              </form> 
            </div>
          </div>
        </div>
      </div>
      
  
     
     <%ResultSet postSet = statement.executeQuery("Select post_id,post_user,post_description FROM post_table ORDER BY post_table.timestamp DESC");
     while(postSet.next()){
    	 %><div class="w3-container w3-card w3-white w3-round w3-margin"><br>
       <% 
         String postid=postSet.getString("post_id");
    	 String postuser= postSet.getString("post_user");
         String description= postSet.getString("post_description");
         out.print("<h6>"+postuser+"</h6>");
         %>
         <hr class="w3-clear">
         <%
         out.print("<h6>"+description+"</h6><br>");
         %>
         <form action="reply">
         <input type="text" name="replytext" style="height: 40px; width: 600px;"><br>
         <button type="button" class="w3-button w3-theme-d2 w3-margin-bottom" name="replybutton"><i class="fa fa-comment" ></i>Reply</button>
         <%
         
         %> 
         </form>
         <% String postidquery="SELECT reply FROM reply_table WHERE post_id=?";
         PreparedStatement postStatement=connect.prepareStatement(postidquery);
         postStatement.setString(1, postid);
         ResultSet postResult=postStatement.executeQuery();
         while(postResult.next()){
        	 out.print("<b><p>Reply:</b> "+postResult.getString("reply")+"</p>");
         }
         
         %>
         </div>
         
      <%}%>

      
      
    <!-- End Middle Column -->
    
    </div>
    
  <!-- End Grid -->
  </div>
  
</body>
</html>