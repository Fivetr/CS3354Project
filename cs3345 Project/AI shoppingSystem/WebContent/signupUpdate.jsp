<%@page import = "Connection.connecter" %>>
<%@page import = "java.sql.*" %>>
<%
// get user input
String name = request.getParameter("name"); 
String email = request.getParameter("email");
String address = request.getParameter("address");
String city = request.getParameter("city");
String state = request.getParameter("state");
String country = request.getParameter("country");
String password = request.getParameter("password");
try{
	Connection connection = connecter.getCon();
	PreparedStatement ps = connection.prepareStatement("insert into users values(?,?,?,?,?,?,?)"); //sql insert statement
	ps.setString(1, name);
	ps.setString(2, email);
	ps.setString(3, address);
	ps.setString(4, city);
	ps.setString(5, state);
	ps.setString(6, country);
	ps.setString(7, password);
	ps.executeUpdate(); //insert into database
	response.sendRedirect("signup.jsp?msg=valid");
}
catch(Exception e){
	System.out.print(e);
	response.sendRedirect("signup.jsp?msg=invalid");
}
%>