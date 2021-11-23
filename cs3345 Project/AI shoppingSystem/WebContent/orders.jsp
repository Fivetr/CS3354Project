<%@page import = "Connection.connecter" %>
<%@page import = "java.sql.*" %>
<%@include file = "pageNavigation.jsp" %>
<%@page import = "java.lang.Math" %>
<link rel="stylesheet" href="style/orders-style.css">
<html>
<head>
<title>Orders Page</title>
</head>
<body>
	<h2>ORDERS   <i class="fas fa-clipboard-list"></i></h2>
	<table>
	        <thead>
	        <%
	        String user = session.getAttribute("UserID").toString();
	        double total = 0;
	        String str_total = "";
	        int count = 0;
	        try{
	        	Connection connection = connecter.getCon();
	    		Statement statement = connection.createStatement();  
	        %>
	          <tr>
	          <th scope="col">order id</th>
	            <th scope="col">order placed</th>
	            <th scope="col">estimated delivery day</th>
	            <th scope="col">cancel order   <i class="fas fa-ban"></i></th>
	          </tr>
	        </thead>
	        
	        <tbody>    
	        <%
	        ResultSet Result = statement.executeQuery("select* from receipt where username ='"+user+"' GROUP BY orderid" );
	        while(Result.next()){
	        	String date = Result.getString("deliverydate");
	        	date = date.substring(0,date.indexOf(" "));
	        %>
	          <tr>
	           <td><a href="order.jsp?id=<%=Result.getString("orderid")%>"><i class="fas fa-eye"></i></a>   <%=Result.getString("orderid")%></td>
	            <td><%=Result.getString("orderdate")%></td>
	            <td><%=date%></td>
	            <td><a href="cancelUpdate.jsp?id=<%=Result.getString("orderid")%>"><i class="fas fa-window-close"></i></a></td>
	          </tr>
	      <%	
	      		}
	        }
	        catch(Exception e){
	        	System.out.println(e);
	        }
	       %>
	 		</tbody>
	 </table>
	<br>
    <br>
</body>
</html>