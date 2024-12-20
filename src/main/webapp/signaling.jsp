<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIGNALLING</title>
<link rel="icon" href="images/IR_logo.png" type="image/x-icon" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="css/default.css" rel="stylesheet" type="text/css" media="all">
<link href="css/fonts.css" rel="stylesheet" type="text/css" media="all">
<link href="css/signalling.css" rel="stylesheet" type="text/css" media="all">
</head>
<body>

<div id="header"></div>


<div id="mainbody">

		<div id="pagename-wrapper">
			<div id="pagename" class="container">
				<h3>SIGNAL & TELECOMMUNICATION</h3>
			</div>
		</div>

		<div id="tablecontainer" class="container" >
			<div id="containerdiv"  class="divdesign">
			
				<div style="padding-right: 20px; text-align: right;">					
					<span>Signalling Plans of East Coast Railway - <span id="divSpan" style="font-weight: bold;">KUR</span></span>
					<input id="txtsearch" name="txtsearch" type="text" placeholder="Search..." onkeyup="debouncedSearch()" style="margin-left: 150px;">
					
				</div>
			
				<table id="signalmaintable" >
				
				<tr>
					<th width="30%"></th>
					<th width="70%"></th>					
				</tr>
				
				<tbody>
					<tr>
						<td style="vertical-align: top;  border: none;" >
							<table id="tablediv" class="tabledesign">
							<tr>
								<th colspan="3">Signal Interlocking Plans</th>							
							</tr>
							<tr>
								<td><a onmouseover="this.style.cursor='pointer'" onclick="divisionClicked('HQ')">ECoR(HQ)</a></td>
								<td><a href="ecormap.jsp" target="_blank"><button>MAP</button></a></td>
								<!-- <td><a href="http://10.180.2.19/system%20map/ECoR.pdf" target="_blank"><button>MAP</button></a></td> -->
							</tr>
							<tr>
								<td><a onmouseover="this.style.cursor='pointer'" onclick="divisionClicked('KUR')">KHURDA (KUR)</a></td>
								<td><a href="kurmap.jsp" target="_blank"><button>MAP</button></a></td>
							</tr>
							<tr>
								<td><a onmouseover="this.style.cursor='pointer'" onclick="divisionClicked('SBP')"> SAMBALPUR(SBP)</a></td>
								<td><a href="sbpmap.jsp" target="_blank"><button>Map</button></a></td>
							</tr>
							<tr>
								<td><a onmouseover="this.style.cursor='pointer'" onclick="divisionClicked('WAT')">VISAKHAPATNAM(VSKP)</a></td>
								<td><a href="vskpmap.jsp" target="_blank"><button>Map</button></a></td>
							</tr>
							</table>
						</td>
					
						<td style="border: none;">
						
							<div>											
								<div id="stationdiv">					
									<table id="tablestation" class="tabledesign">
									<thead>
										<tr>
											<th>Sl No.</th>
											<th>Div Code</th>
											<th>Station Code</th>
											<th>Station Name</th>
										</tr>
									</thead>
									
									<tbody id="tablestationbody">
										<tr ><td colspan='4'> <p style="text-align:center; ">Loading...</p></td></tr>
									</tbody>
									</table>
								</div>													
							</div>
						</td>
				</tr>
				</tbody>
				
			</table>
			</div>
			
		</div>
	</div>

<br>
<br>
<br>
<div id="footer"></div>
</body>

<script type="text/javascript">

let debounceTimer;
var $divSpan = $("#divSpan");

$(document).ready(function() {		
	
	loadStationByDivisionCode("KUR");
})

function divisionClicked(div) {
	
	document.getElementById('txtsearch').value = "";
	$divSpan.text (div);
	loadStationByDivisionCode(div);
}

function loadStationByDivisionCode(divcode){
	
	$.get("StationServlet",{operation:"getStationByDivcode",divisioncode:divcode},function(response, status) {
		
        var $tablestationbody = $("#tablestationbody");
        $tablestationbody.find("tr").remove();        
        if(response.length == 0){
        	console.log("Data Not Found" );        	
        	var tableRow = "<tr  > <td colspan='4' class='noRecord'> No Data Found.</td></tr>";
			$tablestationbody.append(tableRow);        	
        }
        else{
        	
        	 var slno = 1;
             $.each(response, function(index,item){        	
              var tableRow = "<tr>" +
              					"<td>" + slno + "</td>" +
              					"<td>" + item.divisioncode + "</td>" +
              					"<td>" +"<a href='http://10.180.2.19/SIP%20DIAGRAM/"+divcode+"/STATION/"+item.stationcode+".pdf'"+ " target='_blank'>"+ item.stationcode +"</a>"+ "</td>" +
              					"<td>" + item.stationdesc + "</td>" +
                 				"</tr>";
                 $tablestationbody.append(tableRow);
                 slno +=1;
             })
       	 }        	
       
  	  }) 
}




function debouncedSearch() {
    clearTimeout(debounceTimer);  // Clear the timer if the function is called again before delay
    debounceTimer = setTimeout(function() {
        performSearch();  // Function to call after user stops typing
    }, 500);  // Adjust delay (in milliseconds) as needed
}


function performSearch(){
	
    const query = document.getElementById('txtsearch').value;
   /*  document.getElementById('txtsearch').innerText = `Searching for: ${query}`; */

	$.get("StationServlet",{operation:"search",searchquery:query},function(response, status) {
			
	        var $tablestationbody = $("#tablestationbody");
	        $tablestationbody.find("tr").remove();        
	        if(response.length == 0){
	        	console.log("Data Not Found" );        	
	        	var tableRow = "<tr  > <td colspan='4' class='noRecord'> No Data Found.</td></tr>";
				$tablestationbody.append(tableRow);        	
	        }
	        else{
	        	
	        	 var slno = 1;
	             $.each(response, function(index,item){        	
	              var tableRow = "<tr>" +
	              					"<td>" + slno + "</td>" +
	              					"<td>" + item.divisioncode + "</td>" +
	              					"<td>" +"<a href='http://10.180.2.19/SIP%20DIAGRAM/"+item.divisioncode+"/STATION/"+item.stationcode+".pdf'"+ " target='_blank'>"+ item.stationcode +"</a>"+ "</td>" +
	              					"<td>" + item.stationdesc + "</td>" +
	                 				"</tr>";
	                 $tablestationbody.append(tableRow);
	                 slno +=1;
	             })
	       	 }        	
	       
	  	  })
}

</script>

<script type="text/javascript">
$("#header").load("html/header.html");
$("#footer").load("html/footer.html");
</script>


</html>