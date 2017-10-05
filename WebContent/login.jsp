<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="requestPath" value="${pageContext.request.contextPath}" />

<head>
  <meta charset="UTF-8">
  <title>Login Form</title>
      <link rel="stylesheet" href="${requestPath}/loginForm/css/style.css">
      <script type="text/javascript">

      </script>
</head>

<body>
  <div class="login-page" >
  <div class="form">
    <form class="register-form" action="SignUpServlet" method="post">
      
      <input type="email" placeholder="your email address"/>
      
      <select id = "country" name="country">
		  <option value="" disabled selected>Where you from?</option>
		  <option value="Canada">Canada</option>
		  <option value="China">China</option>
		  <option value="vk">VK</option>
	  </select>
	  
	  <div id="socialMedia">
	      <input id="wechatID" name="wechatID" type="text" placeholder="your wechatID "/>
	      <input id="vk" name="vk" type="text" placeholder="your VK Name "/>
      </div>
      
      <button>Go</button>
      <p class="message">Already registered? <a href="#">Sign In</a></p>
    </form>
    
    <form class="login-form" action="LoginServlet" method="post">
      <input name="ID" type="text" placeholder="student ID" />
      <input name="pwd" type="password" placeholder="password"/>
      <button>login</button>
      <p class="message">Not a student? <a href="#">Become a guest!</a></p>
    </form>
  </div>
</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    <script src="loginForm/js/index.js"></script>

</body>
</html>
