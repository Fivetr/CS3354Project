<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style/login-style.css">
<title>Login</title>
</head>
<body>
<div class='container'>
  <h2>Online Shopping System</h2>
  <div class='login'>
  <img id = "img" src = "images/smile.png" height = 150>
     <form action ="loginUpdate.jsp" method = "post">
	     <input type = "text" 		name = "UserID" 		placeholder = " Enter UserName or Email" required>
	     <input type = "password" 	name = "password" 	placeholder = " Enter Password" required>
	     <input type = "submit" value ="Login">
     </form>
     <h2><a href="signup.jsp">SignUp</a></h2>
     <h2 id = "forgotpassword"><a href="forgotPassword.jsp">>>>Forgot Password</a></h2>
     <% 
	 	String msg = request.getParameter("msg");
	  	if ("notexist".equals(msg))
	  	{
	  %> 
	  	<img src = "images/emoji.png" height = 150>
	  	<h1>Incorrect Email or Password</h1>
	  <%} %>	
  </div>
</div>
</body>
</html>