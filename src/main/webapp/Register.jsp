<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href='https://fonts.googleapis.com/css?family=Work Sans' rel='stylesheet'>
<meta charset="UTF-8">
<title>Register</title>
<script type="text/javascript">
    function submit(form) {
    	form.submit();
    }
    </script>
    <link rel="stylesheet" href="Register.css">
</head>
<body>
<div class='firstlast'>
   <h1>Sign Up</h1>
   <br><br>
  <div class='firstlast-item'>
   
    
	<form id="login" action="LoginDispatcher" method="post">
	<!-- <div class='line1'> -->
	  <div class="fname">
	    <input type="text" id="firstName" name="firstName" placeholder="First Name"><p>
	  </div>
	  <div class="lname">
	     <input type="text" id="lastName" name="lastName" placeholder="Last Name"><p>
	  </div>
	
	<!-- </div> -->
	<div class="email">
	    <input type="text" id = "emailAddress" name="emailAddress" placeholder="Email Address"><p>
	  </div>
	  
	  <div class="pword">
	    <input type="password" id = "password" name="password" placeholder="Password"><p>
	  </div>
	  <div class="confirm_pword">
	    <input type="password" id = "confirmPassword" name="confirmPassword" placeholder="Confirm Password"><p>
	  </div>
	  <button type="submit" onClick="submit(this.form)" class="loginbutton"></i>Sign Up</button><p>
	</form>
	<div class='optionscontainer-item'>
	<a href="Login.jsp" class="options"><b>I Already Have an Account</b></a><p class="options">
	<a href="index.jsp" class="options"><b>Continue as Guest</b></a>
	</div>
	<p>
  </div>
</div>
</body>
</html>