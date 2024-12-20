<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OQA</title>
<link rel="icon" href="images/IR_logo.png" type="image/x-icon" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="css/default.css" rel="stylesheet" type="text/css" media="all">
<link href="css/fonts.css" rel="stylesheet" type="text/css" media="all">
<link href="css/oqa.css" rel="stylesheet" type="text/css" media="all">

</head>
<body>

<div id="header"></div>

	<div id="mainbody">
		<div id="pagename-wrapper">
			<div id="pagename" class="container">	
				<h3>ECoR GAZETTED QUARTERS [HQ - GENERAL POOL]</h3>
			</div>
		</div>
		
		<div id="table-wrapper">
			<div id="table-container" class="container">
				<table id="tableqtrposition">
				<thead>
					<tr>
					<th colspan="4"> POSITION LAST UPDATED ON:-14/11/2024</th>
					</tr>
				</thead>
				
				<tbody>
					<tr>
					<td> 
						<div class="tdcontainer"> 
							<a href="ExternalDocument?type=2&name=HOUSING-POLICY.pdf" target="_blank"> HOUSING POLICY </a> 
							<a onclick="editIconClicked('1001')"><img class="editImageClass" alt="" style="width: 20px;height: 20px;" src="images/pencil_icon2.png"> </a>
						</div>	 
					</td>
					<td>
						<div class="tdcontainer"> 
							<a href="ExternalDocument?type=2&name=RETENTION-PROVISION.pdf" target="_blank"> RETENTION PROVISION </a> 
							<a onclick="editIconClicked('1002')"><img class="editImageClass" alt="" style="width: 20px;height: 20px;" src="images/pencil_icon2.png"> </a>
						</div>	
					</td>
					<td>
						<div class="tdcontainer"> 
							<a href="ExternalDocument?type=2&name=QUARTERS-IN-BBS.pdf" target="_blank"> QUARTERS IN BBS [LOCATIONS,TYPE & NOS.] </a> 
							<a onclick="editIconClicked('1003')"><img class="editImageClass" alt="" style="width: 20px;height: 20px;" src="images/pencil_icon2.png"> </a>
						</div>							
					</td>
					<td>
						<div class="tdcontainer"> 
							<a href="ExternalDocument?type=2&name=REGISTRATION-FORM.pdf" target="_blank">REGISTRATION FORM</a> 
							<a onclick="editIconClicked('1004')"><img class="editImageClass" alt="" style="width: 20px;height: 20px;" src="images/pencil_icon2.png"> </a>
						</div>
					</td>
					</tr>
				</tbody>
				

				</table>
				
				<table id="tablelist">
				<tr>
					<th>OCCUPATION LISTS</th>
					<th>WAITING LISTS</th>
					<th>OTHER INFORMATION</th>
				</tr>
				<tbody>
					<tr>
					<td>
						<div class="tdcontainer"> 
							<a href="ExternalDocument?type=2&name=Rail-Kunj-Flat.pdf" target="_blank">Rail Kunj (Flat)</a> 
							<a onclick="editIconClicked('1005')"><img class="editImageClass" alt="" style="width: 20px;height: 20px;" src="images/pencil_icon2.png"> </a>
						</div>	
					</td>
					<td>
						<div class="tdcontainer"> 
							<a href="ExternalDocument?type=2&name=JS-SS.pdf" target="_blank">JS/SS</a> 
							<a onclick="editIconClicked('1017')"><img class="editImageClass" alt="" style="width: 20px;height: 20px;" src="images/pencil_icon2.png"> </a>
						</div>
					</td>
					<td>
						<div class="tdcontainer"> 
							<a href="ExternalDocument?type=2&name=RETENTION-LIST.pdf" target="_blank">RETENTION LIST</a> 
							<a onclick="editIconClicked('1021')"><img class="editImageClass" alt="" style="width: 20px;height: 20px;" src="images/pencil_icon2.png"> </a>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="tdcontainer"> 
							<a href="ExternalDocument?type=2&name=Rail-Kunj-Duplex.pdf" target="_blank">Rail Kunj (Duplex)</a> 
							<a onclick="editIconClicked('1006')"><img class="editImageClass" alt="" style="width: 20px;height: 20px;" src="images/pencil_icon2.png"> </a>
						</div>
					</td>
					<td>
						<div class="tdcontainer"> 
							<a href="ExternalDocument?type=2&name=JAG-SG.pdf" target="_blank">JAG/SG</a> 
							<a onclick="editIconClicked('1018')"><img class="editImageClass" alt="" style="width: 20px;height: 20px;" src="images/pencil_icon2.png"> </a>
						</div>
					</td>
					<td><a></a></td>
				</tr>
				<tr>
				
					<td>
						<div class="tdcontainer"> 
							<a href="ExternalDocument?type=2&name=Rail-Kutir.pdf" target="_blank">Rail Kutir</a> 
							<a onclick="editIconClicked('1007')"><img class="editImageClass" alt="" style="width: 20px;height: 20px;" src="images/pencil_icon2.png"> </a>
						</div>
					</td>
					<td>
						<div class="tdcontainer"> 
							<a href="ExternalDocument?type=2&name=SAG-NF-HAG.pdf" target="_blank">SAG/NF-HAG</a> 
							<a onclick="editIconClicked('1019')"><img class="editImageClass" alt="" style="width: 20px;height: 20px;" src="images/pencil_icon2.png"> </a>
						</div>					
					</td>
					<td><a></a></td>
					
				</tr>
				<tr>
					<td>
						<div class="tdcontainer"> 
							<a href="ExternalDocument?type=2&name=Rail-Vihar-B-Type.pdf" target="_blank">Rail Vihar (B Type)</a> 
							<a onclick="editIconClicked('1008')"><img class="editImageClass" alt="" style="width: 20px;height: 20px;" src="images/pencil_icon2.png"> </a>
						</div>
					</td>
					
					<td>
						<div class="tdcontainer"> 
							<a href="ExternalDocument?type=2&name=HAG.pdf" target="_blank">HAG</a> 
							<a onclick="editIconClicked('1020')"><img class="editImageClass" alt="" style="width: 20px;height: 20px;" src="images/pencil_icon2.png"> </a>
						</div>
					
					</td>
					<td><a href="#" target="_blank"></a></td>
				</tr>
				<tr>
					<td>
						<div class="tdcontainer"> 
							<a href="ExternalDocument?type=2&name=Rail-Vihar-C-Type.pdf" target="_blank">Rail Vihar (C Type)</a> 
							<a onclick="editIconClicked('1009')"><img class="editImageClass" alt="" style="width: 20px;height: 20px;" src="images/pencil_icon2.png"> </a>
						</div>
					
					</td>
					<td><a></a></td>
					<td><a></a></td>
				</tr>
				<tr>
					<td>
						<div class="tdcontainer"> 
							<a href="ExternalDocument?type=2&name=Rail-Kunj-Type-VI.pdf" target="_blank">Rail Kunj (Type-VI)</a> 
							<a onclick="editIconClicked('1010')"><img class="editImageClass" alt="" style="width: 20px;height: 20px;" src="images/pencil_icon2.png"> </a>
						</div>
					</td>
					<td><a></a></td>
					<td><a></a></td>
				</tr>
				<tr>
					<td>
						<div class="tdcontainer"> 
							<a href="ExternalDocument?type=2&name=Rail-Kunj-Type-V.pdf" target="_blank">Rail Kunj (Type-V)</a> 
							<a onclick="editIconClicked('1011')"><img class="editImageClass" alt="" style="width: 20px;height: 20px;" src="images/pencil_icon2.png"> </a>
						</div>
					</td>
					<td><a></a></td>
					<td><a></a></td>
				</tr>
				<tr>
					<td>
						<div class="tdcontainer"> 
							<a href="ExternalDocument?type=2&name=Rail-Kunj-Type-IV-Spl.pdf" target="_blank">Rail Kunj (Type-IV Spl.)</a> 
							<a onclick="editIconClicked('1012')"><img class="editImageClass" alt="" style="width: 20px;height: 20px;" src="images/pencil_icon2.png"> </a>
						</div>
					</td>
					<td><a></a></td>
					<td><a></a></td>
				</tr>
				<tr>
					<td>
						<div class="tdcontainer"> 
							<a href="ExternalDocument?type=2&name=Rail-Kutir-Type-V.pdf" target="_blank">Rail Kutir (Type-V)</a> 
							<a onclick="editIconClicked('1013')"><img class="editImageClass" alt="" style="width: 20px;height: 20px;" src="images/pencil_icon2.png"> </a>
						</div>
					</td>
						
					<td><a></a></td>
					<td><a></a></td>
				</tr>
				<tr>
					<td>
						<div class="tdcontainer"> 
							<a href="ExternalDocument?type=2&name=Rail-Vihar-B-Type.pdf" target="_blank">Rail Vihar (B-Type)</a> 
							<a onclick="editIconClicked('1014')"><img class="editImageClass" alt="" style="width: 20px;height: 20px;" src="images/pencil_icon2.png"> </a>
						</div>
					</td>
					<td><a></a></td>
					<td><a></a></td>
				</tr>
				<tr>
					<td>
						<div class="tdcontainer"> 
							<a href="ExternalDocument?type=2&name=Rail-Vihar-C-Type.pdf" target="_blank">Rail Vihar (C-Type)</a> 
							<a onclick="editIconClicked('1015')"><img class="editImageClass" alt="" style="width: 20px;height: 20px;" src="images/pencil_icon2.png"> </a>
						</div>					
					</td>
					<td><a></a></td>
					<td><a></a></td>
				</tr>
				<tr>
					<td>
						<div class="tdcontainer"> 
							<a href="ExternalDocument?type=2&name=Transit-Flat.pdf" target="_blank">Transit Flat</a> 
							<a onclick="editIconClicked('1016')"><img class="editImageClass" alt="" style="width: 20px;height: 20px;" src="images/pencil_icon2.png"> </a>
						</div>					
					</td>
					<td><a></a></td>
					<td><a></a></td>
				</tr>
				</tbody>
				

				</table>
				
			</div>
		</div>
		
		
		<!--MODEL VIEW-->		
		<div id="myModel" class="modal">
				
			<div id="modelcontainer" class="modal-content">		
				<span class="close" onclick="closeCliked()">&times;</span>
				<h2 style="text-align: center; margin-bottom: 0px; text-decoration: underline;">UPDATE</h2>
				
				
				<form id="addnewmomform" action="#">				
				<table id="formtable">
					<tr>
						<td>
							<div>
					    	<label for="dropdownlist">Select Category:</label>
					    	<select id="dropdownlist" name="dropdownlist" class="common-input" disabled="disabled">
								<option value="1001">HOUSING POLICY</option>
								<option value="1002">RETENTION PROVISION</option>
								<option value="1003">QUARTERS IN BBS [LOCATIONS,TYPE & NOS.]</option>
								<option value="1004">REGISTRATION FORM</option>
								
								<option value="1005">Rail Kunj (Flat)</option>
								<option value="1006">Rail Kunj (Duplex)</option>
								<option value="1007">Rail Kutir</option>
								<option value="1008">Rail Vihar (B-Type)</option>
								
								<option value="1009">Rail Vihar (C-Type)</option>
								<option value="1010">Rail Kunj (Type-VI)</option>
								<option value="1011">Rail Kunj (Type-V)</option>
								<option value="1012">Rail Kunj (Type-IV Spl.)</option>
								<option value="1013">Rail Kutir (Type-V)</option>
								<option value="1014">Rail Vihar (B-Type)</option>
								<option value="1015">Rail Vihar (C-Type)</option>
								<option value="1016">Transit Flat</option>
								
								<option value="1017">JS/SS</option>
								<option value="1018">JAG/SG</option>
								<option value="1019">SAG/NF-HAG</option>
								<option value="1020">HAG</option>
								
								<option value="1021">RETENTION LIST</option>
								
							</select>  
							</div>
						</td>											
					</tr>
					
					<tr>
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

var modal = document.getElementById("myModel");

window.onclick = function(event) {
    if (event.target == modal) {
    	clearForm();
        modal.style.display = "none";
    }
}


$(document).ready(function() {		
	
	showHideAddEditBtn();
})


function showHideAddEditBtn(){

	var uname = '<%=session.getAttribute("userName")%>';
	const editicons = document.getElementsByClassName("editImageClass");
	
	for (let i = 0; i < editicons.length; i++) {

			const imgelements = editicons[i];
			if (uname != 'null') {

				imgelements.style.display = "block";
			} else {
				imgelements.style.display = "none";
			}
		}

	}


function editIconClicked(iconid){
	
	/* alert(temp); */
	$("#dropdownlist").val(iconid); 
	var $statusPara = $("#statuspara");
	$statusPara.text("");
	modal.style.display = "block";
	
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
                    alert("File is too Big, please select a file less than 10 mb");
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

function submitClicked(){
	
	var $statusPara = $("#statuspara");
	$statusPara.text("");

	var itemid = $("#dropdownlist").val().trim();
    var fileName = $("#uploaddocument").val();

	
	if(itemid.length <= 0){

		$statusPara.text("Select Item.");
        $statusPara.css("color", "red");
	}
	else if(fileName.length <= 0){
		$statusPara.text("Select File.");
		 $statusPara.css("color", "red");
	}		
	else{
				
		var form = $("#addnewmomform")[0];
		var data = new FormData(form);
        data.append("operation", "updateofficerquarterdetail");
        data.append("itemid", itemid);
        			
		$.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: "OqaServlert",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function (data) {

            	if(data = "Successfully updated")
            	{
            		$statusPara.text (data);
					$statusPara.css("color", "green");
            	}
            	else{
            		
            		$statusPara.text (data);
					$statusPara.css("color", "red");
            	}

            	clearForm();

            },
            error: function (e) {

            	$statusPara.text ("Error occured. Please try again later....");
				 $statusPara.css("color", "red");
                console.log("ERROR : ", e);
               /*  document.getElementById("addnewmomform").reset(); */
                clearForm();
            }
        }); 			
		
	}

}
	
	function closeCliked() {

		clearForm();
		modal.style.display = "none";

	}

	function clearForm() {
		document.getElementById('fileSize').innerHTML = "";
		$("#uploaddocument").val("");
	}
	
	function resetClicked(){
		
		clearForm();
	}
	
</script>




<script type="text/javascript">
$("#header").load("header.jsp");
$("#footer").load("html/footer.html");
</script>


</html>