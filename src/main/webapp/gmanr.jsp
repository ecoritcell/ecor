<%@page import="customclasses.AppConfig"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
    int globaltablesize = AppConfig.getTableSize();    
	AppConfig.establishConnection();    
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GMANR</title>
<link rel="icon" href="images/IR_logo.png" type="image/x-icon" />
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="css/default.css" rel="stylesheet" type="text/css"media="all">
<link href="css/fonts.css" rel="stylesheet" type="text/css" media="all">
<link href="css/gmanr.css" rel="stylesheet" type="text/css" media="all">

</head>
<body>

	<div id="header"></div>

	<div id="mainbody">
		<div id="pagename-wrapper">
			<div id="pagename" class="container">
				<h3>GENERAL MANAGER's ANNUAL NARRATIVE REPORT</h3>
			</div>
		</div>


		<div id="form-wrapper" class="container">
		
			<div id="form" >
				<form action="#">
					<div id="formdiv">
						<label id="yearlable" for="years" class="flex-items">Select
							Year</label> 
							<select id="years" name="years" class="flex-items">
								<option value="-1">---Select Year---</option>
						</select>
						<br> 
						<br>
						 <input type="button" value="SUBMIT" class="flex-items" onclick="submitClicked()">
					</div>
				</form>
			</div>
						
			
			<div id="addanrdiv">				
				<input id="btnaddnewanr" name="" type="button" style="display: none;" value="ADD NEW ANR" class="flex-items" onclick="addNewAnrClicked()">
			</div>
		</div>

		<div id="table-wrapper" class="container">
						
			<table id="anrtable">
			<thead>
				<tr>
					<th width="10%">SL NO.</th>
					<th width="80%">FILE NAME</th>
					<th width="10%">UPLOAD DATE</th>
				</tr>
				</thead>
				<tbody id="anrtablebody">
					<tr > <td colspan='3'> <p style="text-align: center;">Loading...</p> </td></tr>
				</tbody>
				
				<tfoot id="anrtablefooter">
					<!-- <tr>					
						<td colspan='3'>
							<ul id="footerul">				
							</ul> 
						</td>
					</tr> -->
				</tfoot>
				
			</table>
		</div>
		
		<!-- <div id="addnewanr-wrapper" class="modal"> -->
		<div id="myModel" class="modal">
				
			<!-- <div id="addnewanrcontainer"  class="wrapper"> -->
			<div id="modelcontainer" class="modal-content">		
				<span class="close" onclick="closeCliked()">&times;</span>
				<h2 style="text-align: center;">ADD NEW GM ANNUAL REPORT</h2>
				
				<form id="addnewanrform" action="#">
				<div id="addnewanr">
					<!-- <p id="selectyearpara" class="flex-items addnewanrpara-flexitem">SELECT YEAR</p> -->
					<label for="addnewanryearselect">Select Year:</label>
					<select id="addnewanryearselect" name="addnewanryearselect" class="common-input addnewanr-flexitem">					
						<option value="2024-2025">2024-2025</option>
						<option value="2023-2024">2023-2024</option>
						<option value="2022-2023">2022-2023</option>
						<option value="2021-2022">2021-2022</option>
					</select>
				</div>
				
				<div id="addnewanr">
					<!-- <p id="filenamepara" class="flex-items addnewanrpara-flexitem">SUBJECT</p> -->
			    	<label for="txtfilename">Subject:</label>
		        	<input id="txtfilename" name="txtfilename" class="common-input addnewanr-flexitem" type="text" placeholder="Enter file name" oninput="this.value = this.value.toUpperCase()" required>  
				</div>
				
				<div id="addnewanr">
	       			<!-- <p id="uploaddocumentpara" class="flex-items addnewanrpara-flexitem">UPLOAD DOCUMENT</p> -->
	       			<label for="txtfilename">Select Document:</label>	       			 
			  		<input type="file" id="uploaddocument" name="uploaddocument" class="common-input addnewanr-flexitem" onchange="fileValidation()" accept=".pdf" > <span id="fileSize" style="font-size: 16px; font-weight:700;"></span>
				</div>
				<div id="addnewanr" style="text-align: center;">
			  		<input type="button" value="SUBMIT"  class="flex-items" onclick="submitNewAnrClicked()" >
				</div>
				<div id="addnewanr">
			  		 <p id="statuspara"></p> 
				</div>
				</form>			
		</div>
		
		</div>
		
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div id="footer"></div>

</body>

<script type="text/javascript">
	
var modal = document.getElementById("myModel");
/* $("#header").load("html/header.html"); */
$("#header").load("header.jsp");
$("#footer").load("html/footer.html");


 window.onclick = function(event) {
     if (event.target == modal) {
         modal.style.display = "none";
         loadYearsData("-1","1");
         loadDistinctYearFromDB();
     }
 }

 
 document.addEventListener("visibilitychange", function() {
	  if (document.visibilityState === "visible") {
	    location.reload(); // Reloads the page when user switches back to this tab
	  }
	});
 
	$(document).ready(function() {		
		
		loadYearsData("-1","1");
		loadDistinctYearFromDB();
		showHideAddNewAnr();
	})

	function showHideAddNewAnr(){

		var btnnewanr = document.getElementById("btnaddnewanr");
		var uname = '<%=session.getAttribute("userName")%>';
		var module = '<%=session.getAttribute("module")%>';
		if(uname !='null' && module == "ANR"){			
			btnnewanr.style.display = "block";
		}
		else{
			btnnewanr.style.display = "none";
		}
		
	}
	
	function loadDistinctYearFromDB(){
		
		console.log("loadDistinctYearFromDB Called" );        	

		$.get("AnrServlet",{operation:"getDistinctYear"},function(response, status) {
			
			console.log("response " + response);
			if( !jQuery.isEmptyObject(response)){			
				$("#years option[value != -1]").remove();
		        var $select = $("#years");
		        var firstYear = "";
		        var count = 0;
		        $.each(response, function(index,value){
		        	
		        	count +=1;
		        	if(count == 1){
		        		firstYear = value;
		        	}
		        	
		        	if(count == 1)
		        		$("<option selected='selected'>").val(value).text(value).appendTo($select);
		        	else
		        		$("<option>").val(value).text(value).appendTo($select);
		        })
		        
		        /* if(firstYear.length > 0){
		        	loadYearsData(firstYear,"1");
		        } */
			}
			else{
				console.log("No year data found.");
			}
  	  }) 
		
	}
	
	
	function loadYearsData(fYear,pgno){
		
    	console.log("fYear "+fYear );    
    	console.log("pgno "+pgno );    
    	if(fYear.length > 0){
    		
    		$.get("AnrServlet",{operation:"loadYearsData",pagenumber:pgno,fyear:fYear},function(response, status) {
    			
    			anrtablefooter
    	        var $anrtablebody = $("#anrtablebody");
    	        $anrtablebody.find("tr").remove();        
    	        
    	        var $anrtablefooter = $("#anrtablefooter");
    	        $anrtablefooter.find("tr").remove();     
    	        
    	        if($.isEmptyObject(response)){
    	        	console.log("Data Not Found" );        	
    	        	var tableRow = "<tr  > <td colspan='3' class='noRecord'> No Data Found.</td></tr>";
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
    	            		 				"<td colspan='3'>  <ul id='footerul'> <li>Pages:</li>";
    	            		 
    	            		 if(pagecount>1){
    	            			 
        	            		 for (var i = 1; i <= pagecount; i++) {
     								
        	            			 var temp ="";
        	            			 if(i == pageNumber)
        	            				 temp = "<li> <a class='selectedPgae'>"+i+" </a></li>";
        	            			else
        	            				temp = "<li> <a  onclick='pageNumberCliked(\""+fYear+"\", \""+i+"\")' style='cursor: pointer;' >"+i+" </a></li>";
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
            					"<td>" + slno + "</td>" +
	               				"<td>" + "<a href='ExternalDocument?type=1"+"&name="+item.fileName+"' target='_blank'>"+item.fileSubject +"</a>"+ "</td>" +
	               				"<td>" + item.creationDate + "</td>" +            				
	               				"</tr>";
					               /* console.log("tableRow = "+tableRow); */
					               $anrtablebody.append(tableRow);
					               slno +=1;
    	            		 })    	            	 
    	            	}
    	            	 
    	            	 
    	             })
    	       	 }        	
    	       
    	  	  })  
    	}else{
    		
    		console.log("No year data selected"); 
    	}
	}

	function submitClicked() {

		var fYear = $("#years").val();
		if(fYear.length >0 && fYear == "-1"){
			alert("Select Year.");			
		}
		else if(fYear.length >0 && fYear != "-1"){
			loadYearsData(fYear,"1");
		}			
	}
	
	function addNewAnrClicked(){
	
		  modal.style.display = "block";
	}
	
	
	
	function submitNewAnrClicked(){
	
		var selectedYear = $("#addnewanryearselect").val();
		var subject = $("#txtfilename").val().trim();
	    var fileName = $("#uploaddocument").val();

	    /* const fi = document.getElementById('uploaddocument');	
	    if (fi.files.length > 0) 
	    	fileItem = fi.files.item(0); */

		
		if(selectedYear.length <= 0)
			alert("Select year.");
		else if(subject.length <=0)
			alert("Enter file name.");
		else if(fileName.length <= 0)
			alert("Select file to upload.");
		else{
					
			var form = $("#addnewanrform")[0];
			var data = new FormData(form);
	        data.append("operation", "insertnewanr");
	        			
			$.ajax({
	            type: "POST",
	            enctype: 'multipart/form-data',
	            url: "AnrServlet",
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
		
	    modal.style.display = "none";
	    loadDistinctYearFromDB();

	}
	
	function clearForm(){
		 $("#addnewanryearselect").val("2024-2025").attr("selected","selected");
		 $("#txtfilename").val("");	
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
	                if (file >= 20480) {
	                	fi.value="";
	                    alert("File is too Big, please select a file less than 20mb");
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

	function pageNumberCliked(fyear,pageno){

		loadYearsData(fyear,pageno);				
	}
	

</script>


</html>