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
<title>GMI</title>
<link rel="icon" href="images/IR_logo.png" type="image/x-icon" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="css/default.css" rel="stylesheet" type="text/css" media="all">
<link href="css/fonts.css" rel="stylesheet" type="text/css" media="all">
<link href="css/gminstruction.css" rel="stylesheet" type="text/css" media="all">

</head>
<body>

<div id="header"></div>

	<div id="mainbody">
		<div id="pagename-wrapper">
			<div id="pagename" class="container">
				<p></p>
				<h3>GM INSTRUCTION LIST</h3>
				<div id="addnewdiv" class="makecenter" >
					 <input id="btnaddnew" type="button" value="ADD NEW" style="display: none;" onclick="addNewClicked()">
				</div>
								
			</div>
		</div>
		
		
		<div id="table-wrapper">
			<div id="table-container" class="container">
				<table id="gmlisttable">
				<thead>
				<tr>
					<th>SL NO.</th>
					<th>INSTRUCTION</th>
					<th>UPLOAD DATE</th>
				</tr>
				</thead>
				<tbody id="gmlisttablebody">
					<tr > <td colspan='3'> </td></tr>
				</tbody>
				<tfoot id="tablefooter">
					<!-- <tr>					
						<td colspan='3'>
							<ul id="footerul">				
							</ul> 
						</td>
					</tr> -->
				</tfoot>
			</table>
			</div>
		</div>
		
		
		<!--MODEL VIEW-->		
		<div id="myModel" class="modal">
				
			<div id="modelcontainer" class="modal-content">		
				<span class="close" onclick="closeCliked()">&times;</span>
				<h2 style="text-align: center;">ADD NEW GM INSTRUCTION</h2>
				
				<form id="addnegmiform" action="#">
				
				<div>
			    	<label for="txtslno">SL No.:</label>
		        	<input id="txtslno" name="txtslno" class="common-input " type="text" placeholder="Enter file name" oninput="this.value = this.value.toUpperCase()" required>  
				</div>
				
				<div>
			    	<label for="txtinstruction">Instruction:</label>
		        	<input id="txtinstruction" name="txtinstruction" class="common-input" type="text" placeholder="Enter file name" oninput="this.value = this.value.toUpperCase()" required>  
				</div>
				
				<div>
	       			<label for="uploaddocument">Select Document:</label>	       			 
			  		<input type="file" id="uploaddocument" name="uploaddocument" class="common-input" onchange="fileValidation()" accept=".pdf" > <span id="fileSize" style="font-size: 16px; font-weight:700;"></span>
				</div>
				<div style="text-align: center;">
			  		<input type="button" value="SUBMIT"  class="flex-items" onclick="submitClicked()">
				</div>
				<div>
			  		 <p id="statuspara"></p> 
				</div>
				</form>			
		</div>
		
		</div>
		
		
	</div>

	<div id="footer"></div>

</body>

<script type="text/javascript">

var modal = document.getElementById("myModel");

window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
        loadAllGmiData("1");
    }
}


	/* $("#header").load("html/header.html"); */
	$("#header").load("header.jsp");
	$("#footer").load("html/footer.html");
	
	$(document).ready(function() {		
		
		loadAllGmiData("1");
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
	
	function addNewClicked(){
		
		  modal.style.display = "block";
	}



	
	function loadAllGmiData(pgno){
		
		$.get("GmiServlet",{operation:"loadAllGmi",pagenumber:pgno},function(response, status) {
			
	        var $gmlisttablebody = $("#gmlisttablebody");
	        $gmlisttablebody.find("tr").remove();     
	        
	        var $anrtablefooter = $("#tablefooter");
	        $anrtablefooter.find("tr").remove();     

	        
	        if($.isEmptyObject(response)){
	        	console.log("Data Not Found" );        	
	        	var tableRow = "<tr  > <td colspan='3' class='noRecord'> No Data Found.</td></tr>";
				$gmlisttablebody.append(tableRow);        	
	        }
	        else{
	        	
	        		        	
            	 const pageSize = <%=globaltablesize%>;
            	 var pageNumber = +pgno; /* Converts string to integer */
	             $.each(response, function(index,item){
	            	 
	            	 if(index == "totalcount" && item >0){
	            		 var pagecount = Math.ceil(item/pageSize);
	            		 console.log("pagecount" + pagecount);
	            		 var footerrow = "<tr>" +
	            		 				"<td colspan='3'>  <ul id='footerul'> <li>Pages:</li>";
	            		 
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
	    					"<td>" + item.slno + "</td>" +
		       				"<td>" + "<a href='ExternalDocument?type=1"+"&name="+item.filename+"' target='_blank'>"+item.instruction +"</a>"+ "</td>" +
		       				"<td>" + item.creationdate + "</td>" +            				
		       				"</tr>";
	       					/* console.log("tableRow = "+tableRow); */
					       $gmlisttablebody.append(tableRow);
					       slno +=1;
	
	            		 })    
	            	 }
	             })
	       	 }        	
	       
	  	  }) 
	}
	
	
	function submitClicked(){
	
		var slno = $("#txtslno").val().trim();
		var inst = $("#txtinstruction").val().trim();
	    var fileName = $("#uploaddocument").val();

		
		if(slno.length <= 0)
			alert("Enter Sl No.");
		else if(inst.length <=0)
			alert("Enter instruction.");
		else if(fileName.length <= 0)
			alert("Select file to upload.");
		else{
					
			var form = $("#addnegmiform")[0];
			var data = new FormData(form);
	        data.append("operation", "insertnewgmi");
	        			
			$.ajax({
	            type: "POST",
	            enctype: 'multipart/form-data',
	            url: "GmiServlet",
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
	                document.getElementById("addnegmiform").reset();
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
	
    modal.style.display = "none";
    loadAllGmiData("1");

}

function pageNumberCliked(pageno){

	loadAllGmiData(pageno);				
}

function clearForm(){
	 $("#txtslno").val("");	
	 $("#txtinstruction").val("");
	 $("#uploaddocument").val("");
}

</script>


</html>