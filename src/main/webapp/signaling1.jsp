<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIGNALLING</title>
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

		<div id="tablecontainer" class="container">
			<div id="containerdiv" >
				<table id="signalmaintable" class="divdesign">
				
				<tr>
					<th width="30%"></th>
					<th width="70%"></th>					
				</tr>
				
				<tbody>
					<tr>
					<td style="vertical-align: middle; border: none;">
						<div>
							<p style="font-weight: bold;"> Search</p>
							<p> Enter characters from the Station Code or Station Name in the text box below:</p>
							<input id="txtsearch" name="txtsearch" type="text">
							<input type="button" value="GO" onclick="goClicked()">
							<br>
							<br>
							<hr style="background-color:black; height: 2px;">						  
						</div>
					</td>
					
					<td rowspan="2" style="border: none;">
					
						<div>
							<p style="text-align: center;">Signalling Plans of East Coast Railway - <span id="divSpan" style="font-weight: bold;">KUR</span></p>		
							<input id="txtsearch" name="txtsearch" type="text">
										
							<div id="stationdiv">					
								<table id="tablestation" class="tabledesign">
								<thead>
									<tr>
										<th>Sl No.</th>
										<th>Station Code</th>
										<th>Station Name</th>
									</tr>
								</thead>
								
								<tbody id="tablestationbody">
									<tr ><td colspan='3'> </td></tr>
								</tbody>
								</table>
								
							</div>													
						</div>
					</td>
				</tr>
				<tr>
				
					<td style="vertical-align: top;  border: none;" >
					
						<table id="tablediv" class="tabledesign">
						<tr>
							<th colspan="3">Signal Interlocking Plans</th>							
						</tr>
						<tr>
							<td><a onmouseover="this.style.cursor='pointer'" onclick="divisionClicked('HQ')">ECoR(HQ)</a></td>
							<td><a href="http://10.180.2.19/system%20map/ECoR.pdf" target="_blank"><button>MAP</button></a></td>
						</tr>
						<tr>
							<td><a onmouseover="this.style.cursor='pointer'" onclick="divisionClicked('KUR')">KHURDA (KUR)</a></td>
							<td><a href="http://10.180.2.19/system%20map/KUR.pdf" target="_blank"><button>MAP</button></a></td>
						</tr>
						<tr>
							<td><a onmouseover="this.style.cursor='pointer'" onclick="divisionClicked('SBP')"> SAMBALPUR(SBP)</a></td>
							<td><a href="http://10.180.2.19/system%20map/SBP.pdf" target="_blank"><button>Map</button></a></td>
						</tr>
						<tr>
							<td><a onmouseover="this.style.cursor='pointer'" onclick="divisionClicked('WAT')">VISAKHAPATNAM(VSKP)</a></td>
							<td><a href="http://10.180.2.19/system%20map/VSKP.pdf" target="_blank"><button>Map</button></a></td>
						</tr>
					</table>
						
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

var $divSpan = $("#divSpan");

$(document).ready(function() {		
	
	loadStationByDivisionCode("KUR");
})

function divisionClicked(div) {
	
	$divSpan.text (div);
	loadStationByDivisionCode(div);
}

function loadStationByDivisionCode(divcode){
	
	$.get("StationServlet",{operation:"getStationByDivcode",divisioncode:divcode},function(response, status) {
		
        var $tablestationbody = $("#tablestationbody");
        $tablestationbody.find("tr").remove();        
        if(response.length == 0){
        	console.log("Data Not Found" );        	
        	var tableRow = "<tr  > <td colspan='3' class='noRecord'> No Data Found.</td></tr>";
			$tablestationbody.append(tableRow);        	
        }
        else{
        	
        	 var slno = 1;
             $.each(response, function(index,item){        	
              var tableRow = "<tr>" +
              					"<td>" + slno + "</td>" +
              					"<td>" +"<a href='http://10.180.2.19/SIP%20DIAGRAM/"+divcode+"/STATION/"+item.stationcode+".pdf'"+ " target='_blank'>"+ item.stationcode +"</a>"+ "</td>" +
              					"<td>" + item.stationdesc + "</td>" +
                 				"</tr>";
                 console.log("tableRow = "+tableRow);
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