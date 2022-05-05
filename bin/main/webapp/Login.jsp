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
	<%String er = (String) request.getAttribute("error");
   	 if (er != null) {
	out.println("<div style=\"background-color: #FF7F7F; color: white; text-align: center; padding-top: 15px; padding-bottom: 15px;\">");
	out.println(er);
	out.println("</div>");
	}
	%><div class='inpcontainer'>
  <div class='inpcontainer-item'>
    <h1>Sign In</h1><p>
    <% 
    String login_email = request.getParameter("loginemail");
    if (login_email == null) login_email = "";

	%>
	<form id="login" action="LoginDispatcher" method="GET">
	  <input type="text" id="loginemail" name="loginemail" placeholder="Email Address" value = <%=login_email %>><p>
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