<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:choose>
        <c:when test="${student.getUsername() == 'admin'}">
             Hi, Admin!
        </c:when>
        <c:otherwise>
             <c:redirect url="login.jsp"/>
        </c:otherwise>
    </c:choose>
    
    <%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:out value="${updateStatus}"/>
<form method="post" action="AdminServlet">
<p>Select a room</p>
<select name="myselect" onchange="this.form.submit()">
<option value="">Select a room</option>
<c:forEach var="room" items="${rooms}">
<option value='<c:out value="${room.roomID}"/>'><c:out value="${room.roomNo}"/></option>
</c:forEach>
</select>
</form>
<c:if test="${selected !=null}">
<h1>for adminUpdateServlet</h1>
<form method="post" action="UpdateServlet">
<p>Selected room's properties</p>
<p>Id: <c:out value="${selected.roomID}"/></p>
<p>You cannot change id</p>
<br>

<p>Floor ID: <c:out value="${selected.floorID}"/></p>
Enter new number <input type="text" name="floorIDUpdate" value="${selected.floorID}"/>

<p>Room Number: <c:out value="${selected.roomNo}"/></p>
Enter new string<input type="text" name="roomNoUpdate" value="${selected.roomNo}"/>

<p>Room Name: <c:out value="${selected.roomName}"/></p>
Enter new string<input type="text" name="roomNameUpdate" value="${selected.roomName}"/>

<p>Room Type: <c:out value="${selected.roomType}"/></p>
<select name="roomTypeUpdate">
  <option value="lab">Lab</option>
  <option value="washroom">Washroom</option>
  <option value="elevator">Elevator</option>
  <option value="ememit">Emergency exit</option>
</select>


<p>Department: <c:out value="${selected.department}"/></p>
Enter new string<input type="text" name="departmentUpdate" value="${selected.department}"/>


<p>Center: <c:out value="${selected.centre}"/></p>
Enter new string<input type="text" name="centreUpdate" value="${selected.centre}"/>


<p>Description: <c:out value="${selected.description}"/></p>
Enter new string<input type="text" name="descriptionUpdate" value="${selected.description}"/>


<p>Class Number: <c:out value="${selected.system}"/></p>
Enter new string<input type="text" name="systemUpdate" value="${selected.system}"/>


<p>Support Number: <c:out value="${selected.supportNo}"/></p>
Enter new string<input type="text" name="supportNoUpdate" value="${selected.supportNo}"/>


<p>Seats: <c:out value="${selected.seat}"/></p>
Enter new number<input type="text" name="seatUpdate" value="${selected.seat}"/>



<p>Open Time: <c:out value="${selected.openTime}"/></p>
Enter new value in hh:mm:ss format<input type="text" name="openTimeUpdate" value="${selected.openTime}"/>

<p>Close Time: <c:out value="${selected.closeTime}"/></p>
Enter new value in hh:mm:ss format<input type="text" name="closeTimeUpdate" value="${selected.closeTime}"/>


<p>TopLo: <c:out value="${selected.topLo}"/></p>
Enter new number<input type="text" name="topLoUpdate" value="${selected.topLo}"/>

<p>LeftLo: <c:out value="${selected.leftLo}"/></p>
Enter new number<input type="text" name="leftLoUpdate" value="${selected.leftLo}"/>


<p>PC Type: <c:out value="${selected.campus}"/></p>
Enter new string<input type="text" name="campusUpdate" value=""/>


<input type="hidden" name="roomID" value="${selected.roomID}"/>
 <input type="submit" value="submit"/>
</form>
</c:if>   
</body>
</html>