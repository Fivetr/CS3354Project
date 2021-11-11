<%@page import = "Connection.connecter" %>
<%@page import = "java.sql.*" %>
<%@include file = "pageNavigation.jsp" %>
<link rel="stylesheet" href="style/home-style.css">
<html>
<head>
<title>Home Page</title>
</head>
<body>
	<h2>Home Page <i class="fa fa-home"></i></h2>
	<table>
	        <thead>
	          <tr>
	            <th scope="col">Name</th>
	            <th scope="col">Category</th>
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
			ResultSet Result = statement.executeQuery("select *from product order by rand() limit 15"); //get product from database
			while(Result.next()){
		%>
	          <tr>
	            <td><%=Result.getString("name") %></td>
	            <td><%=Result.getString("category") %></td>
	            <td><%=Result.getString("description") %></td>
	            <td><%=Result.getString("price") %></td>
	            <td><%=Result.getString("rating") %></td>
	            <td><a href="cartUpdate.jsp?id=<%=Result.getString("id")%>"><i class='fas fa-cart-plus'></i></a></td>
	          </tr>
	    <%}
			}
			catch(Exception e){
				System.out.print(e);
			}%>
	        </tbody>
   </table>
</body>
</html>