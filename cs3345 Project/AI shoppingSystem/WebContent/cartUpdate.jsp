<%@page import = "Connection.connecter" %>
<%@page import = "java.sql.*" %>
<%
	String user = session.getAttribute("UserID").toString();
	String string_id = request.getParameter("id");
	
	int quantity = 1;
	String price = "";
	String total = "";
	double product_price = 0;
	double product_total = 0;
	
	boolean hasProduct = false;
	try{
		
		Connection connection = connecter.getCon();
		Statement statement = connection.createStatement();
		
		//get product information
		ResultSet Result = statement.executeQuery("select *from product where id ='" +string_id+ "'");
		while(Result.next()){
			price = Result.getString("price");
			price = price.substring(1);
			product_price = Double.parseDouble(price);
		}
		
		//get order information
		ResultSet Result2 = statement.executeQuery("select *from orders where userId ='" +user + "' and productId ='" +string_id+ "'");
		while(Result2.next()){
			total = Result2.getString("total");
			total = total.substring(1);
			product_total = Double.parseDouble(total);
			product_total += product_price;
			quantity = Result2.getInt("quantity");
			quantity++;
			
			hasProduct = true;
		}
		
		//already exist in database
		if(hasProduct == true){
			String str_total=String.valueOf(product_total); 
			statement.executeUpdate("update orders set total ='$"+str_total+"', quantity ='" +quantity+"' where userId ='" +user + "' and productId =" +string_id+ "");
			response.sendRedirect("home.jsp");
		}
		
		//new product added
		if(hasProduct == false){ 
			PreparedStatement ps = connection.prepareStatement("insert into orders(userId,productId,quantity,total) values (?,?,?,?)");
			int id=Integer.parseInt(string_id);   
			String str_price = String.valueOf(product_price);
			ps.setString(1,user);
			ps.setInt(2,id);
			ps.setInt(3, quantity);
			ps.setString(4, "$" + str_price);
			ps.executeUpdate();
			response.sendRedirect("home.jsp");
		}
		
	}
	catch(Exception e){
		System.out.print(e);
		}
%>