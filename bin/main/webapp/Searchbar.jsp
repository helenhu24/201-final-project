<!DOCTYPE html>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html>
<head>
<script src="https://kit.fontawesome.com/86f2855db0.js" crossorigin="anonymous"></script>
<style>

.optioncontainer {
	margin-left: 26%;
	white-space: nowrap;
}

.optionbutton {
	all: unset;
	text-align: center;
	font-weight: 300;
	color: white;
	width: 208px;
	height: 47px;
	background: #7191F9;
}

.optionbutton2 {
	all: unset;
	text-align: center;
	font-weight: 300;
	color: white;
	width: 208px;
	height: 47px;
	background: #2947A9;
}

button:hover {
	cursor: pointer;
}

input[type=text] {
	all: unset;
	outline: none;
	font-family: 'Work Sans';
	font-style: normal;
	font-weight: 500;
	text-indent: 40px;
	text-align: left;
	margin-left: 1%;
	color: #5A5A5A;
	background: #E7E5E5;
	border-radius: 35px;
	width: 30%;
	height: 40px;
	display: inline-block;
}

input[type=text]:not(:placeholder-shown) {
	background: white;
	border: 0.1px solid #E7E5E5;
}

.selectcontainer {
	margin-left: 26%;
	font-family: 'Work Sans';
	font-style: italic;
	font-weight: 600;
	font-size: 13px;
	line-height: 15px;
	letter-spacing: -0.02em;
	width: 20%;
	white-space: nowrap;
}

.selectcontainer select {
	all: unset;
	color: #4E75F5;
	font-style: normal;
	font-weight: 400;
	font-size: 13px;
	line-height: 15px;
	letter-spacing: -0.02em;
	cursor: pointer;
	padding-right: 20px;
}
.selectcontainer::after {
    content: '\f0d7';
    font: normal normal normal 17px/1 FontAwesome;
    font-size: 16px;
    color: #C4C4C4;
    padding: 15px 0px 0px 8px;
    position: relative;
    left: 190px;
    bottom: 30px;
    pointer-events: none;
}

.searchbutton {
	all: unset;
	background:none;
    border:none;
    margin:0;
    padding:0;
    font-size: 16px;
    color:  #9F9F9F;
    cursor: pointer;
    position: relative;
   left: 60px;
}
</style>
</head>
<body>
<div class='optioncontainer'>
  <form action="SearchDispatcher" method="post">
  <button type="submit" onClick="submit(this.form)" class="optionbutton">In Progress</button>
  <button type="submit" onClick="submit(this.form)" class="optionbutton2">All Companies</button>
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
</body>
</html>