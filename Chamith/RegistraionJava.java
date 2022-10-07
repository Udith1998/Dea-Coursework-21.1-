package registration_package;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;



public class RegistraionJava {
	Statement st;
	
	//connect to the DB
	private void connectToDB() {
		String url="jdbc:mysql://localhost:3306/registration";
		try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,"root","");
		st=con.createStatement();
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	// Sign up process
	public void Signup(String uname, String pwd) {
		connectToDB();
		String sql="INSERT INTO client(uname,upwd)VALUES('"+uname+"','"+pwd+"');";
		try {
			st.executeUpdate(sql);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}	

}
