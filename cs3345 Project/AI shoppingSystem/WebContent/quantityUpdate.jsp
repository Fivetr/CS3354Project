<%@page import = "Connection.connecter" %>
<%@page import = "java.sql.*" %>
<%@page import = "java.lang.Math" %>

<%
	String user = session.getAttribute("UserID").toString();
	String string_id = request.getParameter("id");
	String option = request.getParameter("msg");
	
	int quantity = 0;
	String price = "";
	String total = "";
	double product_price = 0;
	double product_total = 0;
	
	try{
		Connection connection = connecter.getCon();
		Statement statement = connection.createStatement();
		ResultSet Result = statement.executeQuery("select* from orders inner join product on product.id = orders.productId where orders.userId ='" +user + "' and orders.productId ='" +string_id+ "'");
		while(Result.next()){
			price = Result.getString("price");
			total = Result.getString("total");
			quantity = Result.getInt("quantity");
		}
		if(quantity == 1 && option.equals("decrease")){ //do nothing
			response.sendRedirect("cart.jsp");
		}
		else if (option.equals("decrease")){
			price = price.substring(1);
			total = total.substring(1);
			product_price = Double.parseDouble(price);
			product_total = Double.parseDouble(total);
			product_total -= product_price;
			quantity--;
			product_total = Math.round(product_total * 100.0) / 100.0;
			String str_total=String.valueOf(product_total); 
			statement.executeUpdate("update orders set total ='$"+str_total+"', quantity ='" +quantity+"' where userId ='" +user + "' and productId =" +string_id+ "");
			response.sendRedirect("cart.jsp");
		}
		else{
			price = price.substring(1);
			total = total.substring(1);
			product_price = Double.parseDouble(price);
			product_total = Double.parseDouble(total);
			product_total += product_price;
			product_total = Math.round(product_total * 100.0) / 100.0;
			quantity++;
			String str_total=String.valueOf(product_total); 
			statement.executeUpdate("update orders set total ='$"+str_total+"', quantity ='" +quantity+"' where userId ='" +user + "' and productId =" +string_id+ "");
			response.sendRedirect("cart.jsp");
		}
	}
	catch(Exception e){
		System.out.println(e);
	}
%>