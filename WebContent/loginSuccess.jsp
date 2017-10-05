<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="requestPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//allow access only if session exists
	if(session.getAttribute("student") == null){
		response.sendRedirect("login.jsp");
	}
	
	String sID = null;
	Cookie[] cookies = request.getCookies();
	
	if(cookies !=null){
		for(Cookie cookie : cookies){
			if(cookie.getName().equals("user")) {
				sID = cookie.getValue();
			}
		}
	}
	%>
		<h3>Hi <%=sID %>, Login successful. </h3>
		<h3>${student.ID}</h3>
		<h3>${student.email}</h3>
		<h3>${student.username}</h3>
		<h3>${student.pwd}</h3>
		
	<br>
	<a href="CheckoutPage.jsp">Checkout Page</a>
	<form action="LogoutServlet" method="post">
		
		<input type="submit" value="Logout">
</body>
</html>