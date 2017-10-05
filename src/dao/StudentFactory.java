package dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Student;
import javax.servlet.http.HttpServletRequest;

public class StudentFactory implements DAO {
	
	static long ID;
	static String username;
	static String pwd;
	static String email;
	
	static String sql;

	static Student student;
	
	static String[] info;
	static	List<Student> students;
	
	static boolean status;
	
	
	public static List<Student> getStudents(){
		
		students = new ArrayList<Student>();
		
		sql = "select * from student_details";
		ResultSet rs = DAO.getResultset(sql);
		try {
			while(rs.next()){
				ID = rs.getLong("studentID");
				username = rs.getString("username");
				email = rs.getString("email");
				pwd = rs.getString("pwd");
				
				student = new Student();
				
				student.setID(ID);
				student.setUsername(username);
				student.setPwd(pwd);
				student.setEmail(email);
				
				students.add(student);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return students;
	}
	
	public static Student login(long ID, String pwd){
		
		sql = "select * from student_details where studentID = ? and pwd = ?";
		info = new String[2];
		info[0] = Long.toString(ID);;
		info[1] = pwd;
		
		ResultSet rs = DAO.select(sql, info);
		try {
			if(rs.next() == true){
				status = true;
				
				ID = rs.getLong("studentID");
				username = rs.getString("username");
				email = rs.getString("email");
				pwd = rs.getString("pwd");
				
				student = new Student();
				
				student.setID(ID);
				student.setUsername(username);
				student.setPwd(pwd);
				student.setEmail(email);
			}
			else{
				status = false;
				student = null; 
				System.out.println("what??");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return student;
	}
		
	public static void main(String[] args) {
		RoomFactory impl = new RoomFactory();
		
		System.out.println(login(1009617710, "Erica2"));
	}
	
	
	
	
}
