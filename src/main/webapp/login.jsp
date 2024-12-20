<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="icon" href="images/IR_logo.png" type="image/x-icon" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- <link href="css/default.css" rel="stylesheet" type="text/css" media="all"> -->
<link href="css/login.css" rel="stylesheet" type="text/css" media="all">

</head>
<body>
<!-- <div id="header"></div> -->
<div id="logincontainer">

		<div id="loginform" >				
			<h2 style="text-align: center;">Login</h2>
		
			<form id="addnewform" action="#">				
				<table id="formtable">
					<tr>
						<td>
							<div >
					    	<!-- <label for="txtusername">Username: <span class="requiredDesign">*</span></label> -->
					    	<label for="txtusername">Username: <span class="requiredDesign">*</span></label>
				        	<input id="txtusername" name="txtusername" class="common-input " type="text" placeholder="Enter username"  required>  
							</div>
						</td>											
					</tr>
					
					
					<tr>
						<td>
							<div>
						    	<label for="txtpassword">Password: <span class="requiredDesign">*</span> </label>
					        	<input id="txtpassword" name="txtpassword" class="common-input" type="password" placeholder="Enter password"  required>  
							</div>
						</td>
											
					</tr>
										
					<tr>
						<td>
							<div style="text-align: center; display: flex; justify-content: center; padding: 30px;" >
			  					<input type="button" value="LOGIN"  class="" style="margin-right: 10px;" onclick="submitClicked()">
							</div>
						</td>
					</tr>
					<tr>
						<td >
							<div>
			  		 			<p id="statuspara"></p> 
							</div>
						</td>
					</tr>
				
				</table>
				</form>	
		
		</div>
</div>
<!-- <div id="footer"></div> -->
</body>

<script type="text/javascript">
$("#header").load("html/header.html");
$("#footer").load("html/footer.html");
function submitClicked(){
	
	var $statusPara = $("#statuspara");

	var usrname = $("#txtusername").val().trim();
	var usrpassword = $("#txtpassword").val().trim();
	
	if(usrname.length <= 0)
		alert("Enter username.");
	else if(usrpassword.length <=0)
		alert("Enter password.");
	else{
				        			
		$.get("UserServlet",{operation:"getUserDetails",username:usrname,password:usrpassword},function(response, status) {
			
			console.log("status" + status);
	        if(response.length == 0){
	        	$statusPara.text ("Some error occured plase tray again later.");
				$statusPara.css("color", "red");
	        }
	        else{
	        	
	        	 var status = -1;
	        	 var msg = "Some  error occured please try again...";
	             $.each(response, function(index,item){     
	            	 status = item.status;
	            	 msg = item.msg;	            	 
	             })
	             
	             if(status <1){
	            		$statusPara.text (msg);
						$statusPara.css("color", "red");
	             }
	             else{
	            	/*  modal.style.display = "none"; */
	            	/*  changeLoginLogoutBtn(); */
	            	 /* window.location.href = "index.jsp" */
	            	 window.opener.location.reload(); // Reload the parent window (index.jsp)
    				window.close(); // 
	             }
	       	 }        	
	       
	  	  }) 			
	}
	
}

<%-- window.onload = function() {
	 
	 changeLoginLogoutBtn(); 
}


function checkUserSession(){
	
	var isSessionExist = false;
	var uname = '<%=session.getAttribute("userName")%>';
	console.log("uname - " +uname);
	if(uname != "null"){
		console.log("Session exist");
		isSessionExist = true; 		
	}else{
		console.log("Session expired");
		isSessionExist = false;
	}
	
	return isSessionExist;
}


function changeLoginLogoutBtn(){
	
	if(checkUserSession()){
		console.log("Login button changeg to logout");
		 var btn = document.getElementById("btnlogin");
		 console.log(btn);		 
		 /* btn.innerText("Logout"); */
		 $("#btnlogin").html("Logout");	 
	}else{
		console.log("Login button changeg to login");
		$("#btnlogin").html("Login");
	}
}
 --%>
</script>



</html>