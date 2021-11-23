<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style/password-style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>ForgotPassword</title>
</head>
<body>
<div class='container'>
  <div class='password'>
    <h2>Forgot Password</h2>
   	<form action = "forgotPasswordUpdate.jsp" method = post>
     <input type = "text" name = "userID" placeholder = " Enter UserName or Email" required></input>
     <input type = "submit"  value = "Submit">
    </form>
   		<% 
		String msg = request.getParameter("msg");
		if("done".equals(msg)){
		%>
		<%String Password = session.getAttribute("password").toString();%>
    	<h3><% out.print("Password: "+ Password + " "); %></h3>
		<%} %>
		<%
		if("invalid".equals(msg)){
		%>
		<h1>Error: Incorrect UserName or Email</h1>
		<% } %>	
		<br>
		<br>
	<a href="login.jsp"><i class="fas fa-sign-in-alt"></i></a>
  </div>
</div>
</body>
</html>