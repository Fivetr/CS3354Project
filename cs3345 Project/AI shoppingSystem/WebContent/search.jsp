<%@page import = "Connection.connecter" %>
<%@page import = "java.sql.*" %>
<%@include file = "pageNavigation.jsp" %>
<link rel="stylesheet" href="style/search-style.css">
<html>
<head>
<title>Search Page</title>
</head>
<body>
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
			boolean hasItem = false;
			try{
			String search = request.getParameter("search");
			Connection connection = connecter.getCon();
			Statement statement = connection.createStatement();
			ResultSet Result = statement.executeQuery("select *from product where name like '%"+search+"%' or description like '%" +search+ "%'"); //get product from database
			while(Result.next()){
				hasItem = true;
		%>
          <tr>
            <td><%=Result.getString("name") %></td>
            <td><%=Result.getString("category") %></td>
	        <td><%=Result.getString("description") %></td>
	        <td><%=Result.getString("price") %></td>
	        <td><%=Result.getString("rating") %></td>
	        <td><a href="addCartUpdate.jsp?id=<%=Result.getString("id")%>"><i class='fas fa-cart-plus'></i></a></td>
          </tr>
         <%}
			}
			catch(Exception e){
				System.out.print(e);
			}%>
        </tbody>
</table>
      	<%if(hasItem == false){ %>
		<h2>No Such Item</h2>
		<%} %>
</body>
</html>