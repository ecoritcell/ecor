<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<% 
    String lang = (String) session.getAttribute("language");
    if (lang == null) lang = "en";
%>
<div id="header-wrapper">
	<header id="header" class="container">
		<div id="logo">
			<a href="index.jsp"><img src="images/IR_logo.png" style="height: 100px;" alt=""></a> 
			
			<div>
				<h1><a href="#">पूर्व तट रेलवे</a></h1>
				<h2><a href="#">( East Coast Railway )</a></h2>
			</div>
			
			<div id="rightDiv" style="display: flex;">
				<a href="ChangeLanguageServlet?language=hindi"><button id="btnhindi" style="width: 80px;">Hindi</button></a>
					<!-- <button id="btnhindi" onclick="btnHindiClicked()">Hindi</button> -->
				<a href="ChangeLanguageServlet?language=en"><button id="btnenglish" style="width: 80px;">English</button></a>	
				<button id="btnlogin" style="display: none;width: 80px;" onclick="btnloginClicked()"> ></button>	
				<!-- <p id="paratop" ></p> -->
			</div>
			
		</div>
	</header>
</div>


<script type="text/javascript">

window.onload = function() {
	 
	 /* changeLoginLogoutBtn(); */ 
	 /* checkLanguage(); */ 	
	/*  setTimeout(() => {
		 checkLanguage();
	}, 1000); */
	/* console.log("window.onload = "+document.title); */ 
	
	console.log("window.onload");
	checkLanguage();
	changeLoginLogoutBtn();
	 
}

$(document).ready(function() {

	console.log("window.ready");	 
	checkLanguage();
	changeLoginLogoutBtn();
 
});

function checkLanguage(){
	
	var title = document.title;	
	var btnh = document.getElementById("btnhindi");
	var btne = document.getElementById("btnenglish");
	console.log("title = " + title);
	
	/* console.log("btnh = " + btnh);
	console.log("btne = " + btne); */
	
	if(title == "ECoR"){
		
		/* console.log("btnh = " + btnh);
		console.log("btne = " + btne); */
		
		var langtemp = '<%=lang %>';
		
		console.log("langtemp = " + langtemp);
		
		if(langtemp == "hindi"){
			btnh.style.display = "none";
			btne.style.display = "block";
		}
		else{
			btnh.style.display = "block";
			btne.style.display = "none";
		}
	}else{
		
		btnh.style.display = "none";
		btne.style.display = "none";
	}

	
	
}

function checkUserSession(){
	
	
	let isSessionExist = false;
	let path = document.location.pathname;
	let page = path.split("/").pop();
	let uname = '<%=session.getAttribute("userName")%>';
	let page_access = '<%=session.getAttribute("page_access")%>';
	
	console.log("uname - " +uname);
	console.log("page_access - " +page_access);
	
	if(uname != null && page_access != null && page_access.includes(page)){
		console.log("Session exist");
		isSessionExist = true; 		
	}else{
		console.log("Session expired");
		isSessionExist = false;
	}
	
	
	return isSessionExist;
}


function changeLoginLogoutBtn(){
	
	var btnlogin = document.getElementById("btnlogin");
	var title = document.title;		
	if(title != "ECoR"){
		
		btnlogin.style.display = "block";
		if(checkUserSession()){
			 $("#btnlogin").html("Logout");	 
		}else{
			console.log("Login button changeg to login");
			$("#btnlogin").html("Login");
		}
	}else{
		
		btnlogin.style.display = "none";
	}	
}

function btnloginClicked(){
	
	if(checkUserSession()){
		doLogout();
	}
	else{
	
		/* window.location.href = "login.jsp" */
		/* window.open('login.jsp', 'Login', 'width=500,height=500,top=100,left=100'); */
		openLoginPage();
	}
	 
}

function openLoginPage(){
	
	 var width = 500;
     var height = 400;

     var left = (screen.width / 2) - (width / 2);
     var top = (screen.height / 2) - (height / 2);
     var loginWindow = window.open(
             'login.jsp',
             'LoginForm',
             'width=' + width + ',height=' + height + ',top=' + top + ',left=' + left + ',resizable=no','location=no','status=no','titlebar=no','toolbar=no');
}


function doLogout(){
	
	$.post("UserServlet", {operation:"Logout"},function(response, status) {	     
		console.log("UserServlet response came");		
		reloadthepage();
			
	  }) 
}

function reloadthepage(){
	window.location.reload(true);	
}

function btnHindiClicked(){

	$.post("ChangeLanguageServlet", {language:"es"},function(response, status) {	     
		console.log("ChangeLanguageServlet response came");		
		window.location.href = "index.jsp"
			
	  }) 
}

/* function checkModulenameAndPageName(modulename){
	
	var isModuleAndLoggedinUserSame = false;
	if(modulename != null && modulename.length >0){
		var path = document.location.pathname;
		var page = path.split("/").pop();
		
		if((page == "appointments_meetings.jsp" ||"appointment_form.jsp" || page == "tour_programme.jsp" ||"tour_programme_form.jsp" ) && modulename =="APT"){
			isModuleAndLoggedinUserSame = true;
		}else if((page == "jpo.jsp" || page == "oqa.jsp" || page == "gmanr.jsp" || page == "circular_and_policy.jsp") && modulename =="ANR"){
			isModuleAndLoggedinUserSame = true;
		}

	}
	
	return isModuleAndLoggedinUserSame;
} */


</script>