<%@page import = "Connection.connecter" %>
<%@page import = "java.sql.*" %>
<%@include file = "pageNavigation.jsp" %>
<%@page import = "java.lang.Math" %>
<link rel="stylesheet" href="style/cart-style.css">
<html>
<head>
<title>Cart Page</title>
</head>
<body>
	<h2>CART   <i class="fas fa-shopping-cart"></i></h2>
	<div class = "pay">
	<a href="checkout.jsp">check out    <i class="far fa-credit-card"></i></a>
	</div>
	<table>
	        <thead>
	        <%
	        String user = session.getAttribute("UserID").toString();
	        double total = 0;
	        String str_total = "";
	        int count = 0;
	        try{
	        	Connection connection = connecter.getCon();
	    		Statement statement = connection.createStatement();
	    		ResultSet Result = statement.executeQuery("select total from orders where userID ='"+user+"'");
	    		while(Result.next()){
	    			str_total = Result.getString("total");
	    			str_total = str_total.substring(1);
	    			double temp = Double.parseDouble(str_total);
	    			total += temp;
	    			total = Math.round(total * 100.0) / 100.0;
	    		}      
	        %>
	          <tr>
	          <th scope="col">Name</th>
	            <th scope="col">Category</th>
	            <th scope="col">Description</th>
	            <th scope="col"><i class="fa fa-inr"></i> price</th>
	            <th scope="col">Quantity</th>
	            <th scope="col">Total</th>
	            <th scope="col"><i class="fas fa-trash"></i></th>
	          </tr>
	        </thead>
	        
	        <tbody>    
	        <%
	        ResultSet Result2 = statement.executeQuery("select* from orders inner join product on product.id = orders.productId and orders.userID ='"+user+"' Order by product.name" );
	        while(Result2.next()){
	        %>
	          <tr>
	           <td><%=Result2.getString(9)%></td>
	            <td><%=Result2.getString("category")%></td>
	            <td><%=Result2.getString("description")%></td>
	            <td><i class="fa fa-inr"></i><%=Result2.getString("price")%></td>
	            <td><a href="quantityUpdate.jsp?id=<%=Result2.getString("id")%>&msg=increase"><i class="fas fa-plus-square"></i></a> <%=Result2.getString("quantity")%> <a href="quantityUpdate.jsp?id=<%=Result2.getString("id")%>&msg=decrease"><i class="fas fa-minus-square"></i></a></td>
	            <td><i class="fa fa-inr"></i><%=Result2.getString("total")%></td>
	            <td><a href="removeUpdate.jsp?id=<%=Result2.getString("id")%>&msg=delete"><i class='fas fa-trash-alt'></i></a></td>
	          </tr>
	      <%	
	      	int temp = Result2.getInt("quantity");
	      	count+= temp;
	      		}
	        }
	        catch(Exception e){
	        	System.out.println(e);
	        }
	       %>
	 		</tbody>
	 		<thead>
	          <tr>
	            <th scope="col">Count: <%out.print(count);%></th>
	            <th></th>
	            <th></th>
	            <th></th>
	            <th></th>
	            <th scope="col">Sub Total: $<%out.print(total);%></th>
	            <th><a href="removeUpdate.jsp?msg=deleteall">Remove All</a></th>
	          </tr>
	        </thead>
	 </table>
	 <div class = "pay">
		<a href="checkout.jsp">check out    <i class="far fa-credit-card"></i></a>
	</div>
	<br>
    <br>
</body>
</html>