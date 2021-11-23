<%@page import = "Connection.connecter" %>
<%@page import = "java.sql.*" %>
<%@include file = "pageNavigation.jsp" %>
<%@page import = "java.lang.Math" %>
<link rel="stylesheet" href="style/edit-style.css">
<html>
<head>
<title>Edit Password Page</title>
</head>
<body>
	<h2>Edit Password  <i class="fas fa-address-card"></i></h2>
	<form action = "editUpdate.jsp?msg=editpassword" method = "post">
	<div class = "change">
	<table>
	          <tr>
	          <td>Password:</td>
	          <td><input type = "text" name = "password" placeholder = " Enter Password" required></input></td>
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
</body>
</html>