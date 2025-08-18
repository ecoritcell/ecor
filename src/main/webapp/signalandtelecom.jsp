<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signal & Telecom</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="css/default.css" rel="stylesheet" type="text/css" media="all">
<link href="css/signalandtelecom.css" rel="stylesheet" type="text/css" media="all">
</head>

<body>

<div id="header"></div>

<div id="mainbody">
	<div id="pagename-wrapper">
			<div id="pagename" class="container">	
				<ul id="parentmenu" style="display:flex; justify-content: space-between;">
		            <li class="current_page_item"><a href="http://10.1.2.21/">Railway Board</a></li>
		            <li class="current_page_item"><a href="http://10.100.2.19/">RDSO</a></li>
		            <li class="current_page_item"><a href="http://10.195.2.19/">IRISET</a></li>
		            <li class="current_page_item"><a href="https://www.railtel.in/">RAILTEL</a></li>
		            <li class="current_page_item"><a href="http://10.140.2.6/">NAIR</a></li>
		            <li class="current_page_item"><a href="https://rites.com/Railways">RITES</a></li>
		        </ul>        
			</div>
	</div>
	
	<div id="table-wrapper">
			<div id="table-container" class="container">
				<table id="tableqtrposition">
				<thead>
					<tr>
						<th colspan="4"> SIGNAL & TELECOM </th>
						<!-- <th> Railway Board </th>
						<th> RDSO </th>
						<th> IRISET </th>
						<th> RAILTEL </th>
						<th> NAIR </th>
						<th> RITES </th> -->
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td>  
							<ul class="tblelements">
								<li> <a href="https://icms.indianrail.gov.in/">ICMS</a> </li>
								<li> <a href="https://eastcoastrail.indianrailways.gov.in/view_section.jsp?lang=0&id=0,1,291,1294">MSOP</a></li>
								<li> <a href="https://indianrailways.gov.in/railwayboard/view_section.jsp?lang=0&id=0,1,304,366,544,664" >IRSEM</a></li>
								<li> <a href="https://indianrailways.gov.in/railwayboard/uploads/codesmanual/telecom/TelecomManual/telecom-man-idx.htm">IRTEM</a></li>
								<li> <a href="#">Telephone Directory</a></li>
								<li> <a href="#">Internet Site</a></li>
								<li> <a href="https://eastcoastrail.indianrailways.gov.in/view_section.jsp?lang=0&id=0,2,484,1020">ECoR Time Table</a></li>
								<li> <a href="http://10.180.18.249/SIAS/">SIAS</a></li>
								<li> <a href="https://indianrailways.gov.in/railwayboard/view_section.jsp?id=0,1,304,366,544">SIGNAL DIRECTORATE</a></li>
								<li> <a href="https://telerb.railnet.gov.in/">TELECOM DIRECTORATE</a></li>
							</ul>
						</td>
						
						<td>  
							<ul class="tblelements">
								<li> <a href="ExternalDocument?type=2&name=Openline Setup.pdf">OpenlineSetup</a></li>
								<li> <a href="ExternalDocument?type=2&name=Division Setup.pdf">Divisional Setup</a></li>
								<li> <a href="ExternalDocument?type=2&name=ART_ARME.pdf">ART & ARME</a></li>
								<li> <a href="https://indianrailways.gov.in/railwayboard/view_section.jsp?lang=0&id=0,1,304,366,538,2713,2718,2722,2732">Signal Publication</a></li>
								<li> <a href="stationdiagram.jsp">Station/IBS Layouts</a></li>
							</ul>
						</td>
						
						<td>  
							<ul class="tblelements">
								<li> <a href="ExternalDocument?type=2&name=Construction Setup.pdf"> Construction Setup</a></li>
								<li> <a href="http://10.50.17.190/">Telecom Web Application</a></li>
								<li> <a href="https://iriset.railnet.gov.in/">IRISET Internet Website</a></li>
								<li> <a href="signallingsystemmap.jsp">Signal System Map</a></li>
								<li> <a href="https://eastcoastrail.indianrailways.gov.in/view_section.jsp?lang=0&id=0,3,878">Similar Nature for S&T Works</a></li>
							</ul>
						</td>
						
						<td>  
							<ul class="tblelements">
								<!-- <li> <a href="ExternalDocument?type=2&name=GSU Setup.pdf">GSU Setup</a></li> -->
								<li> <a href="telecommunicationcircular.jsp">Telecom Circular</a></li>
								<li> <a href="https://eastcoastrail.indianrailways.gov.in/view_section.jsp?lang=0&id=0,6,922,927">G& SR</a></li>
								<li> <a href="signalsip.jsp">Signal SIP</a></li>
								<li> <a href="signallingcircular.jsp">Signalling Circular</a></li>
							</ul>
						</td>
						
					</tr>
				</tbody>
				

				</table>
			</div>
		</div>


</div>

<div id="footer"></div>

</body>

<script type="text/javascript">
$("#header").load("html/header.html");
$("#footer").load("html/footer.html");
</script>


</html>