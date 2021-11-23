<%@page import = "Connection.connecter" %>
<%@page import = "java.sql.*" %>
<%@include file = "pageNavigation.jsp" %>
<%@page import = "java.lang.Math" %>
<link rel="stylesheet" href="style/edit-style.css">
<html>
<head>
<title>Edit Address Page</title>
</head>
<body>
	<h2>Edit Address  <i class="fas fa-address-card"></i></h2>
	<form action = "editUpdate.jsp?msg=editaddress" method = "post">
	<div class = "change">
	<table>
	          <tr>
	          <td>Address:</td>
	          <td><input type = "text" name = "address" placeholder = " Enter Street Address" required></input></td>
	          <td></td>
	          </tr>
	          
	          <tr>
	          <td>City:</td>
	          <td><input type = "text" name = "city" placeholder = " Enter City" required></input></td>
	          <td></td>
	          </tr>
	          
	          <tr>
	          <td>State:</td>
	          <td><input type = "text" name = "state" placeholder = " Enter State" required></input></td>
	          <td></td>
	          </tr>
	          
	          <tr>
	          <td>Zip Code:</td>
	          <td><input type = "text" name = "zip" placeholder = " Enter Zip Code" required></input></td>
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