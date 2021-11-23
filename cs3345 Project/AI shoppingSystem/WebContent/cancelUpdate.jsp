<%@page import = "Connection.connecter" %>
<%@page import = "java.sql.*" %>
<%
	String string_id = request.getParameter("id");
	try{
		Connection connection = connecter.getCon();
		Statement statement = connection.createStatement();
		
		statement.executeUpdate("delete from receipt where orderid ='" +string_id + "'");
		
		response.sendRedirect("orders.jsp");
	}
	catch(Exception e){
		System.out.println(e);
	}
%>