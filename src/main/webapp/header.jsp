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
  padding: 20px 80px 40px 40px;
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

</style>
</head>
<body>

<ul>
      <li><span class="name">Hi {name}!</span></li>
      <li><a href="LogoutDispatcher?param=value">Logout</a></li>
      <li><a href="index.jsp">Dashboard</a></li>
      <li><a href="AddCompany.jsp">Add New</a></li>
</ul>
</body>
</html>