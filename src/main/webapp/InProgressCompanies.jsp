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
	  <button type="button" id = "delstage" class="delbutton"><i class="fa-solid fa-xmark"></i></button>
	  <div class='inpcontainer-info'><h1><c:out value = "${company.getName()}"/></h1><br>
	  <h2>Software Engineer</h2><br>
	  <input type="hidden" name = "companyID" value="${company.getId()}">
		
	  <div class='statuscontainer'>
	  <h2>Status:</h2><br>
		<form id="changeStatus" action="changeStatus" method="post">
		<button type="submit" onClick="submit(this.form)" class="changestatusbutton">Update Status</button><p>
		</form>
	  </div>
	  </div>
	  </div>
	</div>
</c:forEach>


<div class='inpcontainer'>
  <div class='inpcontainer-item'>
  <div class='inpcontainer-detailsbox'>
  <button type="button" id = "delstage" class="delbutton"><i class="fa-solid fa-xmark"></i></button>
  <div class='inpcontainer-info'><h1>TESTING WORMS</h1><br>
  <h2>Software Engineer</h2><br>
  <h3>Date Added: 04/13/2022</h3></div>
  <div class='statuscontainer'>
  <form action="UpdateTracking" method="post">
  <input type="hidden" name = "companyID" value="22">
  	Status:
  	<input type="radio" id="1" name="status" value="1"><label for="1">grubs</label>
  	<input type="radio" id="2" name="status" value="2"><label for="2">dirt</label><br>
  	<button type="submit" onClick="submit(this.form)" class="changestatusbutton">Update Status</button>
  </form>
  </div>
  </div>
  </div>
</div>

</body>
</html>