<!DOCTYPE html>
<%@ page session="false" %>
<%@page import=" java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@500;600&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <title>Company Details</title>
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
	ArrayList<String> stage = (ArrayList<String>)request.getAttribute("stage");
	ArrayList<Integer> people = (ArrayList<Integer>)request.getAttribute("people");
	String companyname = (String)request.getAttribute("company");
	String companyid = (String)request.getAttribute("companyid");
	String added = (String)request.getAttribute("companyadded");
	Object progress = request.getAttribute("progress");
	boolean  logginIn  =  (boolean)request.getAttribute("loggedIn");
%>
<%-- <c:forEach items = "${requestScope.company}" var = "company">--%>
<h1><%=companyname%></h1><p>
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
<%if(loggedIn){ %>
<div class='inpcontainer-status'>
<%if(added.equals("0")) { %>
<form id="addCompany" action="UserAdd" method="post">
  <input type="hidden" name = "companyID" value='<%=companyid%>'>
<button type="submit" onClick="submit(this.form)" class="addcompanybutton">Add Company</button><p>
</form>
</div>
<%} else { %>
<h2>Your Status:</h2><br>
<form id="changeStatus" action="UpdateTracking" method="post">
  <%for(int i =0; i< stage.size();i++){%>
		<input type="radio" id="stage1" name="status" value='<%=i + 1%>' <%if(i==(Integer)progress - 1){%>checked<%} %>><label for="stage1"><%=stage.get(i)%></label><p>
  <%} %>
  <input type="hidden" name = "companyID" value='<%=companyid%>'>
  <input type="hidden" name = "status" value="status">
<button type="submit" onClick="submit(this.form)" class="changestatusbutton">Update Status</button><p>
</form>
</div>
<%} %>
<%} %>
<%--</c:forEach> --%>
</body>
</html>