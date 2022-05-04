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
  </div>
  </div>
</div>
<div class='inpcontainer-status'>
<h2>Your Status:</h2><br>

</div>
</div>
</body>
</html>