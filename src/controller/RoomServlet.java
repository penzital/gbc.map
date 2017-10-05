package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

//import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import bean.Pet;
import bean.Room;
import dao.RoomFactory;
import dbUtility.DatabaseConnector;

/**
 * Servlet implementation class RoomServlet
 */

@WebServlet(
		description = "",
		urlPatterns = {"/RoomServlet"},
		initParams ={@WebInitParam(name = "", value = "")}
		)

public class RoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RoomServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Room> rooms = new ArrayList<Room>();
		HashSet<String> centres = new HashSet<String>();
		HashSet<String> campuses = new HashSet<String>();

		rooms = RoomFactory.getRooms();
		
		for (int i = 0; i < rooms.size(); i++) {
			String centre = rooms.get(i).getCentre();
			String campus = rooms.get(i).getCampus();
			centres.add(centre);
			campuses.add(campus);
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("campuses", campuses);
		session.setAttribute("centres", centres);
		session.setAttribute("rooms", rooms);
		
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/Campus/campusNavTest.jsp");
		
		//RequestDispatcher rd = getServletContext().getRequestDispatcher("/Floor/floorNav.jsp");
		//rd.forward(request, response);
		response.sendRedirect(request.getContextPath() + "/Campus/campusNavTest.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
