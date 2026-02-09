<%@page import="customclasses.AppConfig"%>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% 
 int globaltablesize = AppConfig.getTableSize();    

boolean isLoggedIn = false;
String servletPath = request.getServletPath();
String pageName = servletPath.substring(servletPath.lastIndexOf("/") + 1);
String username=(String)session.getAttribute("userName")==null?"":(String)session.getAttribute("userName");
Set<String> page_access =  (HashSet<String>)session.getAttribute("page_access");
if( (username !=null && username.length()>0) && page_access.contains(pageName))
	isLoggedIn = true;
else
	isLoggedIn = false;
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
<link href="css/rdso_policy_and_letter.css" rel="stylesheet" type="text/css" media="all">

</head>
<body>

	<div id="header"></div>

	<div id="mainbody">
		<div id="pagename-wrapper">
			<div id="pagename" class="container">
				<h3>RDSO POLICY LETTERS</h3>
			</div>
		</div>


		<div id="form-wrapper" class="container">
		
			<div id="form" >
				<form action="#">
					<div id="formdiv">
						<label id="category-lable" for="category" class="flex-items">Select Category</label> 
							<select id="category" name="category" class="flex-items select-design" style="text-align: center;">
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
					
					<% if(isLoggedIn) {%>
					<th>EDIT</th>
					<th>DELETE</th>
					<% }%>
				</tr>
				</thead>
				
				<tbody id="anrtablebody">
					<tr > <td colspan='5'> </td></tr>
				</tbody>
				
				<tfoot id="tablefooter">
				</tfoot>
				
			</table>
			<br>
			<br>
			<br>		
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
						<td hidden="true">
					        <input id="txt-record-id" name="txt-record-id" class="common-input" type="text" hidden="true">
					        <input id="txt-category-group" name="txt-category-group" class="common-input" type="text" hidden="true" value="RDSO">  
					        <input id="existing-file-name" name="existing-file-name" class="common-input" type="text" hidden="true">
						</td>
						
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
										
					<tr >
						<td colspan="3">
								<div id="div-existing-file"></div>
						</td>
					</tr>
					
					<tr>
						<td colspan="3">
							<br>
							<div  style="text-align: center; display: flex; justify-content: center;"  hidden="true">
			  					<input id="btn-submit" type="button" value="SUBMIT"  class="" style="margin-right: 10px; display: none;" onclick="submitClicked()" >
			  					<input id="btn-reset" type="button" value="RESET"  class="" style="margin-left: 10px; display: none;" onclick="resetClicked()">
			  					<input id="btn-update" type="button" value="UPDATE"  class="" style="margin-right: 10px; display: none;" onclick="updateClicked()">
			  								  								  			
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

// Define the desired width of your popup
let popupWidth = 800; 

// Calculate the horizontal center position
let left = (screen.width / 2) - (popupWidth / 2);

// Use screen.availHeight to get the full height excluding taskbars
let height = screen.availHeight;


 window.onclick = function(event) {
     if (event.target == modal) {
    	 /* $("#pagedepartment").val("-1").attr("selected","selected"); */
         modal.style.display = "none";
         loadCategoryWiseCirculars();
     }
 }
 
 window.addEventListener("storage", function(e) {
	 
	    if (e.key === "LOGOUT_EVENT" || e.key === "LOGIN_EVENT") {	    	
	    	 window.location.reload();	        

	    }
	});
 
 
 $(document).ready(function() {		

	 	showHideAddNewBtn();	 	
		loadCategoryWiseCirculars();
		loadAllCategory();
		 
})

	function checkUserAccess(){
		 
		let path = document.location.pathname;
		let page = path.split("/").pop();
		var uname = '<%=session.getAttribute("userName")%>';
		let page_access = '<%=session.getAttribute("page_access")%>';
		if(uname !=null && page_access !=null && page_access.includes(page)){		
			return true;
		}
		else{
			return false
		}
		
	 }
 
	function showHideAddNewBtn(){

		var btnaddnew = document.getElementById("btnaddnew");
		if(checkUserAccess()){		
			btnaddnew.style.display = "block";
		}
		else{
			
			btnaddnew.style.display = "none";
		}
	}
	
	function loadCategoryWiseCirculars(){
		
    	console.log("category_id =  "+selected_cat_id );  
    	
    	$.get("CircularsServlet",{operation:"getCircularsByCategory",category_group:'RDSO',category_id:selected_cat_id,pagenumber:current_page_no},function(response, status) {
			
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
   		           		 console.log("pagecount = " + pagecount);
   		           		 var footerrow = "<tr>" +
   		           		 				"<td colspan='6'>  <ul id='footerul'> <li>Pages:</li>";
   		           		 
   		           		 if(pagecount>1){   		           			 
	   			           for (var i = 1; i <= pagecount; i++) {
	   									
	   			             let temp ="";
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
   		           			 
	   		           			var tableRow = ""; 
	   		           				
	   		           			 if(<%=isLoggedIn %>){
	   		           				tableRow = "<tr  > <td colspan='7' class='noRecord'> No Data Found.</td></tr>"; 
	   		           			 }else{
	   		           			tableRow = "<tr  > <td colspan='5' class='noRecord'> No Data Found.</td></tr>";
	   		           			 }
	   		           				
		    					$anrtablebody.append(tableRow); 

   		           		 }
   		           		 else{
    				
   		           		
		           		 var slno  = (pageNumber*pageSize) - (pageSize - 1);			           		 
	    	             $.each(item, function(index,item){        			    	             		
	    	              var tableRow =  "<tr>" +
        					"<td>" + slno + "</td>" +
             				"<td class = 'no-wrap'>" + item.formatted_date + "</td>" +
             				"<td>" + item.category_name + "</td>" +
             				"<td>" + item.letter_no + "</td>" +
             				"<td>" + "<a href='ExternalDocument?type=1"+"&name="+item.file_name+"'"+
             				 "onclick=\"window.open(this.href, 'targetWindow', 'toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,top=0,left="+left+",width="+popupWidth+",height="+height+"'); return false;\">"+item.letter_subject +"</a>"+
             				 "</td>";
	    	              
             				 if(<%=isLoggedIn %>){
             					 tableRow = tableRow + "<td>" +
             			        "<span onclick = editSpanCliked(this) title='Edit' style='cursor:pointer;' class='edit-btn' " +
             			        " data-id='" + item.record_id + "'" +
             			        " data-date='" + item.letter_date + "'" +
             			        " data-category='" + item.category_id + "'" +
             			        " data-letterno=\"" + encodeURIComponent(item.letter_no) + "\"" +
             			        " data-subject=\"" + encodeURIComponent(item.letter_subject) + "\"" +
             			        " data-file='" + item.file_name + "'" +
             			        ">✏️</span>" +
             			        "</td>" +
	                 			"<td><a onclick='deleteClicked("+item.record_id+")'> <span title='Delete' style='cursor:pointer; margin-left:10px;'>🗑️</span> </a></td>";
	    	             	 }
             				
             				 tableRow = tableRow +  "</tr>";
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
		$.get("CircularsServlet",{operation:"getRDSOCategory"},function(response, status) {
			
			console.log("response " + response);
			if( !jQuery.isEmptyObject(response)){			
		        var $select = $("#category");
		        category_values = response;
		        $.each(response, function(key,value){
		        	
		        	console.log("key = " +key);
		        	/* let $optgroup = $("<optgroup class = 'optgroup-design'>").attr("label", key); */
		        	$.each(value, function(index,obj){

		        		$("<option class = 'select-design'>").val(obj.cat_id).text(obj.sub_category).appendTo($select);
		        	});
		        	
		        	/* $select.append($optgroup); */
		        	
		        	renderCategoryDropdown();
		        });
			}
			else{
				category_values= {};
				console.log("No category data found.");
			}
  	  }) 		
}

function renderCategoryDropdown(){
	
	$("#categorydropdown").find("optgroup, option[value != -1]").remove();
	if( !jQuery.isEmptyObject(category_values)){
		
		var $select = $("#categorydropdown");
	    $.each(category_values, function(key,value){
	    	
	    	console.log("key = " +key);
	    	/* let $optgroup = $("<optgroup class = 'optgroup-design'>").attr("label", key); */
	    	$.each(value, function(index,obj){

	    		$("<option class = 'select-design'>").val(obj.cat_id).text(obj.sub_category).appendTo($select);
	    	});
	    	
	    	/* $select.append($optgroup); */
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

		$("#statuspara").text("");
		$("#txt-record-id").val("");
		$("#existing-file-name").val("");
		$("#categorydropdown").val("-1");
		$("#txt-ltr-date").val("");
		$("#txt-ltr-no").val("");
		$("#txt-ltr-subject").val("");
		$("#uploaddocument").val("");
		$("#div-existing-file").html("");
		
		$("#btn-submit").css("display","block");
		$("#btn-reset").css("display","block");
		$("#btn-update").css("display","none");

				
		modal.style.display = "block";
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
							$statusPara.text("Error occured. Please try again later....");
							$statusPara.css("color", "red");
							console.log("ERROR : ", e);
							document.getElementById("addnewanrform").reset();
							clearForm();
						}
					});

		}

	}
	
	function updateClicked(){
		
		let record_id = $("#txt-record-id").val();
		let cat_id = $("#categorydropdown").val();
		let ltr_date = $("#txt-ltr-date").val();
		let ltr_no = $("#txt-ltr-no").val().trim();
		let ltr_subject = $("#txt-ltr-subject").val().trim();
		var fileName = $("#uploaddocument").val();	


		if(record_id != null && (record_id.length <= 0 || record_id == "-1"))
			alert("Something went wrong please try later.");
		else if (cat_id.length <= 0 || cat_id == "-1")
			alert("Select category.");
		else if (ltr_date.length <= 0)
			alert("Select letter date.");
		else if (ltr_no.length <= 0)
			alert("Enter letter No.");
		else if (ltr_subject.length <= 0)
			alert("Enter letter subject.");		
		else {

			var form = $("#addnewform")[0];
			var data = new FormData(form);
			data.append("operation", "updateCircular");
			
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
								alert("Data updated succesfully.");								
								closeCliked();
							} else {
								$statusPara.text("Error occured. Please try again later....");
								$statusPara.css("color", "red");
							}
						},
						error : function(e) {

							var $statusPara = $("#statuspara");
							$statusPara.text("Error occured. Please try again later....");
							$statusPara.css("color", "red");
							console.log("ERROR : ", e);
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
	
	function editClicked(record_id,letter_date,category_id,letter_no,letter_subject,file_name){
		
		$("#statuspara").text("");
		$("#txt-record-id").val(record_id);
		$("#existing-file-name").val(file_name);
		$("#uploaddocument").val("");
		$("#categorydropdown").val(category_id);
		$("#txt-ltr-date").val(letter_date);
		$("#txt-ltr-no").val(letter_no);
		$("#txt-ltr-subject").val(letter_subject);
		$("#btn-submit").css("display","none");
		$("#btn-reset").css("display","none");
		$("#btn-update").css("display","block");
		
		let file_html = "<label>Existing File: </label>"
			file_html += "<a href='ExternalDocument?type=1"+"&name="+file_name+"'"+
			 "onclick=\"window.open(this.href, 'targetWindow', 'toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,top=0,left="+
					 left+",width="+popupWidth+",height="+height+"'); return false;\">"+file_name+"</a>";
		
		$("#div-existing-file").html(file_html);
		modal.style.display = "block";

		
	}
	
	function editSpanCliked(ele){
		
		 let recordid =  $(ele).data('id');
	     let ltr_date =  $(ele).data('date');
	     let category_id =  $(ele).data('category');
	     let letterNo = decodeURIComponent($(ele).data('letterno'));
	     let ltr_subject = decodeURIComponent($(ele).data('subject'));
	     let ltr_file =  $(ele).data('file');
	     
	     editClicked(recordid,ltr_date,category_id,letterNo,ltr_subject,ltr_file);
	     		 
		 
	}
	
	function deleteClicked(record_id){
		
		let useraction = confirm("Do you really want to delete the record?");
		 if(useraction){
		
			 console.log("Delete record for record id= " +record_id);
			 $.ajax({
					type : "POST",
					url : "CircularsServlet",
					data : {operation:"deleteCircular",
							recordid:record_id},
					success : function(data) {

						if (data != "-1") {
							alert("Record deleted succesfully.");								
							closeCliked();
						} else {
							alert("Error occured. Please try again later....");
						}
					},
					error : function(e) {
						alert("Error occured. Please try again later....");
					}
				});
		}
		
	}
</script>


</html>