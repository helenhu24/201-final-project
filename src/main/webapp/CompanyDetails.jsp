<!DOCTYPE html>
<%@ page session="false" %>
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
<h1>Company Name</h1><p>
<div class='inpcontainer'>
  <div class='inpcontainer-item'>
  <div class='inpcontainer-detailsbox'>
  <div class='inpcontainer-details'>
  <h2>Current Applicant Statistics</h2>
  <table id="stagestats">
  <tr>
    <th style="padding-right: 150px;">Current Stage</th>
    <th>Number of Applicants</th>
  </tr>
  <tr>
    <td>Example 1</td>
    <td>420,420</td>
  </tr>
  <tr>
    <td>Example 2</td>
    <td>69,696,969</td>
  </tr>
</table>
  </div>
  </div>
</div>
<div class='inpcontainer-status'>
<h2>Your Status:</h2><br>
<form id="changeStatus" action="changeStatus" method="post">
<input type="radio" id="stage1" name="status" value="stage1"><label for="stage1">Example 1</label><p>
<input type="radio" id="stage2" name="status" value="stage2"><label for="stage2">Example 2</label><p>
<button type="submit" onClick="submit(this.form)" class="changestatusbutton">Update Status</button><p>
</form>
</div>
</div>
</body>
</html>