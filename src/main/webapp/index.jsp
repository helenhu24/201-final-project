<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<script src="https://kit.fontawesome.com/86f2855db0.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@100;200;300;400;500;600&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link rel="stylesheet" href="index.css">
</head>
<body>
  
  <%
  String keyWord = (String)request.getAttribute("search");
  String sort = (String)request.getAttribute("sort");
  if(sort ==null){
	  sort="numApps";
	  
  }
//  ArrayList<Company> arr = CompanyDataParser.getCompanies(keyWord,sort,"inProgress");
  Object arr = request.getAttribute("arr");
  %>
  
<%@ include file="header.jsp" %><br>
<%if(loggedIn){ %>
	<input type="hidden" name="loggedIn" value="true">
<%} else{ %>
	<input type="hidden" name="loggedIn" value="false"> 
<%} %>

<div class='optioncontainer'>
<form action="SearchInProgress" method="post">
  <button class="optionbutton" onClick="submit(this.form)">In Progress</button>
  </form>
  <form action="SearchAll" method="post">
  <button class="optionbutton2" onClick="submit(this.form)">All Companies</button>
  </form>
  <form method="post">
  <button type="button" id = "searchgo" class="searchbutton"><i class="fa-solid fa-magnifying-glass"></i></button>
		<input type="text" id="search" name="search" placeholder=" ">
  </form>
  </div>
   	<div class="selectcontainer">
   	<p>Sorting By: 
		<select name="sort" id="sort">
		  <option value="numApps">Number of Applications</option>
		  <option value="alphabetical">Name A-Z</option>
		</select>
   	</div><br>

</body>
</html>