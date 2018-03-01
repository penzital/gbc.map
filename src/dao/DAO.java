package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import bean.Pet;
import bean.Room;
import bean.Student;
import dbUtility.DatabaseConnector;

public interface DAO {
	
	 
	 static List<Room> getRooms(){	return null;}
	 static boolean roomUpdate(){
		return false; }




	 static List<Student> getStudents(){ return null; }
	 
	 
	 static ResultSet getResultset(String sql){
		 Connection conn = null;
		 PreparedStatement ps = null;
		 ResultSet rs = null;
		
		 try {
			conn = (Connection) DatabaseConnector.getConnection();
			ps = (PreparedStatement) conn.prepareStatement(sql);
			rs = ps.executeQuery();
			System.out.println("connecrted!!!!!");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 
		 return rs;
	 }
	 
	 static ResultSet select(String sql, String[] info){
		 Connection conn = null;
		 PreparedStatement ps = null;
		 ResultSet rs = null;
		 
		 try {
				conn = (Connection) DatabaseConnector.getConnection();
			 	ps = (PreparedStatement) conn.prepareStatement(sql);
				for (int i = 0; i < info.length; i++) {
					ps.setString(i + 1 , info[i]);
				}
				
				rs = ps.executeQuery();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return rs;
		}
	 
	 public static Boolean update(Room room){
			boolean updated = false;
			Connection conn = null;
			 PreparedStatement ps = null;
			 ResultSet rs = null;
			 String sql ="update room_details set floorID =?, roomNo =?, roomName=?, roomType=?, department=?, centre=?,"
						+ " description=?, seat=?, system=?, openTime=?, closeTime=?, supportNo=?, topLo=?, leftLo=?, campus=? where roomID=?;";
				
			 try {
					conn = (Connection) DatabaseConnector.getConnection();
				 	ps = (PreparedStatement) conn.prepareStatement(sql);
					ps.setInt(1, room.getFloorID());
					ps.setString(2, room.getRoomNo());
					ps.setString(3, room.getRoomName());
					ps.setString(4, room.getRoomType());
					ps.setString(5, room.getDepartment());
					ps.setString(6, room.getCentre());
					ps.setString(7, room.getDescription());
					ps.setInt(8, room.getSeat());
					ps.setString(9, room.getSystem());
					ps.setTime(10, room.getOpenTime());
					ps.setTime(11, room.getCloseTime());
					ps.setString(12, room.getSupportNo());
					ps.setInt(13, room.getTopLo());
					ps.setInt(14, room.getLeftLo());
					ps.setString(15, room.getCampus());
					ps.setInt(16, room.getRoomID());
					ps.execute();
					updated = true;
				} catch (SQLException e) {
					e.printStackTrace();
				}
			 
			
			return updated;
		}
	 
	 
}
