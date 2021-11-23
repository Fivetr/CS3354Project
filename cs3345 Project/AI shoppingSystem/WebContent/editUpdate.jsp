<%@page import = "Connection.connecter" %>>
<%@page import = "java.sql.*" %>>
<%
	String user = session.getAttribute("UserID").toString();
	String address = request.getParameter("address");
	String city = request.getParameter("city");
	String state = request.getParameter("state");
	String zip = request.getParameter("zip");

	String password = request.getParameter("password");
	
	String email = request.getParameter("email");
	
	String option = request.getParameter("msg");
	try{
		Connection connection = connecter.getCon();
		Statement statement = connection.createStatement();
		
		//edit address
		if(option.equals("editaddress")){
			statement.executeUpdate("update users set address ='"+address+"', city ='" +city+ "', state ='" +state + "', zipcode ='" +zip+ "' where name = '"+user+"'");
			response.sendRedirect("profile.jsp");
		}
		
		//edit password
		if(option.equals("editpassword")){
			statement.executeUpdate("update users set password ='"+password+"' where name = '"+user+"'");
			response.sendRedirect("profile.jsp");
		}
		
		//edit email
		if(option.equals("editemail")){
			String name  = "";
			ResultSet Result = statement.executeQuery("select name from users where email ='" +email+ "'");
			while(Result.next()){
				name = Result.getString("name");
			}
			
			if(name.equals("")){ //new email
				statement.executeUpdate("update users set email ='"+email+"' where name = '"+user+"'");
				response.sendRedirect("profile.jsp?");
			}
			else if(name.equals(user)){ //same email with same user name
				response.sendRedirect("profile.jsp?");
			}
			else{//email already been registered by another user
				response.sendRedirect("editemail.jsp?msg=invalid");
			}
		}
	}
	catch(Exception e){
		System.out.println(e);
	}
%>