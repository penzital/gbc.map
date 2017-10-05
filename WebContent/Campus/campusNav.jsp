<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="requestPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Campus Map</title>
		<meta name="description" content="A multi grid layout with an initial fullscreen intro" />
		<meta name="keywords" content="fullscreen image, grid layout, flexbox grid, transition" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="${requestPath}/Campus/css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="${requestPath}/Campus/css/campusMapDemo.css" />
		<link rel="stylesheet" type="text/css" href="${requestPath}/Campus/css/layout-multi.css" />
		<script src="js/modernizr.custom.js"></script>
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
		<svg class="hidden">
			<g id="icon-grid">
				<rect x="32.5" y="5.5" width="22" height="22"/>
				<rect x="4.5" y="5.5" width="22" height="22"/>
				<rect x="32.5" y="33.5" width="22" height="22"/>
				<rect x="4.5" y="33.5" width="22" height="22"/>
			</g>
			<g id="icon-cross">
				<line x1="4.5" y1="55.5" x2="54.953" y2="5.046"/>
				<line x1="54.953" y1="55.5" x2="4.5" y2="5.047"/>
			</g>
		</svg>
		<nav class="thumb-nav">
			<a data-container="container-1" class="thumb-nav__item" href="#"><img src="${requestPath}/Campus/img/thumbs/cl-thumb.jpg" alt="thumb01" /><span>CL</span></a>
			<a data-container="container-2" class="thumb-nav__item" href="#"><img src="${requestPath}/Campus/img/thumbs/sj-thumb.jpg" alt="thumb02" /><span>SJ</span></a>
			<a data-container="container-3" class="thumb-nav__item" href="#"><img src="${requestPath}/Campus/img/thumbs/wf-thumb.jpg" alt="thumb03" /><span>WF</span></a>
		
		</nav>

		
		<div id="container-1" class="container">
			<header class="intro">
				<a href="${requestPath}/Floor/floorNav.jsp"><img class="intro__image" src="${requestPath}/Campus/img/casaloma.jpg" alt="Lava"/></a>
				<div class="intro__content">
					<h1 class="intro__title">Casa Loma Campus</h1>
					<div class="intro__subtitle">
						<div class="intro__description">
							Welcome ${student.username} ! This campus is home to the arts, technology and Liberal Studies:
						</div>
						<button class="trigger">
							<svg width="100%" height="100%" viewBox="0 0 60 60" preserveAspectRatio="none">
								<use class="icon icon--grid" xlink:href="#icon-grid" />
								<use class="icon icon--cross" xlink:href="#icon-cross" />
							</svg>
							<span>Toggle content</span>
						</button>
					</div>
					<!-- intro title -->
				</div>
				<!-- /intro__content -->
			</header>
			<!-- /intro -->
			
			<section class="items-wrap">
				<a href="#" class="item">
					<img class="item__image" src="${requestPath}/Campus/img/construction.jpg" alt="item01"/>
					<h2 class="item__title">Centre for Construction & Engineering Technologies:</h2>
				</a>
				<a href="#" class="item">
					<img class="item__image" src="${requestPath}/Campus/img/fashion.jpg" alt="item02"/>
					<h2 class="item__title">Centre for Arts, Design & Information Technology:</h2>
				</a>
				<a href="#" class="item">
					<img class="item__image" src="${requestPath}/Campus/img/liberal.jpg" alt="item03"/>
					<h2 class="item__title">Centre for Preparatory & Liberal Studies:</h2>
				</a>
				
			</section>		
		</div>
		<!-- /container -->
		
		<div id="container-2" class="container">
			<header class="intro">
				<img class="intro__image" src="${requestPath}/Campus/img/sj-cs.jpg" alt="Road"/>
				<div class="intro__content">
					<h1 class="intro__title">St. James Campus</h1>
					<div class="intro__subtitle">				
						<div class="intro__description">
							A multi-panel layout with intro headers and image grids. Photo courtesy of <a href="http://instagram.com/danrubin/">Dan Rubin</a>.
						</div>
						<button class="trigger">
							<svg width="100%" height="100%" viewBox="0 0 60 60" preserveAspectRatio="none">
								<use class="icon icon--grid" xlink:href="#icon-grid" />
								<use class="icon icon--cross" xlink:href="#icon-cross" />
							</svg>
							<span>Toggle content</span>
						</button>
					</div>
				</div><!-- /intro__content -->
			</header><!-- /intro -->
			<section class="items-wrap">
				<a href="#" class="item">
					<img class="item__image" src="${requestPath}/Campus/img/item01.jpg" alt="item01"/>
					<h2 class="item__title">Centre for Business:</h2>
				</a>
				<a href="#" class="item">
					<img class="item__image" src="img/item02.jpg" alt="item02"/>
					<h2 class="item__title">Centre for Arts, Design & Information Technology:</h2>
				</a>
				<a href="#" class="item">
					<img class="item__image" src="img/item03.jpg" alt="item03"/>
					<h2 class="item__title">Centre for Community Services & Early Childhood:</h2>
				</a>
				<a href="#" class="item">
					<img class="item__image" src="img/item04.jpg" alt="item04"/>
					<h2 class="item__title">Centre for Hospitality & Culinary Arts:</h2>
				</a>
				<a href="#" class="item">
					<img class="item__image" src="img/item05.jpg" alt="item05"/>
					<h2 class="item__title">Centre for Preparatory & Liberal Studies:</h2>
				</a>
				<a href="#" class="item">
					<img class="item__image" src="img/item06.jpg" alt="item06"/>
					<h2 class="item__title">Serene</h2>
				</a>
				<a href="#" class="item">
					<img class="item__image" src="img/item07.jpg" alt="item07"/>
					<h2 class="item__title">Vulnerable</h2>
				</a>
				<a href="#" class="item">
					<img class="item__image" src="img/item08.jpg" alt="item08"/>
					<h2 class="item__title">Bountiful</h2>
				</a>
				<a href="#" class="item">
					<img class="item__image" src="img/item09.jpg" alt="item09"/>
					<h2 class="item__title">Endangered</h2>
				</a>
				<a href="#" class="item">
					<img class="item__image" src="img/item10.jpg" alt="item10"/>
					<h2 class="item__title">Beautiful</h2>
				</a>
				<a href="#" class="item">
					<img class="item__image" src="img/item11.jpg" alt="item11"/>
					<h2 class="item__title">Inspiring</h2>
				</a>
				<a href="#" class="item">
					<img class="item__image" src="img/item12.jpg" alt="item12"/>
					<h2 class="item__title">Refreshing</h2>
				</a>
			</section>
			
		</div><!-- /container -->
		<div id="container-3" class="container">
			<header class="intro">
				<img class="intro__image" src="img/wf.jpg" alt="Glacier"/>
				<div class="intro__content">
					<h1 class="intro__title">Waterfront Campus</h1>
					<div class="intro__subtitle">
						
						<div class="intro__description">
							 The focal point of the campus is the Daphne Cockwell Centre for Health Sciences, one of the cityâs most architecturally striking learning environments, overlooking the Toronto harbour. The facility was purpose-built to emphasize interprofessional team-based educationâthe new standard for health-care graduates entering the workforce.
						</div>
						<button class="trigger">
							<svg width="100%" height="100%" viewBox="0 0 60 60" preserveAspectRatio="none">
								<use class="icon icon--grid" xlink:href="#icon-grid" />
								<use class="icon icon--cross" xlink:href="#icon-cross" />
							</svg>
							<span>Toggle content</span>
						</button>
					</div>
				</div><!-- /intro__content -->
			</header><!-- /intro -->
			<section class="items-wrap">
				<a href="#" class="item">
					<img class="item__image" src="img/item01.jpg" alt="item01"/>
					<h2 class="item__title">Magnificence</h2>
				</a>
				<a href="#" class="item">
					<img class="item__image" src="img/item02.jpg" alt="item02"/>
					<h2 class="item__title">Electrifying</h2>
				</a>
				<a href="#" class="item">
					<img class="item__image" src="img/item03.jpg" alt="item03"/>
					<h2 class="item__title">Dynamic</h2>
				</a>
				<a href="#" class="item">
					<img class="item__image" src="img/item04.jpg" alt="item04"/>
					<h2 class="item__title">Crucial</h2>
				</a>
				<a href="#" class="item">
					<img class="item__image" src="img/item05.jpg" alt="item05"/>
					<h2 class="item__title">Awe-inspiring</h2>
				</a>
				<a href="#" class="item">
					<img class="item__image" src="img/item06.jpg" alt="item06"/>
					<h2 class="item__title">Serene</h2>
				</a>
				<a href="#" class="item">
					<img class="item__image" src="img/item07.jpg" alt="item07"/>
					<h2 class="item__title">Vulnerable</h2>
				</a>
				<a href="#" class="item">
					<img class="item__image" src="img/item08.jpg" alt="item08"/>
					<h2 class="item__title">Bountiful</h2>
				</a>
				<a href="#" class="item">
					<img class="item__image" src="img/item09.jpg" alt="item09"/>
					<h2 class="item__title">Endangered</h2>
				</a>
				<a href="#" class="item">
					<img class="item__image" src="img/item10.jpg" alt="item10"/>
					<h2 class="item__title">Beautiful</h2>
				</a>
				<a href="#" class="item">
					<img class="item__image" src="img/item11.jpg" alt="item11"/>
					<h2 class="item__title">Inspiring</h2>
				</a>
				<a href="#" class="item">
					<img class="item__image" src="img/item12.jpg" alt="item12"/>
					<h2 class="item__title">Refreshing</h2>
				</a>
			</section>
			
		</div><!-- /container -->
		<script src="js/classie.js"></script>
		<script>
			(function() {
				var support = { animations : Modernizr.cssanimations },
					animEndEventNames = { 'WebkitAnimation' : 'webkitAnimationEnd', 'OAnimation' : 'oAnimationEnd', 'msAnimation' : 'MSAnimationEnd', 'animation' : 'animationend' },
					animEndEventName = animEndEventNames[ Modernizr.prefixed( 'animation' ) ],
					onEndAnimation = function( el, callback ) {
						var onEndCallbackFn = function( ev ) {
							if( support.animations ) {
								if( ev.target != this ) return;
								this.removeEventListener( animEndEventName, onEndCallbackFn );
							}
							if( callback && typeof callback === 'function' ) { callback.call(); }
						};
						if( support.animations ) {
							el.addEventListener( animEndEventName, onEndCallbackFn );
						}
						else {
							onEndCallbackFn();
						}
					};

				var containers = [].slice.call( document.querySelectorAll( '.container' ) ),
					containersCount = containers.length,
					nav = document.querySelector( 'nav.thumb-nav' ),
					pageTriggers = [].slice.call( nav.children ),
					isAnimating = false, current = 0;

				function init() {
					resetScroll();
					// disable scrolling
					window.addEventListener( 'scroll', noscroll );
					// set current page trigger
					classie.add( pageTriggers[ current ], 'thumb-nav__item--current' );
					// set current container
					classie.add( containers[ current ], 'container--current' );
					// initialize events
					initEvents();
				}

				function initEvents() {
					// slideshow navigation
					pageTriggers.forEach( function( pageTrigger ) {
						pageTrigger.addEventListener( 'click', function( ev ) {
							ev.preventDefault();
							navigate( this );
						} );
					} );

					// open each container's content area when clicking on the respective trigger button
					containers.forEach( function( container ) {
						container.querySelector( 'button.trigger' ).addEventListener( 'click', function() {
							toggleContent( container, this );
						} );
					} );

					// keyboard navigation events
					document.addEventListener( 'keydown', function( ev ) {
						var keyCode = ev.keyCode || ev.which,
							isContainerOpen = containers[ current ].getAttribute( 'data-open' ) == 'open';

						switch (keyCode) {
							// left key
							case 37:
								if( current > 0 && !isContainerOpen ) {
									navigate( pageTriggers[ current - 1 ] );
								}
								break;
							// right key
							case 39:
								if( current < containersCount - 1 && !isContainerOpen ) {
									navigate( pageTriggers[ current + 1 ] );
								}
								break;
						}
					} );
				}

				function navigate( pageTrigger ) {
					var oldcurrent = current,
						newcurrent = pageTriggers.indexOf( pageTrigger );

					if( isAnimating || oldcurrent === newcurrent ) return;
					isAnimating = true;

					// reset scroll
					allowScroll();
					resetScroll();
					preventScroll();

					var currentPageTrigger = pageTriggers[ current ],
						nextContainer = document.getElementById( pageTrigger.getAttribute( 'data-container' ) ),
						currentContainer = containers[ current ],
						dir = newcurrent > oldcurrent ? 'left' : 'right';

					classie.remove( currentPageTrigger, 'thumb-nav__item--current' );
					classie.add( pageTrigger, 'thumb-nav__item--current' );

					// update current
					current = newcurrent;

					// add animation classes
					classie.add( nextContainer, dir === 'left' ? 'container--animInRight' : 'container--animInLeft' );
					classie.add( currentContainer, dir === 'left' ? 'container--animOutLeft' : 'container--animOutRight' );

					onEndAnimation( currentContainer, function() {
						// clear animation classes
						classie.remove( currentContainer, dir === 'left' ? 'container--animOutLeft' : 'container--animOutRight' );
						classie.remove( nextContainer, dir === 'left' ? 'container--animInRight' : 'container--animInLeft' );

						// clear current class / set current class
						classie.remove( currentContainer, 'container--current' );
						classie.add( nextContainer, 'container--current' );

						isAnimating = false;
					} );
				}

				// show content section
				function toggleContent( container, trigger ) {
					if( classie.has( container, 'container--open' ) ) {
						classie.remove( container, 'container--open' );
						classie.remove( trigger, 'trigger--active' );
						classie.remove( nav, 'thumb-nav--hide' );
						container.setAttribute( 'data-open', '' );
						preventScroll();
					}
					else {
						classie.add( container, 'container--open' );
						classie.add( trigger, 'trigger--active' );
						classie.add( nav, 'thumb-nav--hide' );
						container.setAttribute( 'data-open', 'open' );
						allowScroll();
					}
				}

				// scroll functions
				function resetScroll() { document.body.scrollTop = document.documentElement.scrollTop = 0; }
				function preventScroll() { window.addEventListener( 'scroll', noscroll ); }
				function allowScroll() { window.removeEventListener( 'scroll', noscroll ); }
				function noscroll() { 
					window.scrollTo( 0, 0 ); 
				}

				init();

				// For Demo purposes only (prevent jump on click)
				[].slice.call( document.querySelectorAll('.items-wrap a') ).forEach( function(el) { el.onclick = function() { return false; } } );
			})();
		</script>
	</body>
</html>