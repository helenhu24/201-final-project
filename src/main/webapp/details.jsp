<%--
Name: Paul Somodi
Email: somodi@usc.edu
Assignment: CSCI 201 - PA 2
File: details.jsp
 --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Details</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link
            href="https://fonts.googleapis.com/css2?family=Lobster&family=Roboto:wght@300&display=swap"
            rel="stylesheet">
<script src="https://kit.fontawesome.com/28d56811d7.js"></script>
    <link rel="stylesheet" href="index.css">
</head>

<body>
<!-- TODO -->
<body>
    <div class="topnav" style="background-color: white; border-bottom: 1px solid black;">
    	<div class="title">
    	<a href="index.jsp" style="color: #8b0000;">SalEats!</a>
    	</div>
	    	<div class="hello">
	    		<a style="font-size: 15px; text-align: center; float: left; margin-top: 4px;">
	    		<% String uName = "";
	    		String log = "auth.jsp";
	    		boolean loggedIn = false;
	    		for (Cookie c : request.getCookies()){
	    			if (c.getName().compareTo("userName") == 0) {
	    				uName = c.getValue();
	    				loggedIn = true;
	    			}
	    		}
				if (loggedIn) { 
					out.println("Hello, " + uName.replace("#", " "));
					log = "LogoutDispatcher";
				}
						%>
				</a>
	    	</div>
    	<a href=<%=log %>>
    	<% if (loggedIn) out.println("Log Out");
    	else out.println("Login / Register");
    	String query = request.getParameter("searching");
    	if (query == null) query = "";
    	String image = request.getParameter("image");
    	if (image == null) image = "";
    	String rname = request.getParameter("rname");
    	if (rname == null) rname = "";
    	String address = request.getParameter("address");
    	if (address == null) address = "";
    	String phone = request.getParameter("phone");
    	String price = request.getParameter("price");
    	if (price == "") price = "N/A";
    	String categories = request.getParameter("categories");
    	double rating = Float.parseFloat(request.getParameter("rating"));
    	%>
    	</a>
    	<a href="index.jsp">Home</a>
    </div>
    <div class="form" style="text-align: center; margin-top: 20px;">
    <form action="SearchDispatcher" method="GET">
    <div class="sort">
    <select name="pick">
    	<option value="name">Restaurant Name</option>
    	<option value="category">Category</option>
    </select>
    <input type="text" name="searching" value="<%=query %>" size="105"/>
	<button type="submit" class="fa-solid fa-magnifying-glass" style="border-radius: 3px; margin-left: 10px; margin-right: 20px; width: 3%; color: white; background-color: #8b0000; font-size: 16px; padding: 2.5px; border: none;"></button>
    <input type="radio" id="price" name="sort" value="price" checked>
    <label for="price">Price</label>
    <input type="radio" id="review" name="sort" value="review">
    <label for="review">Review Count</label>
    <input type="radio" id="rating" name="sort" value="rating">
    <label for="rating">Rating</label>
    </div>
    </form>
    </div>
    <div class="results" style="border-bottom: 1px solid black; width: 93%; display: block; margin-left: auto; margin-right: auto;">
    	<h1 style="margin-bottom: 0px; margin-top: 20px;"><%=rname %></h1>
    </div>
   <div class="results" style="border-bottom: 1px solid black; width: 93%; display: block; margin-left: auto; margin-right: auto;">
    	<img src="<%=image %>" style="width: 15%; margin-left: 30px; margin-top: 10px; margin-bottom: 10px; border-radius: 10px;">
		<a style="position: absolute; margin-top: 10px; margin-left: 10px; font-size: 15px;">Address: <%=address %></a>
	    <a style="position: absolute; margin-top: 30px; margin-left: 10px; font-size: 15px;"><%=phone %></a>
	    <a style="position: absolute; margin-top: 50px; margin-left: 10px; font-size: 15px;">Categories: <%=categories %></a>
	    <a style="position: absolute; margin-top: 70px; margin-left: 10px; font-size: 15px;">Price: <%=price %></a>
	    		<a style="position: absolute; margin-top: 90px; margin-left: 10px; font-size: 15px;">Rating: 
	    		<%if (rating >= 1) out.println("<i class=\"fa-solid fa-star\"></i>");
	    		  if (rating >= 2) out.println("<i class=\"fa-solid fa-star\"></i>");
	    		  if (rating >= 3) out.println("<i class=\"fa-solid fa-star\"></i>");
	    		  if (rating >= 4) out.println("<i class=\"fa-solid fa-star\"></i>");
	    		  if (rating >= 5) out.println("<i class=\"fa-solid fa-star\"></i>");%></a>
	</div>
</body>
</html>