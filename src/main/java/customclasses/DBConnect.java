package customclasses;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class DBConnect {

	private static Connection con=null;
	
	public static Connection getConnection()
	{
		try
		{
			if(con==null)
			{
				ConfigLoader config = new ConfigLoader();
				String islive = config.getProperty("islive");
				String url = "";
				String username = "";
				String password = "";
				if(islive.equalsIgnoreCase("YES")) {
					url = config.getProperty("db.live.url");
					username = config.getProperty("db.live.username");
					password = config.getProperty("db.live.password");
				}else {
					
					url = config.getProperty("db.local.url");
					username = config.getProperty("db.local.username");
					password = config.getProperty("db.local.password");
				}
				 
			    Class.forName("com.mysql.cj.jdbc.Driver");
			    con = DriverManager.getConnection(url, username, password);
			    System.out.println("DB connection opened");
			}
			else {
				System.out.println("DB connection established");
			}
		}
		catch (SQLException e) 
		{
			System.out.println("DB connection error");
			e.printStackTrace();
		}
		catch (Exception e) 
		{
			System.out.println("Other exception happened");
			e.printStackTrace();
		}
		return con;
	}

}