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
  %>
  
<%@ include file="header.jsp" %><br>
<%@ include file="Searchbar.jsp" %><br>
<div class='inpcontainer'>
  <div class='inpcontainer-item'>
  <div class='inpcontainer-detailsbox'>
  <button type="button" id = "delstage" class="delbutton"><i class="fa-solid fa-xmark"></i></button>
  <div class='inpcontainer-info'><h1>Twitter</h1><br>
  <h2>Software Engineer</h2><br>
  <h3>Date Added: 04/13/2022</h3></div>
  <div class='statuscontainer'>
  <form action="changeStatus" method="post">
  	Status:
  	<input type="radio" id="1" name="status" value="1" checked><label for="1">Submitted</label>
  	<input type="radio" id="2" name="status" value="2"><label for="2">Interview I Completed</label>
  	<input type="radio" id="3" name="status" value="3"><label for="3">Interview II Completed</label>
  	<input type="radio" id="4" name="status" value="4"><label for="4">Accepted</label>
  	<input type="radio" id="5" name="status" value="5"><label for="5">Denied</label><br>
  	<button type="submit" onClick="submit(this.form)" class="changestatusbutton">Update Status</button>
  </form>
  </div>
  </div>
  </div>
</div>
<div class='inpcontainer'>
  <div class='inpcontainer-item'>
  <div class='inpcontainer-detailsbox'>
  <button type="button" id = "delstage" class="delbutton"><i class="fa-solid fa-xmark"></i></button>
  <div class='inpcontainer-info'><h1>horny people</h1><br>
  <h2>have no rights. horny people</h2><br>
  <h3>are not protected under the constitution.</h3></div>
  <div class='statuscontainer'>
  <form action="changeStatus" method="post">
  	Status:
  	<input type="radio" id="1" name="status" value="1" checked><label for="1">Example 1</label>
  	<input type="radio" id="2" name="status" value="2"><label for="2">Example 2</label>
  	<input type="radio" id="3" name="status" value="3"><label for="3">Example 3</label>
  	<input type="radio" id="4" name="status" value="4"><label for="4">Example 4</label><br>
  	<button type="submit" onClick="submit(this.form)" class="changestatusbutton">Update Status</button>
  </form>
  </div>
  </div>
  </div>
</div>
<div class='inpcontainer'>
  <div class='inpcontainer-item'>
  <div class='inpcontainer-detailsbox'>
  <button type="button" id = "delstage" class="delbutton"><i class="fa-solid fa-xmark"></i></button>
  <div class='inpcontainer-info'><h1>if you are</h1><br>
  <h2>horny i WILL find you</h2><br>
  <h3>and then you will be sorry buster</h3></div>
  <div class='statuscontainer'>
  <form action="changeStatus" method="post">
  	Status:
  	<input type="radio" id="1" name="status" value="1" checked><label for="1">Example 1</label>
  	<input type="radio" id="2" name="status" value="2"><label for="2">Example 2</label>
  	<input type="radio" id="3" name="status" value="3"><label for="3">Example 3</label>
  	<input type="radio" id="4" name="status" value="4"><label for="4">Example 4</label><br>
  	<button type="submit" onClick="submit(this.form)" class="changestatusbutton">Update Status</button>
  </form>
  </div>
  </div>
  </div>
</div>
</body>
</html>