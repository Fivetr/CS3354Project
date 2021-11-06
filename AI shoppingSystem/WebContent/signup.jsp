<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="style/signup-style.css">
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
	<title>SignupHere</title>
</head>
<body> 
<div class='container'>
  <div class='signup'>
    <form action = "signupUpdate.jsp" method = "post">
	    <input type = "text"  		name = "name"  			placeholder = " Enter UserName"  	required>
	    <input type = "email"  		name = "email"  		placeholder = " Enter Email"  		required>
	    <input type = "text"		name = "address"		placeholder = " Enter Address"		required>
	    	<div class='box'>
	    		<input type = "text"		name = "city"			placeholder = " Enter City"			required>
	    	</div>
	    	<div class='box'>
	    		<input type = "text"		name = "state"			placeholder = " Enter State"			required>
	    	</div>
	    <input type = "text"		name = "country"		placeholder = " Enter Country"		required>
	    <input type = "password"   	name = "password"   	placeholder = " Enter Password"  	required> 
	    <input type = "submit"  name = "signup">
    </form>
  </div>
  <div class='description'>
  	<div class = 'out'>
		<img src = "images/img1.png" height = 100>
		<a href="login.jsp"><i class="fas fa-sign-in-alt"></i></a>
	</div>
		<p> For those who want to search for specific products with one click, rather than digging in all other websites.Our system will significantly reduce your time cost when searches for a specific product online.</p>
		<% 
		String msg = request.getParameter("msg");
		if("valid".equals(msg)){
		%>
		<h1>Registration Successful!</h1>
		<%} %>
		<%
		if("invalid".equals(msg)){
		%>
		<h1>Error: Email or UserName is already registered</h1>
		<% } %>
   </div>
</div>
</body>
</html>