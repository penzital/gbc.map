<!-- JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="requestPath" value="${pageContext.request.contextPath}" />

<!-- HTML -->
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>GBC Map</title>
<meta name="description"
	content="An interactive 3D mall map concept with a search and pin indicators for every level. " />
<meta name="keywords"
	content="mall map, 3d, css, javascript, pin, levels, floor map" />
<meta name="author" content="Ziyi Zhao" />
<link rel="shortcut icon" href="favicon.ico">

<!-- stylesheet -->
<link rel="stylesheet" type="text/css"
	href="${requestPath}/Floor/css/normalize.css" />
<link rel="stylesheet" type="text/css"
	href="${requestPath}/Floor/css/style.css" />
<!-- stylesheet break down -->
<link rel="stylesheet" type="text/css"
	href="${requestPath}/Floor/css/snow.css" />
<link rel="stylesheet" type="text/css"
	href="${requestPath}/Floor/css/pin-bg-list.css" />
<link rel="stylesheet" type="text/css"
	href="${requestPath}/Floor/css/pin-position-list.css" />
<link rel="stylesheet" type="text/css"
	href="${requestPath}/Floor/css/content-bg-list.css" />

<script src="${requestPath}/Floor/js/modernizr-custom.js"></script>

<!-- font -->
<link
	href="https://fonts.googleapis.com/css?family=Advent+Pro|Concert+One|Montserrat+Alternates"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans"
	rel="stylesheet">
<link
	href='http://fonts.googleapis.com/css?family=Raleway:200,400,800|Clicker+Script'
	rel='stylesheet' type='text/css'>
</head>

<body>
	<%
	//allow access only if session exists
	if(session.getAttribute("student") == null){
		response.sendRedirect( "../login.jsp");
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
	<div class="container">
		<div class="main">
			<!-- icon bar with link start-->
			<header class="codrops-header">
				<div class="codrops-links">
					<a class="codrops-icon codrops-icon--drop" href="index.html"> <img
						class="codrops-icon" id="gbIcon"
						src="${requestPath}/Floor/img/icon.png"></a>
				</div>
				<h1>Welcome ${student.username}</h1>
			</header>
			<!-- icon bar with link end-->

			<!-- Mall start-->
			<div class="mall">
				<!-- Surrounding Image -->
				<div class="surroundings">
					<img class="surroundings__map" src="${requestPath}/Floor/img/surroundings.svg" alt="Surroundings" />
				</div>
				<!-- Surrounding Image end-->

				<!-- Level Start-->
				<div class="levels">

					<!-- Level/Floor 1 -->
					<div class="level level--1" aria-label="Level 1"></div>
					<!-- End Level/Floor 1 -->

					<!-- Level/Floor 2 -->
					<div class="level level--2" aria-label="Level 2">
						<title>Map Level 2</title>

						<svg shape-rendering="auto" class="map map--2"
							viewBox="0 0 1200 800" width="160%" height="160%"
							preserveAspectRatio="xMidYMid meet"
							style="outline: 1px solid transparent;">	
								<use xlink:href="${requestPath}/Floor/floorPlan/floor2.svg#C-4"></use>
						</svg>

						<div class="level__pins"></div>
					</div>
					<!-- End Level/Floor 2 -->

					<!-- End Level/Floor 3 -->
					<div class="level level--3" aria-label="Level 3"></div>
					<!-- End Level/Floor 3 -->

					<!-- Level/Floor 4 -->
					<div class="level level--4" aria-label="Level 4">
						<title>Map Level 4</title>
						<!-- Floor Map -->
						<svg shape-rendering="auto" class="map map--4"
							viewBox="0 0 1200 800" width="160%" height="160%"
							preserveAspectRatio="xMidYMid meet"
							style="outline: 1px solid transparent;">
								<use xlink:href="${requestPath}/Floor/floorPlan/floor4.svg#C-4"></use>
						</svg>
						<!-- Floor Pin -->
						<div class="level__pins">
							<!-- Loop Rooms Pins -->
							<c:forEach items="${rooms}" var="room">
								<c:choose>
									<c:when test="${room.floorID == 4}">
										<!-- pin--${room.floorID}-${room.roomType}-${room.roomID} -->
										<a class="pin"
											style="top:${room.topLo}vmin; left:${room.leftLo}vmin;"
											data-category="${room.roomType}"
											data-space="${room.floorID}.${room.roomID}" href="#"
											aria-label="Pin for ${room.roomNo}"> <c:choose>
												<c:when
													test="${room.roomType eq 'stair' ||room.roomType eq 'washroom' || room.roomType eq 'elevator'}">
													<span class="pin__icon"> <svg
															class="icon icon--pin icon--bg">
														<use
																xlink:href="${requestPath}/Floor/img/circle.svg#circle"></use>		 
													</svg> <svg class="icon icon--logo icon--tomato icon--sign">											 
														<use
																xlink:href="${requestPath}/Floor/img/${room.roomType}.svg#${room.roomType}"></use>
													</svg>
													</span>
												</c:when>

												<c:otherwise>
													<span class="pin__icon">${room.roomNo} <svg
															class="icon icon--pin icon--${room.roomType}"></svg> <svg
															class="icon icon--logo icon--tomato icon--sign"></svg>
													</span>
												</c:otherwise>
											</c:choose>
										</a>
									</c:when>
								</c:choose>
							</c:forEach>
							<!-- /level__pins -->

						</div>
					</div>
					<!-- /levels -->
				</div>
			</div>
			<!-- /mall -->

			<!-- Rearch Btn -->
			<button class="boxbutton boxbutton--dark open-search"
				aria-label="Show search">
				<svg class="icon icon--search">
				<use xlink:href="img/search.svg#search"></use>
			</svg>
			</button>
			<!-- /Rearch Btn -->

			<!-- Nav Btn -->
			<button class="boxbutton boxbutton--dark nav" aria-label="Show nav"
				onclick="window.location.href='${requestPath}/Navigation/Navtest.jsp'">
				<svg class="icon icon--search ">
				<use xlink:href="${requestPath}/Floor/img/navBtn-4.svg#navBtn"></use>
			</svg>
			</button>
			<!-- /Nav Btn -->

			<!-- mall sidebar -->
			<nav class="mallnav mallnav--hidden">
				<button class="boxbutton mallnav__button--up" aria-label="Go up">
					<svg class="icon icon--angle-down">
					<use xlink:href="img/up.svg#up"></use></svg>
				</button>
				<button
					class="boxbutton boxbutton--dark mallnav__button--all-levels"
					aria-label="Back to all levels">
					<svg class="icon icon--stack">
					<use xlink:href="img/stack.svg#stack"></use></svg>
				</button>
				<button class="boxbutton mallnav__button--down" aria-label="Go down">
					<svg class="icon icon--angle-down">
					<use xlink:href="img/down.svg#down"></use></svg>
				</button>
			</nav>
			<!-- /mall Navbar -->

			<!-- Content -->
			<div class="content">
				<c:forEach items="${rooms}" var="room">
					<div class="content__item"
						data-space="${room.floorID}.${room.roomID}"
						data-category="fashion">
						<div class="add-shade">
							<h3 class="content__item-title">${room.roomNo} ${room.roomName}</h3>
							<div class="content__item-details">
								<p class="content__meta">
									<span class="content__meta-item"> <strong>Opening Hours : </strong> ${room.openTime} &mdash; ${room.closeTime}</span>
									<span class="content__meta-item"> <strong>Computer System : </strong>${room.system} </span>
									<span class="content__meta-item"> <strong>Seats : </strong>${room.seat} </span>
									<span class="content__meta-item"> <strong>Support number : </strong>${room.supportNo} </span>
								</p>
								<p class="content__desc">${room.description}</p>
							</div>
						</div>
					</div>
				</c:forEach>
				<button
					class="boxbutton boxbutton--dark content__button content__button--hidden"
					aria-label="Close details">
					<svg class="icon icon--cross">
						<use xlink:href="img/close.svg#close"></use></svg>
				</button>
			</div>
			<!-- content -->
		</div>

		<!-- /main -->
		
		<!-- spaces-list  -->
		<aside class="spaces-list" id="spaces-list">
			<div class="search">
				<input class="search__input" placeholder="Search..." />
				<button class="boxbutton boxbutton--darker close-search" aria-label="Close details">
					<svg class="icon icon--cross"><use xlink:href="img/close.svg#close"></use></svg>
				</button>
			</div>
			<span class="label"> <input id="sort-by-name" class="label__checkbox" type="checkbox" aria-label="Show alphabetically" /> 
				<label class="label__text">A - Z</label>
			</span>
			<ul class="list grouped-by-category">
				<c:forEach items="${rooms }" var="room">
					<li class="list__item" data-level="${room.floorID}" data-category="${room.floorID}" data-space="${room.floorID}.${room.roomID}">
					<a href="#" class="list__link">${room.roomNo} ${room.roomName}</a></li>
				</c:forEach>
				<li class="list__item" data-level="3" data-category="4" data-space="3.06"><a href="#" class="list__link">Feel the Grass</a></li>
			</ul>
		</aside>
		<!-- /spaces-list -->


	</div>
	<!-- /container -->
	<script src="${requestPath}/Floor/js/classie.js"></script>
	<script src="${requestPath}/Floor/js/list.min.js"></script>
	<script src="${requestPath}/Floor/js/main.js"></script>
	<script
		src="${requestPath}/Floor/js/svg4everybody-master/dist/svg4everybody.legacy.min.js"></script>
</body>