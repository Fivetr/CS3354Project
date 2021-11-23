<%@page import = "Connection.connecter" %>
<%@page import = "java.sql.*" %>
<%
	int min = 10000;
	int max = 99999;
	
	int orderID = (int)Math.floor(Math.random()*(max-min+1)+min);

	
	String user = session.getAttribute("UserID").toString();
	try{
		Connection connection = connecter.getCon();
		Statement statement = connection.createStatement();
		
		ResultSet Result = statement.executeQuery("select* from orders inner join product on product.id = orders.productId and orders.userID = '"+user+"' join users on orders.userId = users.name");
		while(Result.next()){
			PreparedStatement ps = connection.prepareStatement("insert into receipt(orderid,username,productid,quantity,total,email,address,city,state,zipcode,orderdate,deliverydate) values (?,?,?,?,?,?,?,?,?,?,NOW(),DATE_ADD(orderdate,interval 5 day))");
			ps.setInt(1,orderID);
			ps.setString(2,user);
			ps.setInt(3,Result.getInt("productID"));
			ps.setInt(4,Result.getInt("quantity"));
			ps.setString(5,Result.getString("total"));
			ps.setString(6,Result.getString("email"));
			ps.setString(7,Result.getString("address"));
			ps.setString(8,Result.getString("city"));
			ps.setString(9,Result.getString("state"));
			ps.setString(10,Result.getString("zipcode"));
			ps.executeUpdate();
		}
		response.sendRedirect("home.jsp");
	}
	catch(Exception e){
		System.out.println(e);
	}
%>