package webPackage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daoPackage.UserDAO;
import modelPackage.user;

/**
 * Servlet implementation class CRUD_Servlet
 */
@WebServlet("/")
public class CRUD_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserDAO userDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CRUD_Servlet() {
        this.userDAO = new UserDAO();
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
		String action = request.getServletPath();
			switch(action){
			case "/newStaff1":
				newStaff1form(request,response);
				break;
			case "/insertStaff1":
				insertStaff1(request,response);
				break;
			case "/editStaff1":
				showEditStaff1Form(request,response);
				break;
			case "/deleteStaff1":
				deleteStaff1(request,response);
				break;
			case "/updateStaff1":
				updateStaff1(request,response);
				break;


			case "/newStaff2":
				newStaff2form(request,response);
				break;
			case "/insertStaff2":
				insertStaff2(request,response);
				break;
			case "/editStaff2":
				showEditStaff2Form(request,response);
				break;
			case "/deleteStaff2":
				deleteStaff2(request,response);
				break;
			case "/updateStaff2":
				updateStaff2(request,response);
				break;
				
				
			default:
				home(request,response);
				break;
			}

	}
	
//////////////////////////////////////////////////////////////
//staff1
	private void newStaff1form(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("user_form_here.jsp");
		dispatcher.forward(request, response);
	}
	
	private void insertStaff1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Fname = request.getParameter("");
		String Lname = request.getParameter("");
		String email = request.getParameter("");
		String mobile = request.getParameter("");
		String uname = request.getParameter("");
		String pwd = request.getParameter("");
		String nic = request.getParameter("");
		user newuser = new user(Fname,Lname,email,mobile,uname,pwd,nic);
		userDAO.addStaff1(newuser);
		response.sendRedirect("userListhere.jsp");
	}
	
	private void deleteStaff1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter(""));
		userDAO.deletestaff1(id);
		response.sendRedirect("userListhere.jsp");
	}
	
	private void showEditStaff1Form(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter(""));
		user existingUser = userDAO.selectStaff1(id);
		RequestDispatcher dispatcher= request.getRequestDispatcher("user_form_here.jsp");
		request.setAttribute("user", existingUser);
		dispatcher.forward(request, response);
	}
	
	private void updateStaff1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter(""));
		String Fname = request.getParameter("");
		String Lname = request.getParameter("");
		String email = request.getParameter("");
		String mobile = request.getParameter("");
		String uname = request.getParameter("");
		String pwd = request.getParameter("");
		String nic = request.getParameter("");
		user updatestaff = new user(id,Fname,Lname,email,mobile,uname,pwd,nic);
		userDAO.updateStaff1(updatestaff);
		response.sendRedirect("userListhere.jsp");
	}
	
	private void home(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
	}

	//////////////////////////////////////////////////////////////////////////////////////////////
	//staff2 
	private void newStaff2form(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("user2_form_here.jsp");
		dispatcher.forward(request, response);
	}
	
	private void insertStaff2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Fname = request.getParameter("");
		String Lname = request.getParameter("");
		String email = request.getParameter("");
		String mobile = request.getParameter("");
		String uname = request.getParameter("");
		String pwd = request.getParameter("");
		String nic = request.getParameter("");
		user newuser = new user(Fname,Lname,email,mobile,uname,pwd,nic);
		userDAO.addStaff2(newuser);
		response.sendRedirect("user2Listhere.jsp");
	}
	
	private void deleteStaff2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter(""));
		userDAO.deletestaff2(id);
		response.sendRedirect("user2Listhere.jsp");
	}
	
	private void showEditStaff2Form(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter(""));
		user existingUser = userDAO.selectStaff2(id);
		RequestDispatcher dispatcher= request.getRequestDispatcher("user2_form_here.jsp");
		request.setAttribute("user", existingUser);
		dispatcher.forward(request, response);
	}
	
	private void updateStaff2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter(""));
		String Fname = request.getParameter("");
		String Lname = request.getParameter("");
		String email = request.getParameter("");
		String mobile = request.getParameter("");
		String uname = request.getParameter("");
		String pwd = request.getParameter("");
		String nic = request.getParameter("");
		user updatestaff = new user(id,Fname,Lname,email,mobile,uname,pwd,nic);
		userDAO.updateStaff2(updatestaff);
		response.sendRedirect("user2Listhere.jsp");
	}
	
}