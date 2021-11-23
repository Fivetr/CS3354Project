<%@page import = "Connection.connecter" %>
<%@page import = "java.sql.*" %>
<%@include file = "pageNavigation.jsp" %>
<%@page import = "java.lang.Math" %>
<link rel="stylesheet" href="style/profile-style.css">
<html>
<head>
<title>Profile Page</title>
</head>
<body>
	<h2>PROFILE   <i class="fas fa-address-card"></i></h2>
	<table>
		<tbody>
		<%
			String user = session.getAttribute("UserID").toString();
			try{
			Connection connection = connecter.getCon();
			Statement statement = connection.createStatement();
			ResultSet Result = statement.executeQuery("select *from users where name ='"+user+"'"); //get product from database
			while(Result.next()){
		%>
	          <tr>
	          <td>Name:</td>
	          <td><%=Result.getString("name") %></td>
	          <td></td>
	          </tr>
	          
	          <tr>
	          <td>Email:</td>
	          <td><%=Result.getString("email") %></td>
	          <td></td>
	          </tr>
	          
	          <tr>
	          <td>Password:</td>
	          <td><%=Result.getString("password") %></td>
	          <td></td>
	          </tr>
	          
	          <tr>
	          <td>Street Address:</td>
	          <td><%=Result.getString("address") %></td>
	          <td></td>
	          </tr>
	          
	          <tr>
	          <td>City:</td>
	          <td><%=Result.getString("city") %></td>
	          <td></td>
	          </tr>
	          
	          <tr>
	          <td>State:</td>
	          <td><%=Result.getString("state") %></td>
	          <td></td>
	          </tr>
	          
	          <tr>
	          <td>Zip Code:</td>
	          <td><%=Result.getString("zipcode") %></td>
	          <td></td>
	          </tr>
	          <%}
					}
				catch (Exception e){System.out.println(e);}
	          %>
		</tbody>
	 </table>
	 <br>
	<div class = "change">
		<a href="editpassword.jsp">Edit Password <i class="fas fa-edit"></i></a>
	</div>
	<br>
	<br>
	<br>
	<div class = "change">
		<a href="editaddress.jsp">Edit Address <i class="fas fa-edit"></i></a>
	</div>
	<br>
	<br>
    <br>
    <div class = "change">
		<a href="editemail.jsp">Edit Email <i class="fas fa-edit"></i></a>
	</div>
	<br>
	<br>
    <br>
</body>
</html>