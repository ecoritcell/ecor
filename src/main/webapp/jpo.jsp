<%@page import="customclasses.AppConfig"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% 
 int globaltablesize = AppConfig.getTableSize();    
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JPO</title>
<link rel="icon" href="images/IR_logo.png" type="image/x-icon" />
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="css/default.css" rel="stylesheet" type="text/css"media="all">
<link href="css/fonts.css" rel="stylesheet" type="text/css" media="all">
<link href="css/jpo.css" rel="stylesheet" type="text/css" media="all">

</head>
<body>

	<div id="header"></div>

	<div id="mainbody">
		<div id="pagename-wrapper">
			<div id="pagename" class="container">
				<h3>JOINT PROCEDURAL ORDER</h3>
			</div>
		</div>


		<div id="form-wrapper" class="container">
		
			<div id="form" >
				<form action="#">
					<div id="formdiv">
						<label id="yearlable" for="pagedepartment" class="flex-items">Select
							Department</label> 
							<select id="pagedepartment" name="pagedepartment" class="flex-items" style="text-align: center;">
								<option value="-1">All</option>
								<option value="1">Accounts</option>
								<option value="2">Personnel</option>
								<option value="3">Commercial</option>
								<option value="4">Operating</option>
								<option value="5">Signal and Telecom</option>
						</select>
						<br> 
						<br>
						 <input type="button" value="GO" class="flex-items" onclick="goClicked()">
					</div>
				</form>
			</div>
			
			<div id="addanrdiv">				
				<input id="btnaddnew" type="button"  value="ADD NEW JPO" class="flex-items" onclick="addNewJpoClicked()" style="display: none;">
			</div>
		</div>

		<div id="table-wrapper" class="container">
			<table id="anrtable">
				<thead>
					<tr>
					<th>SL NO.</th>
					<th>DEPARTMENT</th>
					<th>JPO SL NO.</th>
					<th>JPO SUBJECT</th>
					<th>UPLOAD DATE</th>
				</tr>
				</thead>
				
				<tbody id="anrtablebody">
					<tr > <td colspan='5'> </td></tr>
				</tbody>
				
				<tfoot id="tablefooter">
				</tfoot>
				
			</table>
		</div>
		
		
		<!--MODEL VIEW-->		
		<div id="myModel" class="modal">
				
			<div id="modelcontainer" class="modal-content">		
				<span class="close" onclick="closeCliked()">&times;</span>
				<h2 style="text-align: center; margin-bottom: 0px;">ADD NEW JOINT PROCEDURAL ORDER</h2>
				<hr>
				<p id="" style="color: red; margin: 0px; padding-left: 10px;"><b>*All fields are mandatory.</b></p> 
				<hr>
				
				
				<form id="addnewform" action="#">				
				<table id="formtable">
				 <colgroup>
			       <col span="1" style="width: 50%;">
			       <col span="1" style="width: 50%;">
			    </colgroup>
					<tr>
						<td>
							<div>
					    	<label for="departmentdropdown">Select Department:</label>
					    	<select id="departmentdropdown" name="departmentdropdown" class="common-input">
					    		<option value="-1">--Select Department--</option>					
								<option value="1">Accounts</option>
								<option value="2">Personnel</option>
								<option value="3">Commercial</option>
								<option value="4">Operating</option>
								<option value="5">Signal and Telecom</option>
							</select>					    	
							</div>
						</td>
						
						<td>
							<div>
						    	<label for="txtjposlno">JPO Sl No:</label>
					        	<input id="txtjposlno" name="txtjposlno" class="common-input" type="text" placeholder="Enter sl no"  required>  
							</div>
						</td>
											
					</tr>
					
										
					<tr>
						<td>
							<div>
						    	<label for="txtjposubject">JPO Subject:</label>
					        	<input id="txtjposubject" name="txtjposubject" class="common-input" type="text" placeholder="Enter subject" required>  
							</div>
						</td>
						
						<td>
								<div>
	       							<label for="uploaddocument">Select Document: <span id="fileSize" style="font-size: 12px; color: #aaa;"></span> </label>	       			 
			  						<input type="file" id="uploaddocument" name="uploaddocument" class="common-input" onchange="fileValidation()" accept=".pdf" > 
								</div>
						</td>
											
					</tr>
					
					<tr>
						<td colspan="2">
							<div style="text-align: center; display: flex; justify-content: center;" >
			  					<input type="button" value="SUBMIT"  class="" style="margin-right: 10px;" onclick="submitClicked()">
			  					<input type="button" value="RESET"  class="" style="margin-left: 10px;" onclick="resetClicked()">
							</div>
						</td>
					</tr>

					<tr>
						<td colspan="2">
							<div>
			  		 			<p id="statuspara"></p> 
							</div>
						</td>
					</tr>
				
				</table>
				</form>			
		</div>
		
		</div>
		
		
	</div>
	
	<div id="footer"></div>

</body>

<script type="text/javascript">
	
	
/* $("#header").load("html/header.html"); */
$("#header").load("header.jsp");
$("#footer").load("html/footer.html");

var modal = document.getElementById("myModel");


 window.onclick = function(event) {
     if (event.target == modal) {
    	 $("#pagedepartment").val("-1").attr("selected","selected");
         modal.style.display = "none";
         loadDepartmentWiseJpoData("-1","1");
     }
 }
 
 document.addEventListener("visibilitychange", function() {
	  if (document.visibilityState === "visible") {
	    location.reload(); // Reloads the page when user switches back to this tab
	  }
	});
 
 $(document).ready(function() {		
		
		 loadDepartmentWiseJpoData("-1","1");
		 showHideAddNewBtn();
	})
 
	function showHideAddNewBtn(){

	 	let path = document.location.pathname;
		let page = path.split("/").pop();
		var btnaddnew = document.getElementById("btnaddnew");
		var uname = '<%=session.getAttribute("userName")%>';
		let page_access = '<%=session.getAttribute("page_access")%>';
		if(uname !=null && page_access !=null && page_access.includes(page)){			
			btnaddnew.style.display = "block";
		}
		else{
			btnaddnew.style.display = "none";
		}
	}
	
	function loadDepartmentWiseJpoData(departmentid,pgno){
		
    	console.log("departmentid "+departmentid );        
    	if(departmentid.length > 0){
    		
    		$.get("JpoServlet",{operation:"getJpoByDepartment",deptid:departmentid,pagenumber:pgno},function(response, status) {
    			
    	        var $anrtablebody = $("#anrtablebody");
    	        $anrtablebody.find("tr").remove();        
    	        
    	        var $anrtablefooter = $("#tablefooter");
    	        $anrtablefooter.find("tr").remove();  

    	        
    	        if($.isEmptyObject(response)){
    	        	console.log("Data Not Found" );        	
    	        	var tableRow = "<tr  > <td colspan='5' class='noRecord'> No Data Found.</td></tr>";
    				$anrtablebody.append(tableRow);        	
    	        }
    	        else{
    	        	
    	        	const pageSize = <%=globaltablesize%>;
              		 var pageNumber = +pgno; /* Converts string to integer */
              	 	$.each(response, function(index,item){
              	 		
              	 		if(index == "totalcount" && item >0){
              	 			
	   		           		 var pagecount = Math.ceil(item/pageSize);
	   		           		 console.log("pagecount" + pagecount);
	   		           		 var footerrow = "<tr>" +
	   		           		 				"<td colspan='6'>  <ul id='footerul'> <li>Pages:</li>";
	   		           		 
		   		           		 if(pagecount>1){
		   		           			 
		   			            		 for (var i = 1; i <= pagecount; i++) {
		   										
		   			            			 var temp ="";
		   			            			 if(i == pageNumber)
		   			            				 temp = "<li> <a class='selectedPgae'>"+i+" </a></li>";
		   			            			else
		   			            				temp = "<li> <a  onclick='pageNumberCliked(\""+departmentid+"\"," + "\""+i+"\")' style='cursor: pointer;' >"+i+" </a></li>";
		   			            			 footerrow += temp;
		   								}
		   			            		 
		   			            		 footerrow = footerrow + "</ul> </td> </tr>";
		   			            		 $anrtablefooter.append(footerrow);
   		           				 }    	            		 					
	   		           	 }    	            	 
	   		           	 else if(index == "values"){ 
	   		           		
	   		           		 console.log("item.length =" + item.length);
	   		           		 if(item.length == 0){
	   		           			 
		   		           			var tableRow = "<tr  > <td colspan='5' class='noRecord'> No Data Found.</td></tr>";
			    					$anrtablebody.append(tableRow); 

	   		           		 }
	   		           		 else{
	    				
			           		 var slno  = (pageNumber*pageSize) - (pageSize - 1);			           		 
		    	             $.each(item, function(index,item){        			    	             		
		    	              var tableRow = "<tr>" +
		    	              					"<td>" + slno + "</td>" +
		    	                 				"<td>" + item.department + "</td>" +
		    	                 				"<td>" + item.jposlno + "</td>" +
		    	                 				"<td>" + "<a href='ExternalDocument?type=1"+"&name="+item.filename+"' target='_blank'>"+item.jposubject +"</a>"+ "</td>" +
		    	                 				"<td>" + item.creationdate + "</td>" +    	                 						
		    	                 				"</tr>";
		    	                 $anrtablebody.append(tableRow);
		    	                 slno +=1;
		    	             })
	   		           		 }
	   		           		
	   		           	}
              	 		
              	 	})
    	        	
    	        	
    	       	 }        	
    	       
    	  	  })  
    	}else{
    		
    		console.log("No department selected"); 
    	}
	}

	function goClicked() {

		var deptid1 = $("#pagedepartment").val();
		if(deptid1.length >0){
			loadDepartmentWiseJpoData(deptid1,"1");
		}			
	}
	
	function addNewJpoClicked(){
	
		  modal.style.display = "block";
	}
	
	
	
	function submitClicked(){
	
		var deptid = $("#departmentdropdown").val();
		var departmentname = $("#departmentdropdown :selected").text();
		var slno = $("#txtjposlno").val().trim();
	    var jposubject = $("#txtjposubject").val();
	    var fileName = $("#uploaddocument").val();

	    /* const fi = document.getElementById('uploaddocument');	
	    if (fi.files.length > 0) 
	    	fileItem = fi.files.item(0); */

		
		if(deptid.length <= 0 || deptid == "-1")
			alert("Select department.");
		else if(slno.length <=0)
			alert("Enter JPO Sl No.");
		else if(jposubject.length <=0)
			alert("Enter JPO Subject.");
		else if(fileName.length <= 0)
			alert("Select file to upload.");
		else{
					
			var form = $("#addnewform")[0];
			var data = new FormData(form);
	        data.append("operation", "insertNewJpo");
	        data.append("departmentname", departmentname);

	        			
			$.ajax({
	            type: "POST",
	            enctype: 'multipart/form-data',
	            url: "JpoServlet",
	            data: data,
	            processData: false,
	            contentType: false,
	            cache: false,
	            timeout: 600000,
	            success: function (data) {

	            	var $statusPara = $("#statuspara");
	            	if(data !="-1")
	            	{
	            		$statusPara.text ("New record added succesfully." );
				        $statusPara.css("color", "green");
	            	}
	            	else{
	            		
	            		$statusPara.text ("Error occured. Please try again later....");
						$statusPara.css("color", "red");
	            	}

	            	clearForm();

	            },
	            error: function (e) {

	            	var $statusPara = $("#statuspara");
	            	$statusPara.text ("Error occured. Please try again later....");
					 $statusPara.css("color", "red");
	                console.log("ERROR : ", e);
	                document.getElementById("addnewanrform").reset();
	                clearForm();
	            }
	        }); 			
			
		}

	}
	
	function closeCliked(){
		
		$("#pagedepartment").val("-1").attr("selected","selected");
	    modal.style.display = "none";
	    loadDepartmentWiseJpoData("-1","1");

	}
	
	function pageNumberCliked(departmentid,pageno){

		loadDepartmentWiseJpoData(departmentid,pageno);
	}
	
	function resetClicked(){
		 clearForm();
	}
	
	function clearForm(){
		 $("#departmentdropdown").val("-1").attr("selected","selected");
		 $("#txtjposlno").val("");
		 $("#txtjposubject").val("");
		 $("#uploaddocument").val("");		
	}
	
	function fileValidation(){
		
		const fi = document.getElementById('uploaddocument');
	    // Check if any file is selected.
	    if (fi.files.length > 0) {
	        for (var i = 0; i <= fi.files.length - 1; i++) {
	 
	        	const fileName = fi.files.item(i).name;        
	        	var extension = fileName.split('.').pop();
	        	extension = extension.toLowerCase();
	        	if(extension == "pdf"){	        		
	        		const fsize = fi.files.item(i).size;
	                const file = Math.round((fsize / 1024));
	                // The size of the file.
	                if (file >= 10240) {
	                	fi.value="";
	                    alert("File is too Big, please select a file less than 1mb");
	                    document.getElementById('fileSize').innerHTML = "";
	                } else {
	                   /*  document.getElementById('fileSize').innerHTML = '<b>'
	                    + file + '</b> KB'; */
	                	 document.getElementById('fileSize').innerHTML = "("+file + " KB)";
	                }        		
	        	}
	        	else{
	        		fi.value="";
	        		document.getElementById('fileSize').innerHTML = "";
	        		alert("Only PDF file is supported.");
	        	}
	        }
	    }
	}

	

</script>


</html>