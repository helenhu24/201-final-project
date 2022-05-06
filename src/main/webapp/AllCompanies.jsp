<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<script src="https://kit.fontawesome.com/86f2855db0.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@100;200;300;400;500;600&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <title>Company List</title>
    <link rel="stylesheet" href="AllCompanies.css">
</head>
<body>
<%@ include file="header.jsp" %><br>
<div class='optioncontainer'>
  <a href="index.jsp"><button class="optionbutton">In Progress</button></a>
  <a href="AllCompanies.jsp"><button class="optionbutton2">All Companies</button></a>
  <form action="SearchDispatcher" method="post">
  <button type="button" id = "searchgo" class="searchbutton"><i class="fa-solid fa-magnifying-glass"></i></button>
		<input type="text" id="search" name="search" placeholder=" ">
  </form>
  </div>
   	<div class="selectcontainer">
   	<p>Sorting By: 
		<select name="sort" id="sort">
		  <option value="dateadded">Date Added (Latest)</option>
		  <option value="alphabetical">Name A-Z</option>
		</select>
   	</div>
   	<br>
<div class='inpcontainer'>
  <div class='inpcontainer-item'>
  <div class='inpcontainer-detailsbox'>
  <div class='inpcontainer-info'><h1>Twitter</h1><br>
  <h3>Is in your active applications.</h3></div>
  <div class='statuscontainer'>
  <br>
  <button type="submit" onClick="submit(this.form)" class="removebutton">Remove</button>
  </div>
  </div>
  </div>
</div>
<div class='inpcontainer'>
  <div class='inpcontainer-item'>
  <div class='inpcontainer-detailsbox'>
  <div class='inpcontainer-info'><h1>Other company</h1><br>
  <h3>Is in your active applications.</h3></div>
  <div class='statuscontainer'>
  <br>
  <button type="submit" onClick="submit(this.form)" class="removebutton">Remove</button>
  </div>
  </div>
  </div>
</div>
<div class='inpcontainer'>
  <div class='inpcontainer-item'>
  <div class='inpcontainer-detailsbox'>
  <div class='inpcontainer-info'><h1>Other company</h1><br>
  <h3>Is not in your active applications.</h3></div>
  <div class='statuscontainer'>
  <br>
  <button type="submit" onClick="submit(this.form)" class="addbutton">Add</button>
  </div>
  </div>
  </div>
</div>
</body>
</html>