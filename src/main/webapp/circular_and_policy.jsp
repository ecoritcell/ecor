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
<title>Circulars and Policy</title>
<link rel="icon" href="images/IR_logo.png" type="image/x-icon" />
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="css/default.css" rel="stylesheet" type="text/css"media="all">
<link href="css/fonts.css" rel="stylesheet" type="text/css" media="all">
<link href="css/circular_policy.css" rel="stylesheet" type="text/css" media="all">

</head>
<body>

	<div id="header"></div>

	<div id="mainbody">
		<div id="pagename-wrapper">
			<div id="pagename" class="container">
				<h3>CIRCULARS AND POLICY LETTERS</h3>
			</div>
		</div>


		<div id="form-wrapper" class="container">
		
			<div id="form" >
				<form action="#">
					<div id="formdiv">
						<label id="category-lable" for="category" class="flex-items">Select Category</label> 
							<select id="category" name="category" class="flex-items" style="text-align: center;">
								<option value="-1"> --- All --- </option>
						</select>
						<br> 
						<br>
						 <input type="button" value="GO" class="flex-items" style="width: 80px;" onclick="goClicked()">
					</div>
				</form>
			</div>
			
			<div id="addanrdiv">				
				<input id="btnaddnew" type="button" value="ADD NEW CIRCULARS" class="flex-items" onclick="addNewCircularClicked()">
			</div>
		</div>

		<div id="table-wrapper" class="container">
			<table id="anrtable">
				<thead>
					<tr>
					<th>SL NO.</th>
					<th>DATE</th>
					<th>CATEGORY</th>
					<th>LETTER NO.</th>
					<th>LETTER SUBJECT</th>					
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
				<h2 style="text-align: center; margin-bottom: 0px;">ADD NEW CIRCULARS AND POLICY LETTER</h2>
				<hr>
				<p id="" style="color: red; margin: 0px; padding-left: 10px;"><b>*All fields are mandatory.</b></p> 
			<!-- 	<hr>
				 -->
				
				<form id="addnewform" action="#">				
				<table id="formtable">
				<!--  <colgroup>
			       <col span="1" style="width: 50%;">
			       <col span="1" style="width: 50%;">
			    </colgroup> -->
					<tr>
						<td style="width: 50%;">
							<div>
					    	<label for="categorydropdown">Select Category:</label>
					    	<select id="categorydropdown" name="categorydropdown" class="common-input">
					    		<option value="-1">--Select Category--</option>					
							</select>					    	
							</div>
						</td>
						
						<td style="width: 10%">
							<div>
						    	<label for="txt-ltr-date">Letter Date:</label>
					        	<input id="txt-ltr-date" name="txt-ltr-date" class="common-input" type="date" required>  
							</div>
						</td>
						
						<td style="width: 40%">
							<div>
						    	<label for="txt-ltr-no">Letter No:</label>
					        	<input id="txt-ltr-no" name="txt-ltr-no" class="common-input" type="text" placeholder="Enter letter no." required>  
							</div>
						</td>
					</tr>
					
										
					<tr>
						<td colspan="3">
							<div>
						    	<label for="txt-ltr-subject">Subject:</label>
					        	<input id="txt-ltr-subject" name="txt-ltr-subject" class="common-input" type="text" placeholder="Enter subject." required>  
							</div>
						</td>											
					</tr>
					
					<tr >
						<td colspan="3">
								<div>
	       							<label for="uploaddocument">Select Document: <span id="fileSize" style="font-size: 12px; color: #aaa;"></span> </label>	       			 
			  						<input type="file" id="uploaddocument" name="uploaddocument" class="common-input" onchange="fileValidation()" accept=".pdf" > 
								</div>
						</td>
					</tr>
					
					<tr>
						<td colspan="3">
							<br>
							<div style="text-align: center; display: flex; justify-content: center;" >
			  					<input type="button" value="SUBMIT"  class="" style="margin-right: 10px;" onclick="submitClicked()">
			  					<input type="button" value="RESET"  class="" style="margin-left: 10px;" onclick="resetClicked()">
							</div>
						</td>
					</tr>

					<tr>
						<td colspan="3">
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
var selected_cat_id = "-1";
var current_page_no = "1";
var category_values = {};
var modal = document.getElementById("myModel");



 window.onclick = function(event) {
     if (event.target == modal) {
    	 /* $("#pagedepartment").val("-1").attr("selected","selected"); */
         modal.style.display = "none";
         loadCategoryWiseCirculars();
     }
 }
 
  document.addEventListener("visibilitychange", function() {
	  if (document.visibilityState === "visible") {
	    location.reload(); // Reloads the page when user switches back to this tab
	  }
	}); 
 
 $(document).ready(function() {		

	 	showHideAddNewBtn();	 	
		loadCategoryWiseCirculars();
		loadAllCategory();
		 
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
	
	function loadCategoryWiseCirculars(){
		
    	console.log("category_id =  "+selected_cat_id );  
    	
    	$.get("CircularsServlet",{operation:"getCircularsByCategory",category_id:selected_cat_id,pagenumber:current_page_no},function(response, status) {
			
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
          		 var pageNumber = +current_page_no; /* Converts string to integer */
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
   		           		
   		           		 console.log("item.length =" + item.length);
   		           		 if(item.length == 0){
   		           			 
	   		           			var tableRow = "<tr  > <td colspan='5' class='noRecord'> No Data Found.</td></tr>";
		    					$anrtablebody.append(tableRow); 

   		           		 }
   		           		 else{
    				
   		        	   	// Define the desired width of your popup
   		           		let popupWidth = 800; 

   		           		// Calculate the horizontal center position
   		           		let left = (screen.width / 2) - (popupWidth / 2);

   		           		// Use screen.availHeight to get the full height excluding taskbars
   		           		let height = screen.availHeight;
   		           		
		           		 var slno  = (pageNumber*pageSize) - (pageSize - 1);			           		 
	    	             $.each(item, function(index,item){        			    	             		
	    	              var tableRow = "<tr>" +
	    	              					"<td>" + slno + "</td>" +
	    	                 				"<td>" + item.letter_date + "</td>" +
	    	                 				"<td>" + item.category_name + "</td>" +
	    	                 				"<td>" + item.letter_no + "</td>" +
	    	                 				"<td>" + "<a href='ExternalDocument?type=1"+"&name="+item.file_name+"'"+
	    	                 				 "onclick=\"window.open(this.href, 'targetWindow', 'toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,top=0,left="+left+",width="+popupWidth+",height="+height+"'); return false;\">"+item.letter_subject +"</a>"+ "</td>" +
	    	                 				"</tr>";
	    	                 $anrtablebody.append(tableRow);
	    	                 slno +=1;
	    	             })
   		           		 }
   		           	}
          	 	})
	       	 }        	
	       
	  	  });
	}
	
function loadAllCategory(){
		
		console.log("loadAllCategory Called" );        	
		$("#category option[value != -1]").remove();		
		$.get("CircularsServlet",{operation:"getAllCategory"},function(response, status) {
			
			console.log("response " + response);
			if( !jQuery.isEmptyObject(response)){			
		        var $select = $("#category");
		        category_values = response;
		        $.each(response, function(key,value){
		        	
		        	console.log("key = " +key);
		        	let $optgroup = $("<optgroup class = 'optgroup-design'>").attr("label", key);
		        	$.each(value, function(index,obj){

		        		$("<option class = 'select-design'>").val(obj.cat_id).text(obj.sub_category).appendTo($optgroup);
		        	});
		        	
		        	$select.append($optgroup);
		        });
			}
			else{
				category_values= {};
				console.log("No category data found.");
			}
  	  }) 		
}

function renderCategoryDropdown(){
	
	$("#statuspara").text("");
	$("#categorydropdown").find("optgroup, option[value != -1]").remove();
	if( !jQuery.isEmptyObject(category_values)){
		
		var $select = $("#categorydropdown");
	    $.each(category_values, function(key,value){
	    	
	    	console.log("key = " +key);
	    	let $optgroup = $("<optgroup class = 'optgroup-design'>").attr("label", key);
	    	$.each(value, function(index,obj){

	    		$("<option class = 'select-design'>").val(obj.cat_id).text(obj.sub_category).appendTo($optgroup);
	    	});
	    	
	    	$select.append($optgroup);
	    });
	}
}


	function goClicked() {

		let cat_id = $("#category").val();
		console.log("cat_id = " +cat_id);
		if (cat_id != null && cat_id.length > 0 && selected_cat_id != cat_id) {
			selected_cat_id = cat_id;
			current_page_no = "1";
			loadCategoryWiseCirculars();
		}
	}

	function addNewCircularClicked() {

		modal.style.display = "block";
		renderCategoryDropdown();
	}

	function submitClicked() {

		let cat_id = $("#categorydropdown").val();
		let ltr_date = $("#txt-ltr-date").val();
		let ltr_no = $("#txt-ltr-no").val().trim();
		let ltr_subject = $("#txt-ltr-subject").val().trim();
		var fileName = $("#uploaddocument").val();	

		
		if (cat_id.length <= 0 || cat_id == "-1")
			alert("Select category.");
		else if (ltr_date.length <= 0)
			alert("Select letter date.");
		else if (ltr_no.length <= 0)
			alert("Enter letter No.");
		else if (ltr_subject.length <= 0)
			alert("Enter letter subject.");
		else if(fileName.length <= 0)
			alert("Select letter.");
		else {

			var form = $("#addnewform")[0];
			var data = new FormData(form);
			data.append("operation", "insertNewCircular");
			
			$.ajax({
						type : "POST",
						enctype : 'multipart/form-data',
						url : "CircularsServlet",
						data : data,
						processData : false,
						contentType : false,
						cache : false,
						timeout : 600000,
						success : function(data) {

							var $statusPara = $("#statuspara");
							if (data != "-1") {
								$statusPara
										.text("New record added succesfully.");
								$statusPara.css("color", "green");
							} else {

								$statusPara
										.text("Error occured. Please try again later....");
								$statusPara.css("color", "red");
							}

							clearForm();

						},
						error : function(e) {

							var $statusPara = $("#statuspara");
							$statusPara
									.text("Error occured. Please try again later....");
							$statusPara.css("color", "red");
							console.log("ERROR : ", e);
							document.getElementById("addnewanrform").reset();
							clearForm();
						}
					});

		}

	}

	function closeCliked() {

		/* $("#pagedepartment").val("-1").attr("selected", "selected"); */
		modal.style.display = "none";
		loadCategoryWiseCirculars();

	}

	function pageNumberCliked(pageno) {

		console.log("pageno = " +pageno);
		current_page_no = pageno;
		loadCategoryWiseCirculars();
	}

	function resetClicked() {
		clearForm();
	}

	function clearForm() {
		$("#addnewform")[0].reset();		
	}

	function fileValidation() {

		const fi = document.getElementById('uploaddocument');
		// Check if any file is selected.
		if (fi.files.length > 0) {
			for (var i = 0; i <= fi.files.length - 1; i++) {

				const fileName = fi.files.item(i).name;
				var extension = fileName.split('.').pop();
				extension = extension.toLowerCase();
				if (extension == "pdf") {
					const fsize = fi.files.item(i).size;
					const file = Math.round((fsize / 1024));
					// The size of the file.
					if (file >= 10240) {
						fi.value = "";
						alert("File is too Big, please select a file less than 1mb");
						document.getElementById('fileSize').innerHTML = "";
					} else {
						/*  document.getElementById('fileSize').innerHTML = '<b>'
						 + file + '</b> KB'; */
						document.getElementById('fileSize').innerHTML = "("
								+ file + " KB)";
					}
				} else {
					fi.value = "";
					document.getElementById('fileSize').innerHTML = "";
					alert("Only PDF file is supported.");
				}
			}
		}
	}
</script>


</html>