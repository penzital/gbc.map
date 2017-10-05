package bean;

public class Room implements java.io.Serializable{
	
	private int	roomID;
	private int	floorID;

	private String roomNo;
	private String roomName;
	private String roomType;
	
	private String department;
	private String centre;
	private String description;
	private String system;
	private String supportNo;
	
	private int seat;
	private java.sql.Time openTime;
	private java.sql.Time closeTime;
	
	private int topLo;
	private int leftLo;
	private String campus;
	

	public int getTopLo() {
		return topLo;
	}
	public void setTopLo(int top) {
		this.topLo = top;
	}
	public int getLeftLo() {
		return leftLo;
	}
	public void setLeftLo(int left) {
		this.leftLo = left;
	}
	public String getCampus() {
		return campus;
	}
	public void setCampus(String campus) {
		this.campus = campus;
	}
	public String getCentre() {
		return centre;
	}
	public void setCentre(String centre) {
		this.centre = centre;
	}
	public int getRoomID() {
		return roomID;
	}
	public void setRoomID(int roomID) {
		this.roomID = roomID;
	}
	public int getFloorID() {
		return floorID;
	}
	public void setFloorID(int floorID) {
		this.floorID = floorID;
	}
	public String getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getSystem() {
		return system;
	}
	public void setSystem(String system) {
		this.system = system;
	}
	public String getSupportNo() {
		return supportNo;
	}
	public void setSupportNo(String supportNo) {
		this.supportNo = supportNo;
	}
	public int getSeat() {
		return seat;
	}
	public void setSeat(int seat) {
		this.seat = seat;
	}
	public java.sql.Time getOpenTime() {
		return openTime;
	}
	public void setOpenTime(java.sql.Time openTime) {
		this.openTime = openTime;
	}
	public java.sql.Time getCloseTime() {
		return closeTime;
	}
	public void setCloseTime(java.sql.Time closeTime) {
		this.closeTime = closeTime;
	}

	
	
	
}
