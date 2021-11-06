<%@page import = "Connection.connecter" %>
<%@page import = "java.sql.*" %>
<%@include file = "pageNavigation.jsp" %>
<link rel="stylesheet" href="style/home-style.css">
<html>
<head>
<title>Home</title>
</head>
<body>
	<h2>Home Page <i class="fa fa-home"></i></h2>
	<table>
	        <thead>
	          <tr>
	            <th scope="col">Name</th>
	            <th scope="col">Description</th>
	            <th scope="col"><i class="fas fa-dollar-sign"></i> Price</th>
	            <th scope="col">Rating</th>
	            <th scope="col"><i class="fas fa-shopping-cart"></i></th>
	          </tr>
	        </thead>
	        <tbody>
		<%
			try{
			Connection connection = connecter.getCon();
			Statement statement = connection.createStatement();
			//will make the item random, once we have enough data for the products
			ResultSet Result = statement.executeQuery("select *from product where name like 'Google Pixel%' limit 10"); //get product from database
			while(Result.next()){
		%>
	          <tr>
	            <td><%=Result.getString("name") %></td>
	            <td><%=Result.getString("description") %></td>
	            <td><%=Result.getString("price") %></td>
	            <td><%=Result.getString("rating") %></td>
	            <td><a href=""><i class='fas fa-cart-plus'></i></a></td>
	          </tr>
	    <%}
			}
			catch(Exception e){
				System.out.print(e);
			}%>
	        </tbody>
      </table>
      <br>
      <br>
      <br>
</body>
</html>