<%@page import = "Connection.connecter" %>>
<%@page import = "java.sql.*" %>>
<%
try{
	Connection connection = connecter.getCon();
	Statement statement = connection.createStatement();
	// sql create table statement
	String sql1 = "create table users(name varchar(50) NOT NULL UNIQUE, email varchar(50)primary key, address varchar(100), city varchar(30), state varchar(30), country varchar(30), password varchar(50))";
	String sql2 = "create table product(ID int AUTO_INCREMENT primary key, description varchar(500), price varchar(50), rating varchar(100), name varchar(100), category varchar(100))";
	String sql3 = "create table orders(userId varchar(50), productId int, quantity int, total varchar(100))";
	// create
	statement.execute(sql1);
	statement.execute(sql2);
	statement.execute(sql3);
	connection.close();
}
catch(Exception e){
	System.out.print(e);
}
%>