<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html>
<head>
<link href='https://fonts.googleapis.com/css?family=Work Sans' rel='stylesheet'>
<style>
body {
  font-family: 'Work Sans', sans-serif;
  font-size: 18px;
}

ul {
  padding: 10px 80px 0px 40px;
  list-style-type: none;
  overflow: hidden;
}

li {
  display: inline;
}
.name {
  color: #5A5A5A;
  font-weight: 500;
}

li a {
  text-align: center;
  padding: 10px 10px;
  color: #C4C4C4;
  text-decoration: none;
}

li a:hover {
  color: #5A5A5A;
}

.imgcontainer {
	margin-left: 36px;
	margin-right: 72px;
}

.right {
  float: right;
}

</style>
</head>
<body>

<ul>
      <li><span class="name">
	    <% String uName = "";
	    String log = "Login.jsp";
	    boolean loggedIn = false;
	    if(request.getCookies() == null){
	    	loggedIn = false;
	    }
	    else{
		    for (Cookie c : request.getCookies()){
		    	if (c.getName().compareTo("userName") == 0) {
		    		uName = c.getValue();
		    		loggedIn = true;
		    	}
		    }
	    }
		if (loggedIn) { 
			out.println("Hi " + uName.replace("#", " "));
			log = "LogoutDispatcher";
		}
		%>
      </span></li>
      <li><a href=<%=log %>>
    	<% if (loggedIn) out.println("Log Out");
    	else out.println("Login / Register");
					%>
      </a></li>
      <li><a href="/SearchInProgress">Dashboard</a></li>
      <li><% if (loggedIn) { %>
         <a href="AddCompany.jsp">Add New</a>
      <% } %>
  	</li>
  	<li><span class="right"><img src="logo.png"></span></li>
	
</ul>
</body>
</html>
