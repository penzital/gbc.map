package dbUtility;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;

public class DatabaseConnector {
	
	
	/*static File file = new File("db.properties");
	public final static String DBpath = file.getAbsolutePath();*/
	
	public static Connection getConnection() {
		
		Properties props = new Properties();
		ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
		InputStream fis = classLoader.getResourceAsStream("db.properties");
		

		Connection con = null;
		
		try {
			System.out.println( fis);
			props.load(fis);
			
			// load the Driver Class
			Class.forName(props.getProperty("DB_DRIVER_CLASS"));

			// create the connection now
			con = DriverManager.getConnection(props.getProperty("DB_URL"),
					props.getProperty("DB_USERNAME"),
					props.getProperty("DB_PASSWORD"));
		} catch (IOException | ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}

	  public static void main(String[] args) {
		  System.out.println();
		  getConnection();
	}
}
