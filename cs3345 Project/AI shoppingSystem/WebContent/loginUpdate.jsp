<%@page import = "Connection.connecter" %>>
<%@page import = "java.sql.*" %>>
<%
	String UserID = request.getParameter("UserID");
	String password = request.getParameter("password");
	
	try{
		Connection connection = connecter.getCon();
		Statement statement = connection.createStatement();
		ResultSet Result = statement.executeQuery("select *from users where (name='"+ UserID + "' or email='" +UserID+ "') and password='" +password+ "'"); //get user from database
		if (Result.next() == false) { //no such user 
			response.sendRedirect("login.jsp?msg=notexist");
		} 
		else{ 
			do { 
				String username = Result.getString("name"); //get user name
				session.setAttribute("UserID", username); //save user name
				response.sendRedirect("home.jsp"); 
		} 
			while (Result.next()); 
			}
		}
	catch(Exception e){
		System.out.print(e);
		}
%>