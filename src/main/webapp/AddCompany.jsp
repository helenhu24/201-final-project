<!DOCTYPE html>
<%-- <%@ taglib uri="<a href="https://urldefense.com/v3/__http://java.sun.com/jsp/jstl/functions__;!!LIr3w8kk_Xxm!rb1I-8ZMqXU0oOzObm82UX4EvtSbFvgaEoIQ0cfXKRbMX0IRcffjTbeEliiRisIQWhcNy7ZDTe68MUvr$">http://java.sun.com/jsp/jstl/functions</a>" prefix="fn" %>  
<%@ taglib uri="<a href="https://urldefense.com/v3/__http://java.sun.com/jsp/jstl/core__;!!LIr3w8kk_Xxm!rb1I-8ZMqXU0oOzObm82UX4EvtSbFvgaEoIQ0cfXKRbMX0IRcffjTbeEliiRisIQWhcNy7ZDTU6syOMz$">http://java.sun.com/jsp/jstl/core</a>" prefix="c" %>  --%>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<script src="https://kit.fontawesome.com/86f2855db0.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@500;600&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <title>Add New Company</title>
    <link rel="stylesheet" href="AddCompany.css">
</head>
<body>
<%@ include file="header.jsp" %><br>
<div class='inpcontainer'>
  <div class='inpcontainer-item'>
<h1>Add New Company</h1><p>
<form id="addCompany" action="addCompany" method="post">
	  <input type="text" id="companyname" name="companyname" placeholder="Company Name" class="name"><p>
	  <h2>Stages:</h2><p>
	  <div id = "stagecontainer">
	  <input type="text" id="stage" name="1" placeholder="Add New" class="stages"><p>
	  </div>
	  <button type="button" id = "addstage" class="addstagebutton">+ Add Stage</button><p>
	  <button type="button" id = "delstage" class="delbutton"><i class="fa-solid fa-xmark"></i></button>
	  <button type="submit" onClick="submit(this.form)" class="addcompanybutton">Add Company</button><p>
	</form>
</div>
</div>
</body>
<script>


	document.querySelector("#delstage").style.visibility = "hidden";
	
	var button = document.querySelector("#addstage");
	button.onclick = function(event){
		addStage(event);
	};
	
	var dbutton = document.querySelector(".delbutton");
	dbutton.addEventListener("click",function(event){
		delStage(event)
	});
	
    function submit(form) {
    	form.submit();
    }
    var i = 2;
    function addStage(event){
    	event.preventDefault();
    	var stage = document.querySelector("#stagecontainer");
    	var ele = document.createElement("div");
    	ele.innerHTML = "<input type='text' id='stage' name='" + i + "' placeholder='Add New' class='stages'><p>"
    	i++;
    	stage.appendChild(ele);
    	document.querySelector("#delstage").style.visibility = "visible";
    	
    }
	function delStage(event){
    	event.preventDefault();
    	var stage = document.querySelector("#stagecontainer");
    	stage.removeChild(stage.lastChild);
    	i--;
    	var count = stage.getElementsByTagName('div').length;
    	console.log(count);
    	if(count <= 0){
    		document.querySelector("#delstage").style.visibility = "hidden";
    	}
	}
</script>
</html>