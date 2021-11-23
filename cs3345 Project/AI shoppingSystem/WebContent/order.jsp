<%@page import = "Connection.connecter" %>
<%@page import = "java.sql.*" %>
<%@include file = "pageNavigation.jsp" %>
<%@page import = "java.lang.Math" %>
<link rel="stylesheet" href="style/order-style.css">
<html>
<head>
<title>Order Page</title>
</head>
<body>
	<h2>ORDER DETAIL  <i class="fas fa-money-check-alt"></i></h2>
	<br>
	<h5>Oder <i class="fas fa-shopping-bag"></i></h5>
	<table>
	        <thead>
	        <%
	        String user = session.getAttribute("UserID").toString();
	        String order_id = request.getParameter("id");
	        double total = 0;
	        String str_total = "";
	        int count = 0;
	        try{
	        	Connection connection = connecter.getCon();
	    		Statement statement = connection.createStatement();
	    		ResultSet Result = statement.executeQuery("select* from receipt where orderid ='"+order_id+"' and username = '"+user+"'");
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
	          </tr>
	        </thead>
	        
	        <tbody>    
	        <%
	        ResultSet Result2 = statement.executeQuery("select* from receipt inner join product on product.id = receipt.productid where orderid ='"+order_id+"' and username = '"+user+"'");
	        while(Result2.next()){
	        %>
	          <tr>
	           <td><%=Result2.getString(17)%></td>
	            <td><%=Result2.getString("category")%></td>
	            <td><%=Result2.getString("description")%></td>
	            <td><i class="fa fa-inr"></i><%=Result2.getString("price")%></td>
	            <td><%=Result2.getString("quantity")%></td>
	            <td><i class="fa fa-inr"></i><%=Result2.getString("total")%></td>
	          </tr>
	      <%	
	      	int temp = Result2.getInt("quantity");
	      	count+= temp;
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
	          </tr>
	        </thead>
	 </table>
	 <br>
	 <br>
	<h5>Delivery Address  <i class="fas fa-truck"></i></h5>
    <br>
		<%
			ResultSet Result3 = statement.executeQuery("select* from receipt where orderid ='"+order_id+"' and username = '"+user+"' Group by orderid"); 
			while(Result3.next()){
		%>
		
		<div class="left">
		<h3>Address: <%=Result3.getString("address") %></h3>
		</div>
		
		<div class="right">
		<h3>City: <%=Result3.getString("city") %></h3>
		</div> 
		
		<div class="left">
		<h3>State: <%=Result3.getString("state") %></h3>
		</div>
	
		<div class="right">
		<h3>Zip Code: <%=Result3.getString("zipcode") %></h3>
		</div>
	
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<h5>Email  <i class="fas fa-envelope-open-text"></i></h5>
	
	<div class = "email">
		<h4 style = "text-align: center">Email: <%=Result3.getString("email") %></h4>
	</div>
	
	 <br>
	 <br>
	<%		}
		}
		catch (Exception e){System.out.println(e);}
	 %>
	 <br>
	 <br>
	 <div class = "back">
	 <a href="orders.jsp"><i class="fas fa-arrow-circle-left"></i></a>
	 </div>
</body>
</html>