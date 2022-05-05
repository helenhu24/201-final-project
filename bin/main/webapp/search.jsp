<%--
Name: Paul Somodi
Email: somodi@usc.edu
Assignment: CSCI 201 - PA 2
File: search.jsp
 --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link
            href="https://fonts.googleapis.com/css2?family=Lobster&family=Roboto:wght@300&display=swap"
            rel="stylesheet">
    <link rel="stylesheet" href="index.css">
<script src="https://kit.fontawesome.com/28d56811d7.js"></script> <%-- made my own fontawesome kit --%>

</head>
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
    	String category = "category";
    	if (request.getParameter("pick").compareTo("name") == 0) category = "restaurant name";
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
    	<h1 style="margin-bottom: 0px; margin-top: 20px;">Results for <%=query %> in <%=category %></h1>
    </div>
    <%-- I referenced the link in the PA writeup for how to use JSTL features: https://developers.google.com/identity/sign-in/web/sign-in. --%>
    <c:forEach var="restaurant" items="${data}">
    <div class="results" style="border-bottom: 1px solid black; width: 93%; display: block; margin-left: auto; margin-right: auto;">
    	<img src=<c:out value="${restaurant.imageUrl}"/> style="width: 15%; margin-left: 30px; margin-top: 10px; margin-bottom: 10px; border-radius: 10px;">
		<a href="details.jsp?rname=${restaurant.name }&address=${restaurant.address}&image=${restaurant.imageUrl}&phone=${restaurant.displayPhone}&categories=${restaurant.category}&price=${restaurant.price}&rating=${restaurant.rating}" style="position: absolute; margin-top: 10px; margin-left: 10px; font-size: 20px;"><c:out value="${restaurant.name}"/></a>
		<c:if test = "${restaurant.price == null }">
		<a style="position: absolute; margin-top: 35px; margin-left: 10px; font-size: 15px;">Price: N/A</a>
		</c:if>
		<c:if test = "${restaurant.price != null }">
	    <a style="position: absolute; margin-top: 35px; margin-left: 10px; font-size: 15px;">Price: <c:out value="${restaurant.price}"/></a>
	    </c:if>
	    <c:choose>
	    	<c:when test = "${restaurant.rating == 5 }">
	    		<a style="position: absolute; margin-top: 75px; margin-left: 10px; font-size: 15px;">Rating: <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i></a>
	    	</c:when>
	    	<c:when test = "${restaurant.rating >= 4 }">
	    		<a style="position: absolute; margin-top: 75px; margin-left: 10px; font-size: 15px;">Rating: <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i></a>
	    	</c:when>
	    	<c:when test = "${restaurant.rating >= 3 }">
	    		<a style="position: absolute; margin-top: 75px; margin-left: 10px; font-size: 15px;">Rating: <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i></a>
	    	</c:when>
	    	<c:when test = "${restaurant.rating >= 2 }">
	    		<a style="position: absolute; margin-top: 75px; margin-left: 10px; font-size: 15px;">Rating: <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i></a>
	    	</c:when>
	    	<c:when test = "${restaurant.rating >= 1 }">
	    		<a style="position: absolute; margin-top: 75px; margin-left: 10px; font-size: 15px;">Rating: <i class="fa-solid fa-star"></i></a>
	    	</c:when>
	    	<c:otherwise>
	    		<a style="position: absolute; margin-top: 75px; margin-left: 10px; font-size: 15px;">Rating: No Stars</a>
	    	</c:otherwise>
	    </c:choose>
	    <a style="position: absolute; margin-top: 55px; margin-left: 10px; font-size: 15px;">Review Count: <c:out value="${restaurant.reviewCount}"/></a>
	    <a href="${restaurant.url}" style="color: black; text-decoration: none; position: absolute; margin-top: 95px; margin-left: 10px; font-size: 15px;">Yelp Link</a>
    </div>
    </c:forEach>
</body>
</html>