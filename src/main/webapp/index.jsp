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

<%@ include file="Searchbar.jsp" %><br>
<%
	String id = request.getParameter("");
	CompanyDataParser co = new CompanyDataParser();
	Company comp = co.getCompany(id);
	co.setStages(id);
	ArrayList<String> stage = co.stage;
	ArrayList<Integer> people = co.people;
%>
<c:forEach items = "${requestScope.arr}" var = "company">
	<div class='inpcontainer'>
	  <div class='inpcontainer-item'>
	  <div class='inpcontainer-detailsbox'>
	  <button type="button" id = "delstage" class="delbutton"><i class="fa-solid fa-xmark"></i></button>
	  <h1><c:out value = "${company.getName()}"/></h1><br>
	  	<input type="hidden" name = "companyID" value="${company.getId()}">
	  <h2>Software Engineer</h2><br>
	  <div class='statuscontainer'>
	  <h2>Your Status:</h2><br>
		<form id="changeStatus" action="changeStatus" method="post">
		  <% for(int i =0; i<people.size();i++){%>
				<input type="radio" id="stage1" name="status" value='<%=i%>'><label for="stage1"><%=stage.get(i)%></label><p>
		  <%} %>
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
  <div class='inpcontainer-info'><h1>Eviva's Sample</h1><br>
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

</body>
</html>