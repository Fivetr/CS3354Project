package Connection;
import java.sql.*;
public class connecter {
	public static Connection getCon() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			//connect to mysqlWorkbench
			Connection connection = DriverManager.getConnection("jdbc:mysql://cs4347.c3bw7ao2sqoy.us-west-2.rds.amazonaws.com:3306/shopping", "@###@@#@#@#", "@#@!#!#!#");
			return connection;
			
		}
		catch(Exception e) {
			System.out.print(e);
			return null;
		}
	}
}
