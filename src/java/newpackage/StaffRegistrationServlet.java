package newpackage;

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
import javax.servlet.http.HttpSession;

@WebServlet(name = "StaffRegistrationServlet", urlPatterns = {"/StaffRegistrationServlet"})
public class StaffRegistrationServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet StaffRegistrationServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StaffRegistrationServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                PrintWriter out = response.getWriter();
                
                String fname = request.getParameter("fname");
                String lname = request.getParameter("lname");
                String email = request.getParameter("email");
                String mobile = request.getParameter("mobile");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                int grade = Integer.parseInt(request.getParameter("grade"));
         
                HttpSession session=request.getSession();
                
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PhoenixAirlinesDB","root","");

                    PreparedStatement ps1 = con.prepareStatement("select * from Staff where username=?");
                    ps1.setString(1, username);
                    ResultSet rs = ps1.executeQuery();
                    boolean found = rs.next();
                    
                    if(found){
                        session.setAttribute("Usernameerror","Usernameerror"); 
                        response.sendRedirect("signup.jsp");
                    }
                    
                    else{
                        PreparedStatement ps2 = con.prepareStatement("Insert into staff (FirstName,LastName,Grade,Email,MobileNo,Username,Password) values(?,?,?,?,?,?,?)");

                        ps2.setString(1, fname);
                        ps2.setString(2, lname);
                        ps2.setInt(3, grade);
                        ps2.setString(4, email);
                        ps2.setString(5, mobile);
                        ps2.setString(6, username);
                        ps2.setString(7, password);

                        int x = ps2.executeUpdate();

                        if(x>0){
                            session.setAttribute("success","success"); 
                            response.sendRedirect("login.jsp");
                        }
                        
                        else{
                            session.setAttribute("error","error");
                            response.sendRedirect("signup.jsp");
                        }
                    }
        
                }catch(ClassNotFoundException | SQLException | IllegalStateException e){
                    out.println(e);
                }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
