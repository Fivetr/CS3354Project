<%@page import = "Connection.connecter" %>>
<%@page import = "java.sql.*" %>>
<%
	String userID = request.getParameter("userID");
	String newPassword = request.getParameter("password");
	
	try{
		Connection connection = connecter.getCon();
		Statement statement = connection.createStatement();
		ResultSet Result = statement.executeQuery("select *from users where name='"+ userID + "' or email='" +userID+ "'"); //get user from database
		if (Result.next() == false) { //no such user
			response.sendRedirect("forgotPassword.jsp?msg=invalid"); 
		} 
		else{ 
			do { 
				String Password = Result.getString("password");  //get old password
				session.setAttribute("password", Password); //save old password
				response.sendRedirect("forgotPassword.jsp?msg=done"); //valid
		} 
			while (Result.next()); 
			}
		}
	catch(Exception e){
		System.out.print(e);
		}
%>