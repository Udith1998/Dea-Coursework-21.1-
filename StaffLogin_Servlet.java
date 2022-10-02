package registration_package;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Login_Servlet
 */
@WebServlet("/Login_Servlet")
public class Login_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname= request.getParameter("uname");
		String pwd=request.getParameter("pwd");
		
		String url="jdbc:mysql://localhost:3306/registration";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con;
			con = DriverManager.getConnection(url,"root","");
			String sql1="SELECT * FROM staff01 WHERE uname=? AND Pwd=?;";
			String sql2="SELECT * FROM staff02 WHERE uname=? AND Pwd=?;";
			PreparedStatement ps1= con.prepareStatement(sql1);
			ps1.setString(1, uname);
			ps1.setString(2,pwd);
			ResultSet rs1=ps1.executeQuery();
			
			PreparedStatement ps2= con.prepareStatement(sql2);
			ps2.setString(1, uname);
			ps2.setString(2,pwd);
			ResultSet rs2=ps2.executeQuery();
			
			if(rs1.next()) {
				response.sendRedirect("Staff01Dashboard");
			}
			if(rs2.next()) {
				response.sendRedirect("Staff02Dashboard");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}