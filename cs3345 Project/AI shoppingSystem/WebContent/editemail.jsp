<%@page import = "Connection.connecter" %>
<%@page import = "java.sql.*" %>
<%@include file = "pageNavigation.jsp" %>
<%@page import = "java.lang.Math" %>
<link rel="stylesheet" href="style/edit-style.css">
<html>
<head>
<title>Edit Email Page</title>
</head>
<body>
	<h2>Edit Email  <i class="fas fa-address-card"></i></h2>
	<form action = "editUpdate.jsp?msg=editemail" method = "post">
	<div class = "change">
	<table>
	          <tr>
	          <td>Email:</td>
	          <td><input type = "text" name = "email" placeholder = " Enter Email" required></input></td>
	          <td></td>
	          </tr>
	 </table>
	 </div>
	 <br>
	 <div class = "edit">
		<input type = "submit"  name = "submit">
	</div>
	</form>
	<br>
	<br>
	<br>
	<% 
		String msg = request.getParameter("msg");
		if("invalid".equals(msg)){
		%>
		<h1>Error: This Email has been registered by another user</h1>
		<%} %>
	<br>
    <br>
</body>
</html>