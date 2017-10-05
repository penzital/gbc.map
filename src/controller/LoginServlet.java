package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import bean.Student;
import dao.StudentFactory;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       

    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean status;
		Student student;
		
		Long ID = Long.valueOf(request.getParameter("ID")).longValue();
		String pwd = request.getParameter("pwd");
		
		student = StudentFactory.login(ID,pwd);
		
		if (student != null) {
			
			String sID = Long.toString(ID);
				
			HttpSession session = request.getSession();
			session.setAttribute("student", student);
			session.setMaxInactiveInterval(10*30);
			
			Cookie loginCookie = new Cookie("user",sID);
			
			System.out.println(student.getID() + student.getUsername());
			System.out.println(student.getID());
			//setting cookie to expiry in 30 mins
			loginCookie.setMaxAge(10*30);
			response.addCookie(loginCookie);
			
//			response.sendRedirect("loginSuccess.jsp");
			response.sendRedirect("RoomServlet");
		}else{
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
			PrintWriter out= response.getWriter();
			out.println("<font color=red>Either user name or password is wrong.</font>");
			rd.include(request, response);
		}
		doGet(request, response);
	}

}
