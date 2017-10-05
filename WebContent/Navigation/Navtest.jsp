<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="requestPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Navigation</title>
<meta name="description"
	content="Some inspiration for web divider styles" />
<meta name="keywords"
	content="separator css, divider css, separator style, web design, flat design, inspiration, responsive, svg, pseudo-elements" />

<link rel="shortcut icon" href="../favicon.ico">
<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Paytone+One"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet">

<!-- stylesheet boostrap-->
<link href="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css" />

<!-- stylesheet customized-->
<link rel="stylesheet" type="text/css" href="${requestPath }/Navigation/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="${requestPath }/Navigation/css/selectFunc.css" />
<link rel="stylesheet" type="text/css" href="${requestPath }/Navigation/css/layout.css" />
<link rel="stylesheet" type="text/css" href="${requestPath }/Navigation/css/sessionDivider.css" />

<!--js for JQ  -->
<!-- Can't put in the file have some fcking problem conflict with begin selection -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="${requestPath }/Navigation/js/modernizr.custom.js"></script>

<script>
	$(document).ready(function() {
		$("#gotit").click(function() {
			$("#overlay").hide(100);
		});
	});
</script>

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
	<div id="overlay" class="overlay">
		<div class="info">
			<h2>Demo interactions</h2>
			<span class="info-drag">Drag Maps</span> <span class="info-keys">Zoom
				Maps</span> <span class="info-switch">Click Rooms</span>
			<button id="gotit" onclick="hide('overlay')">Got it!</button>
		</div>
	</div>
	<div class="container">
		
		
		<!-- Map Section -->
		<section class="col-2 ss-style-triangles">
			<div class="column text ">
				<div id="mapLoading">Loading</div>
				<div id="myMaps"></div>
			</div>
			<div>
			<svg id="slit" xmlns="http://www.w3.org/2000/svg" version="1.1"
				width="100%" height="60" viewBox="0 0 100 100"
				preserveAspectRatio="none">
				<path id="slitPath2" d="M50 100 C49 80 47 0 40 0 L47 0 Z" />
				<path id="slitPath3" d="M50 100 C51 80 53 0 60 0 L53 0 Z" />
				<path id="slitPath1" d="M47 0 L50 100 L53 0 Z" />
			</svg>
		</div>
		</section>

		<!-- /Map Section -->
		<!-- Top Navigation -->
		<div id="slideshow" class="dragslider">
			<!-- Top Section -->
			<section class="related">
				<h1>Click ! Zoom ! Drag!</h1>
				<div id="controls">
					<div id="begin">
						<label for="beginSelect"></label>
						<!-- Loop -->
						<select title="Your Location" id="beginSelect" class="selectpicker" data-show-subtext="true"
							data-live-search="true">
							<option value="" disabled selected>Start Location</option>
							<c:forEach items ="${centres}" var ="centre">
								<optgroup label="${centre}" >
									<c:forEach items="${rooms}" var="room">
									<c:if test="${room.centre == centre}">
									<option value="${room.roomNo}"  data-subtext="${room.roomType}">${ room.roomNo}</option>
									</c:if>
									</c:forEach>
								</optgroup>
							</c:forEach>
						</select>
						<!-- /Loop -->
					</div>

					<div id="end">
						<label for="endSelect"></label>
						<!-- Loop -->
						<select title="destination" id="endSelect" class="selectpicker" data-show-subtext="true"
							data-live-search="true">
							<option value="" disabled selected>Destination</option>
							<c:forEach items ="${centres}" var ="centre">
								<optgroup label="${centre}" >
									<c:forEach items="${rooms}" var="room">
									<c:if test="${room.centre == centre}">
									<option value="${room.roomNo}"  data-subtext="${room.roomType}">${ room.roomNo}</option>
									</c:if>
									</c:forEach>
								</optgroup>
							</c:forEach>
						</select>
						<!-- /Loop -->
					</div>
				</div>
			</section>
			<!-- /Top Section -->
		</div>
	</div>
	<!-- /container -->
	
	<!-- JS For Selection -->
	<script src="${requestPath }/Navigation/js/bootstrap.min.js"></script>
	<script src="${requestPath }/Navigation/js/bootstrap-select.min.js"></script>
	<!-- If the selection is not updateing put this back
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script> -->
	
	<!-- js for Navigation -->
	<script src="http://d3js.org/d3.v3.min.js"></script>
	<script src="${requestPath}/Navigation/js/jquery.wayfinding.js"></script>
	<!-- /Navigation -->
	
	
	
	<script>
		// Variables for wayfinding
		var MAPS = [ {
			'path' : '${requestPath }/Navigation/img/floor4.svg','id' : 'floor1'
		} ];
		var START_ROOM = 'C418';
		var DEFAULT_MAP = 'floor4';
		var lastRoomSelected;

		// Variables for zoom
		var MAX_ZOOM_IN = 16.0;
		var MAX_ZOOM_OUT = 0.55;
		var zoomScaleStep = 2;
		var zoomTranslationMap = d3.map();
		var translationStep = 100;
		var zoomable_layer, zoom;
		var zoomObjects = [];

		zoomTranslationMap.set(1, 0.0);
		zoomTranslationMap.set(2, 1.0);
		zoomTranslationMap.set(4, 3.0);
		zoomTranslationMap.set(8, 2.33);
		zoomTranslationMap.set(16, 2.14);

		//Setup options for wayfinding
		$(document)
				.ready(
						function() {
							'use strict';
							$('#myMaps').wayfinding({
								'maps' : MAPS,
								'path' : {

									width : 10,
									color : 'pink',
									radius : 8,
									speed : 8
								},
								'startpoint' : function() {
									return START_ROOM;
								},
								'defaultMap' : DEFAULT_MAP
							});

							//Make the floor buttons clickable
							$("#controls button").click(
									function() {
										$("#myMaps").wayfinding('currentMap',
												$(this).attr('id'));
									});
							$('#controls #beginSelect')
									.change(
											function() {
												$('#myMaps').wayfinding(
														'startpoint',
														$(this).val());
												if ($('#controls .endSelect')
														.val() !== '') {
													$('#myMaps')
															.wayfinding(
																	'routeTo',
																	$(
																			'#controls #endSelect')
																			.val());
												}
											});

							$('#controls #endSelect').change(
									function() {
										$('#myMaps').wayfinding('routeTo',
												$(this).val());
									});

							$('#controls #accessible')
									.change(
											function() {
												if ($(
														'#controls #accessible:checked')
														.val() !== undefined) {
													$('#myMaps').wayfinding(
															'accessibleRoute',
															true);
												} else {
													$('#myMaps').wayfinding(
															'accessibleRoute',
															false);
												}
												$('#myMaps')
														.wayfinding(
																'routeTo',
																$(
																		'#controls #endSelect')
																		.val());
											});

							setZoomEnvironment();

						});

		//Create the zoom beaviour and wait for map creation and then set zoom behaviour on it
		function setZoomEnvironment() {

			//Create the zoom behavior to set for the draw
			zoom = d3.behavior.zoom()
					.scaleExtent([ MAX_ZOOM_OUT, MAX_ZOOM_IN ]).on('zoom',
							zoomed);

			//Wait for the creation of all maps
			waitMapsCreation();
		}

		function waitMapsCreation() {

			var checkMapsCreationFunction = setInterval(function() {

				var allMapsCreated = true;
				$.map(MAPS, function(value) {
					if ($('#' + value.id).length == 0) {
						allMapsCreated = false;
					}
				});
				if (allMapsCreated) {
					//Cancel the timer
					clearInterval(checkMapsCreationFunction);
					//Create the zoom environment
					$.map(MAPS, function(value) {
						setZoomBehaviourForMap(value.id);
					});
					//Update the destination in the drop-down menu when the correspondent room is clicked and create the custom context menu
					$('#Rooms a').on(
							'click',
							function() {
								$(
										'#controls #endSelect option[value="'
												+ $(this).prop('id') + '"]')
										.attr('selected', true);
							}).on('contextmenu', function(event) {
						// Avoid the real one
						event.preventDefault();
						//Set the last room selected
						lastRoomSelected = $(this).prop('id');
						// Show contextmenu
						$(".custom-menu").finish().toggle(100).
						// In the right position (the mouse)
						css({
							top : event.pageY + "px",
							left : event.pageX + "px"
						});
					}).on("mousedown", function(e) {
						// If the clicked element is not the menu
						if (!$(e.target).parents(".custom-menu").length > 0) {
							// Hide it
							$(".custom-menu").hide(100);
						}
					});
					//Set the actions to do on the option selection in the context menu
					$(".custom-menu li")
							.click(
									function() {

										// This is the triggered action name
										switch ($(this).attr("data-action")) {
										// A case for each action. Your actions here
										case "source":
											$(
													'#controls #beginSelect option[value="'
															+ lastRoomSelected
															+ '"]').attr(
													'selected', true);
											$('#controls #beginSelect')
													.trigger("change");
											break;
										case "sink":
											$(
													'#controls #endSelect option[value="'
															+ lastRoomSelected
															+ '"]').attr(
													'selected', true);
											$('#controls #endSelect').trigger(
													"change");
											break;
										}

										// Hide it AFTER the action was triggered
										$(".custom-menu").hide(100);
									});
				}
			}, 100); // check every 100ms
		}

		function setZoomBehaviourForMap(mapId) {

			//Create specific variables for map zooming
			var mapObj = d3.select('#' + mapId + " svg").call(zoom);
			var zoomMap = mapObj.select("g");
			var svgWidth = mapObj.attr('width').replace('px', '');
			var svgHeight = mapObj.attr('height').replace('px', '');
			var centerX = d3.round(-(svgWidth / 2));
			var centerY = d3.round(-(svgHeight / 2));

			zoomObjects[mapId] = {
				zoomMap : zoomMap,
				svgWidth : svgWidth,
				svgHeight : svgHeight,
				centerX : centerX,
				centerY : centerY
			};

			//Set the zoom behavior on the floor		
			//zoomMap.call(zoom);
		}

		//Function called on the zoom event. It translate the draw on the zoommed point and scale with a certain factor
		function zoomed() {

			var id = d3.select(this.parentNode).attr("id");
			var zoomObj = zoomObjects[id];
			var scale = d3.event.scale;
			var newScale = scale / 1;

			zoomObj.centerX = d3.round(d3.event.translate[0]);
			zoomObj.centerY = d3.round(d3.event.translate[1]);
			//alert("Richiesto livello di zoom " + d3.event.scale + " e traslazione in " + centerX + ", " + centerY);
			zoomObj.zoomMap
					.attr("transform", "translate(" + zoomObj.centerX + ", "
							+ zoomObj.centerY + ")scale(" + d3.event.scale
							+ ")");

		}

		function redraw() {

		}
	</script>

</body>
</html>