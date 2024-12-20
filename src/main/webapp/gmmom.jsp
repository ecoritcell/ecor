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
<title>MOM</title>
<link rel="icon" href="images/IR_logo.png" type="image/x-icon" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="css/default.css" rel="stylesheet" type="text/css" media="all">
<link href="css/fonts.css" rel="stylesheet" type="text/css" media="all">
<link href="css/gmmom.css" rel="stylesheet" type="text/css" media="all">

</head>
<body>

<div id="header"></div>

	<div id="mainbody">
		<div id="pagename-wrapper">
			<div id="pagename" class="container">
				<p></p>
				<h3>MINUTES OF MEETING</h3>
				<div class="makecenter">
					 <input id="btnaddnew" type="button" value="ADD NEW"  onclick="addNewClicked()">
				</div>
								
			</div>
		</div>
		
		
		<div id="table-wrapper">
			<div id="table-container" class="container">
				<table id="gmlisttable">
				<thead>
					<tr>
						<th>GM MoM NO.</th>
						<th>Minutes Of Meeting With</th>
						<th>Meeting Date</th>
						<th>Meeting Details</th>
						<th>Compliances</th>
						<th>Upload Date</th>
					</tr>
				</thead>
				
				<tbody id="momlisttablebody">
					<tr > <td colspan='6'> <p style="text-align: center;">Loading...</p> </td></tr>
				</tbody>
				
				<tfoot id="tablefooter">
				</tfoot>
			</table>
			</div>
		</div>
		
		
		<!--MODEL VIEW-->		
		<div id="myModel" class="modal">
				
			<div id="modelcontainer" class="modal-content">		
				<span class="close" onclick="closeCliked()">&times;</span>
				<h2 style="text-align: center; margin-bottom: 0px;">ADD NEW MINUTES OF MEETING</h2>
				<hr>
				<p id="" style="color: red; margin: 0px; padding-left: 10px;"><b>*All fields are mandatory.</b></p> 
				<hr>
				
				
				<form id="addnewmomform" action="#">				
				<table id="formtable">
				 <colgroup>
			       <col span="1" style="width: 50%;">
			       <col span="1" style="width: 50%;">
			    </colgroup>
					<tr>
						<td>
							<div>
					    	<label for="txtmomno">GM MoM No.:</label>
				        	<input id="txtmomno" name="txtmomno" class="common-input " type="text" placeholder="Enter file name" oninput="this.value = this.value.toUpperCase()" required>  
							</div>
						</td>
						
						<td>
							<div>
						    	<label for="txtmomwith">Minutes Of Meeting With:</label>
					        	<input id="txtmomwith" name="txtmomwith" class="common-input" type="text" placeholder="Enter file name" oninput="this.value = this.value.toUpperCase()" required>  
							</div>
						</td>
											
					</tr>
					
					
					<tr>
						<td>
							<div>
						    	<label for="txtmomdate">Meeting Date:</label>
					        	<input id="txtmomdate" name="txtmomdate" class="common-input" type="date" placeholder="Enter file name" oninput="this.value = this.value.toUpperCase()" required>  
							</div>
						</td>
						
						<td>
							<div>
						    	<label for="txtmomdetail">Meeting Details:</label>
					        	<input id="txtmomdetail" name="txtmomdetail" class="common-input" type="text" placeholder="Enter file name" oninput="this.value = this.value.toUpperCase()" required>  
							</div>
						</td>
											
					</tr>
					
					
					<tr>
						<td>
							<div>
						    	<label for="txtmomcomplainces">Compliances:</label>
					        	<input id="txtmomcomplainces" name="txtmomcomplainces" class="common-input" type="text" placeholder="Enter file name" oninput="this.value = this.value.toUpperCase()" required>  
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
    	clearForm();
        modal.style.display = "none";
        loadAllMomData("1");
    }
}

function addNewClicked(){
	
	  modal.style.display = "block";
}


	$(document).ready(function() {		
		
		loadAllMomData("1");
		showHideAddNewBtn();
	})

	function showHideAddNewBtn(){

		var btnaddnew = document.getElementById("btnaddnew");
		var uname = '<%=session.getAttribute("userName")%>';
		if(uname !='null'){			
			btnaddnew.style.display = "block";
		}
		else{
			btnaddnew.style.display = "none";
		}
		
	}
	
	function loadAllMomData(pgno){
		
		$.get("MomServlet",{operation:"loadAllMom",pagenumber:pgno},function(response, status) {
			
	        var $momlisttablebody = $("#momlisttablebody");
	        $momlisttablebody.find("tr").remove();        
	        
	        var $anrtablefooter = $("#tablefooter");
	        $anrtablefooter.find("tr").remove();   
	        
	        if($.isEmptyObject(response)){
	        	console.log("Data Not Found" );        	
	        	var tableRow = "<tr  > <td colspan='6' class='noRecord'> No Data Found.</td></tr>";
				$momlisttablebody.append(tableRow);        	
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
		            				temp = "<li> <a  onclick='pageNumberCliked(\""+i+"\")' style='cursor: pointer;' >"+i+" </a></li>";
		            			 footerrow += temp;
							}
		            		 
		            		 footerrow = footerrow + "</ul> </td> </tr>";
		            		 $anrtablefooter.append(footerrow);
	
	            		 }    	            		 					
	            	 }    	            	 
	            	 else if(index == "values"){ 
	            		 
	            		 var slno  = (pageNumber*pageSize) - (pageSize - 1);
	    	             $.each(item, function(index,item){        	
	    	              var tableRow = "<tr>" +
	    	              					"<td>" + item.momno + "</td>" +
	    	              					"<td>" + item.momwith + "</td>" +
	    	              					"<td>" + item.momdate + "</td>" +
	    	                 				"<td>" + "<a href='ExternalDocument?type=1"+"&name="+item.momfilename+"' target='_blank'>"+item.momdetail +"</a>"+ "</td>" +
	    	              					"<td>" + item.momcompliances + "</td>" +
	    	                 				"<td>" + item.creationdate + "</td>" +            				
	    	                 				"</tr>";
	    	                 $momlisttablebody.append(tableRow);
	    	                 slno +=1;	            	       			        	
		             		})
	            	 }	
            	 })
            	  
	       	 }        	
	       
	  	  }) 
	}
	
	
	function submitClicked(){
	
    	var $statusPara = $("#statuspara");
    	$statusPara.text("");

		var momno = $("#txtmomno").val().trim();
		var momwith = $("#txtmomwith").val().trim();
	    var momdate = $("#txtmomdate").val().trim();
	    var momdetail = $("#txtmomdetail").val().trim();
	    var momcompliances = $("#txtmomcomplainces").val().trim();
	    var fileName = $("#uploaddocument").val();

		
		if(momno.length <= 0)
			alert("Enter MOM No.");
		else if(momwith.length <=0)
			alert("Enter MOM With.");
		else if(momdate.length <= 0)
			alert("Select MOM Date.");
		else if(momdetail.length <= 0)
			alert("Select MOM Detail.");
		else if(momcompliances.length <= 0)
			alert("Select MOM Compliances.");
		else if(fileName.length <= 0)
			alert("Select File.");
		else{
					
			var form = $("#addnewmomform")[0];
			var data = new FormData(form);
	        data.append("operation", "insertnewmom");
	        			
			$.ajax({
	            type: "POST",
	            enctype: 'multipart/form-data',
	            url: "MomServlet",
	            data: data,
	            processData: false,
	            contentType: false,
	            cache: false,
	            timeout: 600000,
	            success: function (data) {

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

	            	$statusPara.text ("Error occured. Please try again later....");
					 $statusPara.css("color", "red");
	                console.log("ERROR : ", e);
	                document.getElementById("addnewmomform").reset();
	                clearForm();
	            }
	        }); 			
			
		}

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
	
	
function closeCliked(){
	
	clearForm();
    modal.style.display = "none";
    loadAllMomData("1");

}

function pageNumberCliked(pageno){

	loadAllMomData(pageno);				
}

function resetClicked(){
	clearForm();
}

function clearForm(){
	 $("#txtmomno").val("");	
	 $("#txtmomwith").val("");
	 $("#txtmomdate").val("");
	 $("#txtmomdetail").val("");
	 $("#txtmomcomplainces").val("");
	 $("#uploaddocument").val("");
}


</script>


</html>