package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Room;
import dao.RoomFactory;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
			HttpSession session = request.getSession();
			List<Room> roomObj = new ArrayList<Room>();
			//RoomBean n = new RoomBean();
		     roomObj = RoomFactory.getRooms();
		     session.setAttribute("rooms", roomObj);
		     //request.setAttribute("rooms", roomObj); 
		     request.getRequestDispatcher("/admin.jsp").forward(request,response);
		     }
		catch (Throwable e)
		{
			System.out.println(e);
		     }
		}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Room> roomObj = new ArrayList<Room>();
		HttpSession session = request.getSession(true);
		Room r = new Room();
		try
			{
				roomObj = (List<Room>)session.getAttribute("rooms");
			//RoomBean n = new RoomBean();
		     //roomObj = RoomDAO.login();
				//if(roomObj!=null)
		     request.setAttribute("rooms", roomObj);
		     }
		catch (Throwable e)
		{
		     System.out.println(e); 
		     }
		
			String selected = request.getParameter("myselect");	
			for(int i=0;i<roomObj.size();i++){
	        if(roomObj.get(i).getRoomID() == Integer.parseInt(selected)){
	            r = roomObj.get(i);
	            break;
	        }
	}
		request.setAttribute("selected", r);
		request.getRequestDispatcher("/admin.jsp").forward(request,response);
	}

}
