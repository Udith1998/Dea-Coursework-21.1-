package newpackage;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ControllerServlet", urlPatterns = {"/ControllerServlet"})
public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private final UserDAO userDAO;

    public ControllerServlet() {
        this.userDAO = new UserDAO();
    }

        @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

        @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
            try {
                String action = request.getServletPath();
                switch(action){
                    case "/newStaff":
                        newStaffform(request,response);
                        break;
                    case "/insertStaff":
                        insertStaff(request,response);
                        break;
                    case "/editStaff":
                        showEditStaffForm(request,response);
                        break;
                    case "/deleteStaff":
                        deleteStaff(request,response);
                        break;
                    case "/updateStaff":
                        updateStaff(request,response);
                        break;
                    case "/listStaff":
                        listStaff(request,response);
                        break;

                    case "/newClient":
                        newClientform(request,response);
                        break;
                    case "/insertClient":
                        insertClient(request,response);
                        break;
                    case "/editClient":
                        showEditClientForm(request,response);
                        break;
                    case "/deleteClient":
                        deleteClient(request,response);
                        break;
                    case "/updateClient":
                        updateClient(request,response);
                        break;
                    case "/listClient":
                        listStaff(request,response);
                        break;

                    default:
                        home(request,response);
                        break;
                }
            } catch (SQLException ex) {
                Logger.getLogger(ControllerServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

	}
	
//staff
	private void newStaffform(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("staffRegistration.jsp");
		dispatcher.forward(request, response);
	}
	
	private void insertStaff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                int grade = Integer.parseInt(request.getParameter(""));
		String Fname = request.getParameter("");
		String Lname = request.getParameter("");
		String email = request.getParameter("");
		String mobile = request.getParameter("");
		String uname = request.getParameter("");
		String pwd = request.getParameter("");
		user newuser = new user(grade,Fname,Lname,email,mobile,uname,pwd);
		userDAO.insertStaff(newuser);
		response.sendRedirect("adminDashboardStaff.jsp");
	}
	
	private void deleteStaff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter(""));
		userDAO.deletestaff(id);
		response.sendRedirect("adminDashboardStaff.jsp");
	}
	
	private void showEditStaffForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter(""));
		user existingUser = userDAO.getStaff(id);
		RequestDispatcher dispatcher= request.getRequestDispatcher("");
		request.setAttribute("user", existingUser);
		dispatcher.forward(request, response);
	}
	
	private void updateStaff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int grade=Integer.parseInt(request.getParameter(""));
		String Fname = request.getParameter("");
		String Lname = request.getParameter("");
		String email = request.getParameter("");
		String mobile = request.getParameter("");
		String uname = request.getParameter("");
		String pwd = request.getParameter("");
		user updatestaff = new user(grade,Fname,Lname,email,mobile,uname,pwd);
		userDAO.updateStaff(updatestaff);
		response.sendRedirect("adminDashboardStaff.jsp");
	}
	
	private void home(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
	}
        
        private void listStaff(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException { 
                List<user> listStaff = userDAO.listAllStaff();
                request.setAttribute("listStaff", listStaff);
                RequestDispatcher dispatcher = request.getRequestDispatcher("adminDashboardStaff.jsp");
                dispatcher.forward(request, response);
        }

	//client 
	private void newClientform(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("signup.jsp");
		dispatcher.forward(request, response);
	}
	
	private void insertClient(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Fname = request.getParameter("");
		String Lname = request.getParameter("");
                String nic = request.getParameter("");
		String email = request.getParameter("");
		String mobile = request.getParameter("");
		String uname = request.getParameter("");
		String pwd = request.getParameter("");
		
		user newuser = new user(Fname,Lname,nic,email,mobile,uname,pwd);
		userDAO.insertClient(newuser);
		response.sendRedirect("staffDashboardClient.jsp");
	}
	
	private void deleteClient(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname=request.getParameter("");
		userDAO.deleteClient(uname);
		response.sendRedirect("staffDashboardClient.jsp");
	}
	
	private void showEditClientForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname=request.getParameter("");
		user existingUser = userDAO.getClient(uname);
		RequestDispatcher dispatcher= request.getRequestDispatcher("staffDashboardClient.jsp");
		request.setAttribute("user", existingUser);
		dispatcher.forward(request, response);
	}
	
	private void updateClient(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Fname = request.getParameter("");
		String Lname = request.getParameter("");
                String nic = request.getParameter("");
		String email = request.getParameter("");
		String mobile = request.getParameter("");
		String uname = request.getParameter("");
		String pwd = request.getParameter("");
		
		user updatestaff = new user(Fname,Lname,nic,email,mobile,uname,pwd);
		userDAO.updateClient(updatestaff);
		response.sendRedirect("staffDashboardClient.jsp");
	}
	
}
