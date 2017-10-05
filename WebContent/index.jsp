<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<stylle>
	
</stylle>
</head>
<body>
<h1>Ziyi Zhao</h1>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<h1>${ctx}</h1>

							<select>
							<c:forEach items="${rooms}" var="room">
								<optgroup label="${room.centre}" >
									<option value="${room.roomNo}">${ room.roomNo}</option>
								</optgroup>
								
							</c:forEach>
							</select>

							<select>
							<c:forEach items ="${centres }" var ="centre">
								<optgroup label="${centre}" >
									<c:forEach items="${rooms}" var="room">
									<c:if test="${room.centre == centre}">
									<option value="${room.roomNo}">${ room.roomNo}</option>
									</c:if>
									</c:forEach>
								</optgroup>
							</c:forEach>
							</select>

<%-- <c:forEach items="${rooms}" var="room">
	<a class="pin pin--${room.floorID}-${room.roomType}-${room.roomID} " data-category="${room.roomType}" data-space="${room.floorID}.${room.roomID}" href="#" aria-label="Pin for ${room.roomNo}">
		<span class="pin__icon">${room.roomNo}
			<svg class="icon icon--pin icon--${room.roomType}"></svg>
			<svg class="icon icon--logo icon--tomato icon--sign"></svg>
		</span>
	</a>
</c:forEach> --%>

							

</body>
</html>