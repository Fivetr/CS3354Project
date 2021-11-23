<%@page import = "Connection.connecter" %>
<%@page import = "java.sql.*" %>
<%
	String user = session.getAttribute("UserID").toString();
	String string_id = request.getParameter("id");
	String option = request.getParameter("msg");
	try{
		Connection connection = connecter.getCon();
		Statement statement = connection.createStatement();
		
		if(option.equals("deleteall")){
			statement.executeUpdate("delete from orders where userId ='" +user + "'");
		}
		
		if(option.equals("delete")){
			statement.executeUpdate("delete from orders where userId ='" +user + "' and productId =" +string_id+ "");
		}
		
		response.sendRedirect("cart.jsp");
	}
	catch(Exception e){
		System.out.println(e);
	}
%>