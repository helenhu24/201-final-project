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
    <link rel="stylesheet" href="InProgressCompanies.css">
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
  <a href="index.jsp"><button class="optionbutton">In Progress</button></a>
  <form action="SearchAll" method="post">
  <button class="optionbutton2" onClick="submit(this.form)">All Companies</button>
  </form>
  <form action="SearchInProgress" method="post">
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
<c:forEach items = "${requestScope.arr}" var = "company">
	<div class='inpcontainer'>
	  <div class='inpcontainer-item'>
	  <div class='inpcontainer-detailsbox'>
	  <form id="deleteCompany" action="UserRemove" method="post">
	  <input type="hidden" name = "companyID" value="${company.getId()}">
		<button type="submit" onClick="submit(this.form)" class="delbutton"><i class="fa-solid fa-xmark"></i></button>
		</form>
	  <div class='inpcontainer-info'><h1><c:out value = "${company.getName()}"/></h1><br>
	  <div class='statuscontainer'>
	  <h2>Status:</h2><br>
		<form id="changeStatus" action="DetailDispatcher" method="post">
		<input type="hidden" name = "companyID" value="${company.getId()}">
		<input type="hidden" name = "companyadded" value="1">
		<button type="submit" onClick="submit(this.form)" class="changestatusbutton">Update Status</button><p>
		</form>
	  </div>
	  </div>
	  </div>
	  </div>
	</div>
</c:forEach>
</body>
</html>