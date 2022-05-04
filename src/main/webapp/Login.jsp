<!DOCTYPE html>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html>
<head>
<link href='https://fonts.googleapis.com/css?family=Work Sans' rel='stylesheet'>
<link href="node_modules/text-security/text-security.css" rel="stylesheet" type="text/css">
    <meta charset="UTF-8">
    <title>Login</title>
        <script type="text/javascript">
    function submit(form) {
    	form.submit();
    }
    </script>
    <link rel="stylesheet" href="Login.css">
</head>
<body>
<c:if test="${failedlogin}"><div class = 'failedlogin'>Invalid email or password.</div></c:if>
<div class='inpcontainer'>
  <div class='inpcontainer-item'>
    <h1>Sign In</h1><p>
	<form id="login" action="LoginDispatcher" method="post">
	  <input type="text" id="loginemail" name="loginemail" placeholder="Email Address"><p>
	  <input type="password" id="loginpass" name="loginpass" placeholder="Password" class="pw"><p>
	  <a href="ForgotPassword.jsp" class="forgotpassword">Forgot Password</a><p>
	  <div style="clear: both;"></div>
	  <button type="submit" onClick="submit(this.form)" class="loginbutton"></i>Log In</button><p>
	</form>
	<div class='optionscontainer-item'>
	or <a href="Register.jsp" class="options"><b>Sign Up</b></a><p class="options">
	<a href="index.jsp" class="options"><b>Continue as Guest</b></a>
	</div>
	<p>
	</div>
</div>
</body>
</html>