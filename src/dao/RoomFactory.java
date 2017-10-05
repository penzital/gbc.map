package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Pet;
import bean.Room;
import controller.RoomServlet;

public class RoomFactory implements DAO {
	 static int roomID;
	 static int	floorID;
	 
	 static String roomNo;
	 static String roomName;
	 static String roomType;
	
	 static String centre;
	 static String department;
	 static String description;
	 static String system;
	 static String supportNo;
	
	 static int seat;
	 static java.sql.Time openTime;
	 static java.sql.Time closeTime;
	 
	 static int topLo;
	 static int leftLo;
	 static String campus;

	
	static String sql;
	
	//Bean of @
	//List of @
	static Room room;
	static List<Room> rooms;
	

	
	//@Override
	public static List<Room> getRooms(){
		rooms = new ArrayList<Room>();
		
		sql = "select * from room_details";
		ResultSet rs = DAO.getResultset(sql);
		
		try {
			while(rs.next()){
				 roomID = rs.getInt("roomID");
				 floorID = rs.getInt("floorID");
				 
				 roomNo = rs.getString("roomNo");
				 roomName = rs.getString("roomName");
				 roomType = rs.getString("roomType");
				 
				 department = rs.getString("department");
				 centre = rs.getString("centre");

				 description = rs.getString("description");
				 system = rs.getString("system");
				 supportNo = rs.getString("supportNo");
				 
				 seat = rs.getInt("seat");
				 openTime = rs.getTime("openTime");
				 closeTime =  rs.getTime("closeTime");
	
				 topLo =  rs.getInt("topLo");
				 leftLo =  rs.getInt("leftLo");
				 campus =  rs.getString("campus");

				room = new Room();
				
				room.setRoomID(roomID);
				room.setFloorID(floorID);
				
				room.setRoomNo(roomNo);
				room.setRoomName(roomName);
				room.setRoomType(roomType);
				
				room.setDepartment(department);
				room.setCentre(centre);

				room.setDescription(description);
				room.setSystem(system);
				room.setSupportNo(supportNo);
				
				room.setSeat(seat);
				room.setOpenTime(openTime);
				room.setCloseTime(closeTime);
				
				room.setTopLo(topLo);
				room.setLeftLo(leftLo);
				room.setCampus(campus);
				
				
				rooms.add(room);	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rooms;
	
	}
	
	
	
	public static void main(String[] args) {
		RoomFactory impl = new RoomFactory();
		System.out.println(getRooms().get(1).getCentre());
	}
	
	
}




