<!DOCTYPE html>
<%@ page session="false" %>
<%@page import="main.java.*, java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@500;600&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <title>Add New Company</title>
        <script type="text/javascript">
    function submit(form) {
    	form.submit();
    }
    </script>
    <link rel="stylesheet" href="CompanyDetails.css">
</head>
<body>
<%@ include file="header.jsp" %><br>
<%
	String id = request.getParameter("");
	CompanyDataParser co = new CompanyDataParser();
	Company comp = co.getCompany(id);
	co.setStages(id);
	ArrayList<String> stage = co.stage;
	ArrayList<Integer> people = co.people;
%>
<h1>Company Name<!-- <%= comp.getName() %> --></h1><p>
<div class='inpcontainer'>
  <div class='inpcontainer-item'>
  <div class='inpcontainer-detailsbox'>
  <div class='inpcontainer-details'>
  <h2>Current Applicant Statistics</h2>
  <table id="stagestats">
  <tr>
    <th style="padding-right: 150px;">Stage</th>
    <th>Number of Applicants</th>
  </tr>
  <% for(int i =0; i<people.size();i++){%>
 	<tr>
    	<td><%=stage.get(i)%></td>
    	<td><%=people.get(i)%></td>
  	</tr>
  <%} %>
</table>
  </div>
  </div>
</div>
<div class='inpcontainer-status'>
<h2>Your Status:</h2><br>
<form id="changeStatus" action="changeStatus" method="post">
  <% for(int i =0; i<people.size();i++){%>
		<input type="radio" id="stage1" name="status" value='<%=i%>'><label for="stage1"><%=stage.get(i)%></label><p>
  <%} %>
<button type="submit" onClick="submit(this.form)" class="changestatusbutton">Update Status</button><p>
</form>
</div>
</div>
</body>
</html>