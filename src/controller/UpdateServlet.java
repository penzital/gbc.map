package controller;

import java.io.IOException;
import java.sql.Time;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import bean.Room;
import dao.DAO;
import dao.RoomFactory;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Boolean updated = false;
		String roomID =  (String)request.getParameter("roomID");
		String floorID = (String) request.getParameter("floorIDUpdate");
		String roomNo =(String)request.getParameter("roomNoUpdate");
		String roomName = (String) request.getParameter("roomNameUpdate");
		String roomType = (String) request.getParameter("roomTypeUpdate");
		String department = (String) request.getParameter("departmentUpdate");
		String centre = (String) request.getParameter("centreUpdate");
		String description = (String) request.getParameter("descriptionUpdate");
		String system = (String) request.getParameter("systemUpdate");
		String supportNo = (String) request.getParameter("supportNoUpdate");
		String seat = (String)request.getParameter("seatUpdate");
		String openTime = (String) request.getParameter("openTimeUpdate");
		String closeTime = (String) request.getParameter("closeTimeUpdate");
		String topLo = (String) request.getParameter("topLoUpdate");
		String leftLo = (String) request.getParameter("leftLoUpdate");
		String campus = (String) request.getParameter("campusUpdate");
		Room room = new Room();
		DateFormat format = new SimpleDateFormat("hh:mm:ss");
		String updatedStr = "";
		
		try{
			room.setCampus(campus);
			room.setCentre(centre);
			room.setDepartment(department);
			room.setDescription(description);
			room.setRoomName(roomName);
			room.setRoomNo(roomNo);
			room.setRoomType(roomType);
			room.setSupportNo(supportNo);
			room.setSystem(system);
			room.setFloorID(Integer.parseInt(floorID));
			room.setOpenTime(new Time(format.parse(openTime).getTime()));
			room.setCloseTime(new Time(format.parse(closeTime).getTime()));
			room.setFloorID(Integer.parseInt(floorID));
			room.setLeftLo(Integer.parseInt(leftLo));
			room.setRoomID(Integer.parseInt(roomID));
			room.setSeat(Integer.parseInt(seat));
			room.setTopLo(Integer.parseInt(topLo));
			updated = DAO.update(room);
		}
		catch(Exception e){
			System.out.println("EXCEPTION: "+e);
			request.setAttribute("updatedStr", "some of the valuea were not entered correctly");
			request.getRequestDispatcher("/admin.jsp").forward(request,response);
		}
		
		if(updated){
			updatedStr="Updated successfully";
		}
		else
			updatedStr="Couldn't update database";
		request.setAttribute("updateStatus", updatedStr);
		request.getRequestDispatcher("/admin.jsp").forward(request,response);
		//request.getRequestDispatcher("/AdminMain").forward(request,response);
	}

}
