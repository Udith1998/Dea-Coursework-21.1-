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

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
                
                String username=request.getParameter("username");
		String password=request.getParameter("password");
         
                HttpSession session=request.getSession();
                
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PhoenixAirlinesDB","root","");

                    PreparedStatement pst = con.prepareStatement("select * from client where Username = ? and Password = ?");
                    pst.setString(1, username);
                    pst.setString(2, password);
                    ResultSet rs = pst.executeQuery();
                    boolean found = rs.next();

                    PreparedStatement pst1 = con.prepareStatement("select * from admin where Username = ? and Password = ?");
                    pst1.setString(1, username);
                    pst1.setString(2, password);
                    ResultSet rs1 = pst1.executeQuery();
                    boolean found1 = rs1.next();

                    PreparedStatement pst2 = con.prepareStatement("select * from staff where Username = ? and Password = ?");
                    pst2.setString(1, username);
                    pst2.setString(2, password);
                    ResultSet rs2 = pst2.executeQuery();
                    boolean found2 = rs2.next();

                    if(found){           
                        session.setAttribute("username",username); 
                        response.sendRedirect("customerDashboard.jsp"); 
                    }

                    if(found1){           
                        session.setAttribute("username",username); 
                        response.sendRedirect("adminDashboard.jsp"); 
                    }

                    if(found2){           
                        session.setAttribute("username",username); 
                        response.sendRedirect("staffDashboard.jsp"); 
                    }

                    else{
                        session.setAttribute("username",username);
                        response.sendRedirect("login.jsp"); 
                    }
                        
                }catch(IOException | ClassNotFoundException | SQLException | IllegalStateException e){
                    out.println(e);
                }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
