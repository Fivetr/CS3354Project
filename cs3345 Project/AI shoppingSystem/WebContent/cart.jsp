<%@page import = "Connection.connecter" %>
<%@page import = "java.sql.*" %>
<%@include file = "pageNavigation.jsp" %>
<link rel="stylesheet" href="style/cart-style.css">
<html>
<head>
<title>Cart Page</title>
<style>
</style>
</head>
<body>
	<h2>Cart Page<i class="fas fa-shopping-cart"></i></h2>
	<div class = "pay">
	<a href="">check out    <i class="far fa-credit-card"></i></a>
	</div>
	<table>
	        
	        <thead>
	          <tr>
	          <th scope="col">#</th>
	            <th scope="col">Name</th>
	            <th scope="col">Category</th>
	            <th scope="col"><i class="fa fa-inr"></i> price</th>
	            <th scope="col">Quantity</th>
	            <th scope="col">Sub Total</th>
	            <th scope="col"><i class="fas fa-trash"></i></th>
	          </tr>
	        </thead>
	        
	        <tbody>    
	          <tr>
	           <td></td>
	            <td></td>
	            <td></td>
	            <td><i class="fa fa-inr"></i> </td>
	            <td><a href=""><i class="fas fa-plus-square"></i></a><a href=""> 0 <i class="fas fa-minus-square"></i></a></td>
	            <td><i class="fa fa-inr"></i> </td>
	            <td><a href=""><i class='fas fa-trash-alt'></i></a></td>
	          </tr>
	 		</tbody>
	 		<thead>
	          <tr>
	            <th scope="col">Total: $</th>
	            <th></th>
	            <th></th>
	            <th></th>
	            <th></th>
	            <th></th>
	            <th></th>
	          </tr>
	        </thead>
	 </table>
</body>
</html>