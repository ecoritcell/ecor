<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% 
    String language = (String) session.getAttribute("language");
    if (language == null) language = "en";
%>

<%-- <fmt:setLocale value="${language}" /> --%>
<fmt:setLocale value='<%= language %>' />
<fmt:setBundle basename="messages" />

 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ECoR</title>
<link rel="icon" href="images/IR_logo.png" type="image/x-icon" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="css/default.css" rel="stylesheet" type="text/css" media="all">
<!-- <link href="css/fonts.css" rel="stylesheet" type="text/css" media="all"> -->
<link href="css/index.css" rel="stylesheet" type="text/css" media="all">

</head>

<body>

<%
    response.setHeader("Cache-Control", "no-cache,no-store, must-revalidate"); //HTTP 1.1
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0
    response.setDateHeader("Expires", 0); //prevents caching at the proxy server
%>


<div id="header"></div>

<div id="mainBody">

	<div id="menu-wrapper">
			<div id="menu" >
				<ul id="parentmenu" style="display:flex; justify-content: space-between;">
	                <li class="current_page_item"><a href="#"><fmt:message key="home" /></a></li>
					<li>
							<a class="dropdown" href="#"><fmt:message key="railways" /></a>
							 <ul class="submenu">
								  <li><a href="http://10.180.2.19/" target="_blank">ECoR</a></li>
              					  <li><a href="http://10.31.2.32/" target="_blank">CR</a></li>
								  <li><a href="https://ecr.indianrailways.gov.in/" target="_blank">ECR</a></li>
							      <li><a href="http://10.4.2.21/" target="_blank">ER</a></li>
							      <li><a href="http://10.102.2.19/" target="_blank">NCR</a></li>
							      <li><a href="https://ner.indianrailways.gov.in/index.jsp?lang=0" target="_blank">NER</a></li>
							      <li><a href="http://10.42.2.20/" target="_blank">NFR</a></li>
							      <li><a href="http://10.2.2.19/" target="_blank">NR</a></li>
							      <li><a href="http://10.141.2.19/" target="_blank">NWR</a></li>
							      <li><a href="http://10.51.2.19/" target="_blank">SCR</a></li>
							      <li><a href="https://secr.indianrailways.gov.in/index.jsp?lang=0" target="_blank">SECR</a></li>
							      <li><a href="http://10.41.2.100/" target="_blank">SER</a></li>
							      <li><a href="http://10.5.2.32/" target="_blank">SR</a></li>
							      <li><a href="http://10.205.2.21/" target="_blank">SWR</a></li>
							      <li><a href="http://10.150.2.19/" target="_blank">WCR</a></li>
							      <li><a href="http://10.3.9.55/" target="_blank">WR</a></li>
					              <li><a href="https://core.indianrailways.gov.in/index.jsp?lang=0" target="_blank">CORE</a></li>
					              <li><a href="https://cofmow.indianrailways.gov.in/index.jsp?lang=0" target="_blank">COFMOW</a></li>
					              <li><a href="http://10.100.2.19/" target="_blank">RDSO</a></li>
					              <li><a href="http://www.irwo.net/" target="_blank">IRWO</a></li>
			      			</ul>					
					</li>
					
					<li >
						<a class="dropdown" href="#"><fmt:message key="divisions" /></a>
						<ul class="submenu">							
							<li><a href="https://eastcoastrail.indianrailways.gov.in/view_section.jsp?lang=0&id=0,1,1290,1296" target="_blank"> KUR DIVISION</a></li>
							<li><a href="https://eastcoastrail.indianrailways.gov.in/view_section.jsp?lang=0&id=0,1,1290,1295" target="_blank"> WAT DIVISION</a></li>
							<li><a href="https://eastcoastrail.indianrailways.gov.in/view_section.jsp?lang=0&id=0,1,1290,1297" target="_blank"> SBP DIVISION</a></li>
						</ul>
						
					</li>
	
					<li><a class="dropdown" href="#"><fmt:message key="department" /></a>
						<ul class="submenu">
							<li><a href="https://eastcoastrail.indianrailways.gov.in/view_section.jsp?lang=0&id=0,1,1208,1209" target="_blank"> Accounts</a></li>
							<li><a href="https://eastcoastrail.indianrailways.gov.in/view_section.jsp?lang=0&id=0,1,1208,1223" target="_blank"> Vigilance</a></li>
							<li><a href="https://eastcoastrail.indianrailways.gov.in/view_section.jsp?lang=0&id=0,1,1208,1535" target="_blank"> Public Relation</a></li>
							<li><a href="https://eastcoastrail.indianrailways.gov.in/view_section.jsp?lang=0&id=0,1,1208,1213" target="_blank"> Administration</a></li>
							<li><a href="https://eastcoastrail.indianrailways.gov.in/view_section.jsp?lang=0&id=0,1,1208,1214" target="_blank"> Mechanical</a></li>
							<li><a href="https://eastcoastrail.indianrailways.gov.in/view_section.jsp?lang=0&id=0,1,1208,1220" target="_blank"> Security</a></li>														
							<li><a href="https://eastcoastrail.indianrailways.gov.in/view_section.jsp?lang=0&id=0,1,1208,1211" target="_blank"> Commercial</a></li>
							<li><a href="https://eastcoastrail.indianrailways.gov.in/view_section.jsp?lang=0&id=0,1,1208,1215" target="_blank"> Medical</a></li>
							<li><a href="signalandtelecom.jsp" target="_blank"> Signal & Telecom</a></li>
							<!-- <li><a href="http://10.180.2.19/signal.html" target="_blank"> Signal & Telecom</a></li> -->
							<li><a href="https://eastcoastrail.indianrailways.gov.in/view_section.jsp?lang=0&id=0,1,1208,1212" target="_blank"> Electrical</a></li>
							<li><a href="https://eastcoastrail.indianrailways.gov.in/view_section.jsp?lang=0&id=0,1,1208,1216" target="_blank"> Operating</a></li>
							<li><a href="https://eastcoastrail.indianrailways.gov.in/view_section.jsp?lang=0&id=0,1,1208,1222" target="_blank"> Stores</a></li>
							<li><a href="engineering.jsp" target="_blank"> Engineering</a></li>
							<li><a href="https://eastcoastrail.indianrailways.gov.in/view_section.jsp?lang=0&id=0,1,1208,1217" target="_blank"> Personnel</a></li>
							<li><a href="https://eastcoastrail.indianrailways.gov.in/view_section.jsp?lang=0&id=0,1,1208,1219" target="_blank"> Safety</a></li>
							<li><a href="http://10.180.18.249/" target="_blank"> IT</a></li>
						</ul>
					</li>
					<li>
						<a href="#"><fmt:message key="trainingorg" /></a>
						<ul class="submenu">
			                <li><a href="https://nair.indianrailways.gov.in/" target="_blank">NAIR</a></li>
			                <li><a href="http://www.iricen.gov.in/iricen/Home" target="_blank">IRICEN</a></li>
			                <li><a href="https://irimee.indianrailways.gov.in/index.jsp?lang=0" target="_blank">IRIMEE</a></li>
			                <li><a href="http://10.195.2.19/" target="_blank">IRISET</a></li>
			                <li><a href="http://10.151.2.19/" target="_blank">IRIEEN</a></li>
							<li><a href="https://irifm.indianrailways.gov.in/website/academics__newforthcoming_courses.php" target="_blank">IRIFM</a></li>
							<li><a href="https://iritm.indianrailways.gov.in/#/getContent?contentId=0,6,21" target="_blank">IRITM</a></li>
              			</ul>
					</li>
					<li>
						<a href="#"><fmt:message key="psu" /></a>
						<ul class="submenu">
			               	<li><a href="http://10.53.4.11/" target="_blank">ICF</a></li>
			                <li><a href="https://rwf.indianrailways.gov.in/">RWF</a></li>
			                <li><a href="https://rcf.indianrailways.gov.in/" target="_blank">RCF</a></li>
			                <li><a href="https://dlw.indianrailways.gov.in/" target="_blank">DLW</a></li>
			                <li><a href="http://www.clw.indianrailways.gov.in/" target="_blank">CLW</a></li>
			                <li><a href="http://www.rites.com/" target="_blank">RITES Ltd</a></li>
			                <li><a href="https://www.ircon.org/index.php?lang=en" target="_blank">IRCONIL </a></li>
			                <li><a href="http://irfc.nic.in/" target="_blank">IRFC</a></li>
			                <li><a href="http://www.concorindia.com/" target="_blank">CONCOR </a></li>
			                <li><a href="http://konkanrailway.com/" target="_blank">KRCL </a></li>
			                <li><a href="https://mrvc.indianrailways.gov.in/" target="_blank">MRVC </a></li>
			                <li><a href="http://www.railtelindia.com/" target="_blank">RCIL </a></li>
			                <li><a href="http://www.irctc.co.in/" target="_blank">IRCTC</a></li>
			                <li><a href="https://dfccil.com/" target="_blank">DFCCIL </a></li>
			                <li><a href="http://10.3.9.140/webpage/emuwsmx/emu_ws_mx.html" target="_blank">EMU WS-MX </a></li>
			                <li><a href="http://10.3.9.140/webpage/plws/index.html" target="_blank">PL-WS</a></li>
			                <li><a href="http://10.35.230.115/prtnnew/" target="_blank">PRTN-WS</a></li>
			                <li><a href="http://10.38.203.208/" target="_blank">BVP-WS</a></li>
			                <li><a href="http://10.39.1.101/dhdnew/" target="_blank">DHD-WS</a></li>
							<li><a href="http://10.36.251.55/EWS%20SBI/index.html" target="_blank">EWS-SBI</a></li>						
		              </ul>
					
					</li>
					<li>
						<a href="#"><fmt:message key="directory" /></a>
						<ul class="submenu">
			               	<li><a href="ExternalDocument?type=2&name=MAIN_TELEPHONE_DIRECTORY.pdf" target="_blank">MAIN TELEPHONE DIR</a></li>
			                <li><a href="ExternalDocument?type=2&name=E_Mail_Directory.pdf" target="_blank">EMAIL DIR</a></li>
			                <li><a href="ExternalDocument?type=2&name=STATION_DIRECTORY.pdf" target="_blank">STN DIR</a></li>
			                <li><a href="ExternalDocument?type=2&name=INTERCOM_DIRECTORY.pdf" target="_blank">INTERCOM DIR</a></li>
		              </ul>
					</li>
				</ul>
	        </div>
			<!-- end #menu --> 
			<div id="divsearch" >
				<!-- <p>Search:</p> -->
				<input id="txtsearch" type="text" placeholder="Search..." onkeyup="debouncedSearch()"> 
			</div>
			
	</div>
		
	<!--  MAIN TABLE START-->
	<div id="maintable-wrapper">
		<div id="maintable-container" class="container">
		
		<table id="main-table">
			<thead>
				<tr>
				 	<th width="35%"></th>
				 	<th width="35%"></th>
				 	<th width="30%"></th>
				</tr>
			</thead>
			<tr>
				<td>
					<table id="sub-table" style="width: 100%;">
						<tr>
							<td>
								<div id="divimage" style="margin: auto; width: 100%;" class="divdesign" >
									<!-- <div class="imgcontent"></div> -->
									<!-- <img id="imgecor" alt="" src="images/railsadan5.jpg" width="400px" height="250px"> -->
									<div id="divimagecontainer" style="background-image:url('../images/railsadan6.jpg');"></div>
									<!-- <img id="imgecor" alt="" src="images/railsadan6.jpg" width="100%" height="250px"> -->
								</div> 
								 
							</td>
						</tr>
						<tr>
							<td>
							<div class="divdesign">
							<p class="divheaderDesign"><fmt:message key="quicklink" /></p>
							<ul class="myul">
									<li><a href="https://indianrailways.gov.in/railwayboard/" target="_blank"><fmt:message key="rbinternetsite" /></a></li>
									<li><a href="http://10.1.2.21/" target="_blank"><fmt:message key="railwayboard" /></a></li>
									<li><a href="https://indianrailways.gov.in/" target="_blank"> <fmt:message key="irsite" /></a> </li>
									<li><a href="https://eastcoastrail.indianrailways.gov.in/view_section.jsp?lang=0&id=0,1,285" target="_blank"><fmt:message key="ecorsysmap" /></a></li>
									<li><a href="http://10.180.18.249/" target="_blank"><fmt:message key="itcentre" /></a> </li>
									<%-- <li><a href="https://eastcoastrail.indianrailways.gov.in/view_section.jsp?lang=0&id=0,6,1308" target="_blank"><fmt:message key="gzngzorder" /></a> </li> --%>
									<li><a href="https://eastcoastrail.indianrailways.gov.in/" target="_blank"><fmt:message key="ecorinternetsite" /></a> </li>
									<li><a href="https://www.irctc.co.in/" target="_blank"><fmt:message key="irctc" /></a> </li>
									<li><a href="https://www.indianrail.gov.in/enquiry/PNR/PnrEnquiry.html?locale=en" target="_blank"><fmt:message key="pnrenq" /></a> </li>
									<li> <a href="https://eastcoastrail.indianrailways.gov.in/view_section.jsp?lang=0&id=0,1,1208,1218" target="_blank"> <fmt:message key="rajbhasa" /> </a> </li>									
									<li><a href="https://eastcoastrail.indianrailways.gov.in/view_section.jsp?lang=0&id=0,1,291,1294" target="_blank"> <fmt:message key="sop" /> </a> </li>
									<li><a href="https://email.gov.in/" target="_blank"> <fmt:message key="railnet" /> </a></li>									
								</ul>
							</div>
								
							</td>
						</tr>
						
						<tr>
							<td>
							<div class="divdesign">
							<p class="divheaderDesign"><fmt:message key="socialmedia" /></p>
							<ul class="myulsocialmedia" >
									<li><a href="https://www.facebook.com/EASTCOASTRailway1" target="_blank"> <img alt="" src="images/facebook_logo.png"> </a></li>
									<li><a href="https://x.com/eastcoastrail" target="_blank"> <img alt="" src="images/x_logo.png"> </a></li>
									<li><a href="https://www.instagram.com/cproecor/" target="_blank"> <img alt="" src="images/instagram_icon.png"> </a></li>
									<li><a href="https://www.youtube.com/channel/UC17vldSl4lN7nRKcBuKADCw" target="_blank"> <img alt="" src="images/youtube_icon.png"> </a></li>
								</ul>
							</div>
								
							</td>
						</tr>
						
					</table>
				</td>
				<td>
					<table class="subtabledesign">
						<tr>
							<td>
							<div class="divdesign">
								<p class="divheaderDesign"><fmt:message key="importantlink" /></p>
								<ul class="myul">
									<li><a href="ExternalDocument?type=2&name=GM_MSG.pdf" target="_blank"> <fmt:message key="gmmessage" /></a> </li>
									<li><a href="appointments_meetings.jsp" target="_blank"><fmt:message key="apptmtng" /></a> </li>
									<li><a href="tour_programme.jsp" target="_blank"><fmt:message key="tourprogramme" /></a> </li>
									<%-- <li><a href="http://10.180.18.249/RD/index.jsp" target="_blank"><fmt:message key="edak" /></a> </li> --%>									
									<%-- <li><fmt:message key="rrm" /></li> --%>
									<li><a href="gmmonmeeting.jsp" target="_blank"><fmt:message key="gmtuesdaymeeting" /></a> </li>	
									<li><a href="gminspection.jsp" target="_blank"> <fmt:message key="gminspreport" /> </a></li>
									<li><a href="jpo.jsp" target="_blank"><fmt:message key="jpo" /> </a> </li>		
									<li><a href="oqa.jsp" target="_blank"><fmt:message key="officersqtrallotment" /></a></li>
									<li><a href="https://eastcoastrail.indianrailways.gov.in/view_section.jsp?lang=0&id=0,6,1308" target="_blank" ><fmt:message key="transfer&postingorder" /></a></li>
									<li><a href="gmanr.jsp" target="_blank"><fmt:message key="gmanr" /></a> </li>
									<li><a href="https://eastcoastrail.indianrailways.gov.in/view_section.jsp?lang=0&id=0,5,1078" target="_blank"><fmt:message key="ecornb" /></a></li>
									<li><a href="disastermgmt.jsp" target="_blank"> <fmt:message key="disastermgmt" /> </a> </li>															
									<li><a href="https://sparrow.railnet.gov.in/SPARROW/otherAuthentication/showLoginType" target="_blank"><fmt:message key="sparrow" /></a></li>									
									<li><a href="http://10.180.18.161" target="_blank"><fmt:message key="libhq" /></a></li>									
									
									<%-- <li><a href="gmannualinsp.jsp" target="_blank"><fmt:message key="insforgmannualinsp" /></li> --%>
								</ul>
							</div>
								
							</td>
						</tr>
						
						<tr>
							<td>
							
							<div class="divdesign">
									<p class="divheaderDesign"><fmt:message key="newitem" /></p>
									<ul class="myul">
										<li><a href="https://igotkarmayogi.gov.in/" target="_blank"><fmt:message key="missionkarmyogi" /></a> </li>
										<li> <a href="ExternalDocument?type=2&name=INTERCOM_DIRECTORY.pdf" target="_blank"> <fmt:message key="adminitercomdir" /> </a> </li>
										<li><a href="ExternalDocument?type=2&name=ECoR_Wall_Calendar.pdf" target="_blank"><fmt:message key="ecorcal" /></a> </li>
										<li><a href="https://aims.indianrailways.gov.in/ress/" target="_blank"><fmt:message key="ress" /></a> </li>									
										<%-- <li><fmt:message key="gazoo" /></li> --%> 										
										<%-- <li><a href="signaling.jsp" target="_blank"> <fmt:message key="ecorsip" /></a></li> --%>
										<li><a href="stationdiagram.jsp" target="_blank"> <fmt:message key="ecorsip" /></a></li>
										<li><a href="engineering.jsp" target="_blank"> <fmt:message key="stnyarddiagram" /></a></li>
										<%-- <li><fmt:message key="isolatingbpofcoach" /></li> --%>									
										<%-- <li><fmt:message key="sportsclub" /></li> --%>
										<li><a href="https://www.sesececorlyeccs.com/" target="_blank"> <fmt:message key="cooperativebank" /></a> </li>
										<li><a href="https://www.nfirindia.com/" target="_bkank"><fmt:message key="nfir" /></a> </li>
										<li><a href="https://www.airfindia.org/" target="_blank"><fmt:message key="airf" /></a></li>
										<li><a href="preventionofsh.jsp" target="_blank"><fmt:message key="pshatworkplace" /></a></li>
										<%-- <li><fmt:message key="gbcrescue" /></li> --%>
										<%-- <li><fmt:message key="swachhta" /></li> --%>
										<%-- <li><a href="https://eastcoastrail.indianrailways.gov.in/view_section.jsp?lang=0&id=0,6,1335,1686" target="_blank"><fmt:message key="secretballot" /></a></li> --%>
										<li><a href="https://eastcoastrail.indianrailways.gov.in/view_section.jsp?lang=0&id=0,7,331,1420" target="_blank"><fmt:message key="rtiauthorities" /></a></li>
									</ul>
							</div>
								
							</td>
						</tr>
						
						
					</table>
				</td>
				
				<td>
					<table class="subtabledesign">
						<%-- <tr>
							<td>
								<div class="divdesign">
									<p class="divheaderDesign"><fmt:message key="cuglink" /></p>
									<ul class="myul">
										<li><a href="ExternalDocument?type=2&name=CUG_GUIDELINE.pdf" target="_blank"><fmt:message key="cugguidelines" /></a> </li>
										<li><a href="ExternalDocument?type=2&name=BROADBAND_GUIDELINE.pdf" target="_blank"><fmt:message key="broadbandguidelines" /></a> </li>									
									</ul>
								</div>
							</td>
						</tr> --%>
						
						
						<tr>
							<td>
							<div class="divdesign">
								<p class="divheaderDesign"><fmt:message key="externallink" /></p>
								<ul class="myul">
									<li><a href="https://parichay.nic.in/pnv1/assets/login?sid=eOfficeRailECo" target="_blank"><fmt:message key="eoffice" /></a></li>
									<li><a href="https://pravas.indianrailways.gov.in/" target="_blank"> <fmt:message key="orhbooking" /> </a></li>
									<li><a href="http://10.180.18.255/ICARD/" target="_blank"><fmt:message key="icard" /></a> </li>
									<li><a href="https://railmadad.indianrailways.gov.in" target="_blank"><fmt:message key="railmadad" /></a></li>
									<li><a href="https://hrms.indianrail.gov.in/HRMS" target="_blank"><fmt:message key="hrms" /></a></li>
									<li><a href="https://esampada.mohua.gov.in/" target="_blank"><fmt:message key="holidayehome" /></a></li>									
									<li><a href="https://hmis.rcil.gov.in/AHIMSG5/hissso/Login" target="_blank"><fmt:message key="hmis" /></a></li>
									<li><a href="https://umid.digitalir.in/1_modules_dashboard/0_login" target="_blank"><fmt:message key="umid" /></a></li>
									<li><a href="https://ircep.gov.in/IRWCMS/Login.jsp" target="_blank"><fmt:message key="irwcms" /></a></li>
									<li><a href="https://www.incometax.gov.in/" target="_blank"><fmt:message key="efiling" /></a></li>
									<li><a href="https://aims.indianrailways.gov.in/" target="_blank"><fmt:message key="ipas" /></a></li>
									<li><a href="https://ircep.gov.in/IRPSM/" target="_blank"><fmt:message key="irpsm" /></a> </li>
									<li><a href="https://ircep.gov.in/TMS/" target="_blank"><fmt:message key="trackmgmt" /></a> </li>
									<li><a href="https://www.fois.indianrail.gov.in/FOISWebPortal/index.jsp" target="_blank"><fmt:message key="fois" /></a></li>
									<li><a href="https://pgportal.gov.in/cpgoffice/" target="_blank"> <fmt:message key="cpgram" /> </a> </li>
									<li><a href="https://cic.gov.in/" target="_blank"> <fmt:message key="cic" /> </a></li>
									<li><a href="https://www.ireps.gov.in/" target="_blank"> <fmt:message key="ireps" /> </a></li>
									<li><a href="https://www.ireps.gov.in/immis/" target="_blank"> <fmt:message key="imms" /> </a></li>
									<li><a href="https://ireps.gov.in/iMMS/logon" target="_blank"> <fmt:message key="udm" /> </a></li>
									<li><a href="http://10.180.18.249/SIAS/" target="_blank"> <fmt:message key="sias" /> </a></li>
									<li><a href="https://eprocure.gov.in/cppp/" target="_blank"><fmt:message key="gem" /></a> </li>
									<li><a href="https://rpf.indianrailways.gov.in/RPF/" target="_blank"><fmt:message key="rpfsmis" /></a> </li>
									<li><a href="https://www.protean-tinpan.com/" target="_blank"><fmt:message key="nsdl" /></a> </li>									
								</ul>
							</div>
							
							</td>
						</tr>
						
					</table>
				</td>
			</tr>
		</table>
		
	</div>
	
</div> 


		<!--MODEL VIEW-->		
		<!-- <div id="myModel" class="modal">
				
			<div id="modelcontainer" class="modal-content">		
				<span class="close" onclick="closeCliked()">&times;</span>
				<h2 style="text-align: center; margin-bottom: 0px;">LOGIN</h2>
				<hr>
				
				
				<form id="addnewform" action="#">				
				<table id="formtable">
					<tr>
						<td>
							<div>
					    	<label for="txtusername">Username: <span class="requiredDesign">*</span></label>
				        	<input id="txtusername" name="txtusername" class="common-input " type="text" placeholder="Enter username"  required>  
							</div>
						</td>											
					</tr>
					
					
					<tr>
						<td>
							<div>
						    	<label for="txtpassword">Password: <span class="requiredDesign">*</span> </label>
					        	<input id="txtpassword" name="txtpassword" class="common-input" type="password" placeholder="Enter password"  required>  
							</div>
						</td>
											
					</tr>
										
					<tr>
						<td>
							<div style="text-align: center; display: flex; justify-content: center;" >
			  					<input type="button" value="LOGIN"  class="" style="margin-right: 10px;" onclick="submitClicked()">
							</div>
						</td>
					</tr>
					<tr>
						<td >
							<div>
			  		 			<p id="statuspara"></p> 
							</div>
						</td>
					</tr>
				
				</table>
				</form>			
		</div>
		
		</div> -->




<br> 
<br> 
<br> 





</div>
<div id="footer"></div>



</body>

<script type="text/javascript">

let debounceTimer;
/* $("#header").load("html/header.html"); */
$("#header").load("header.jsp");
$("#footer").load("html/footer.html");


function debouncedSearch() {
    clearTimeout(debounceTimer);  // Clear the timer if the function is called again before delay
    debounceTimer = setTimeout(function() {
        performSearch();  // Function to call after user stops typing
    }, 500);  // Adjust delay (in milliseconds) as needed
}

function performSearch() {
    // Get the input field and filter value
    const input = document.getElementById('txtsearch');
    const filter = input.value.toLowerCase();
    
    const myul = document.getElementsByClassName("myul");
    let firstMatch = null;
    
    // Loop through all table rows, except the first (header row)
    for (let i = 0; i < myul.length; i++) {
    	
    	
        const lielements = myul[i].getElementsByTagName('li');        
        
        // Check each cell in the row
        for (let j = 0; j < lielements.length; j++) {
        	
        	lielements[j].classList.remove('highlight');        	
            if (filter.length >0 && lielements[j] && lielements[j].textContent.toLowerCase().includes(filter)) {
                
                lielements[j].classList.add('highlight');
                if(!firstMatch){
                	firstMatch =  lielements[j];
                }
            }
            
            
                        
        }

        // Highlight matching rows
       
    }
    
    if (firstMatch) {
        firstMatch.scrollIntoView({ behavior: 'smooth', block: 'center' });
    }
}



/* var modal = document.getElementById("myModel");

window.onclick = function(event) {
    if (event.target == modal) {
    	clearForm();
        modal.style.display = "none";
    }
} */


/* function btnloginClicked(){
	
	if(checkUserSession()){
		
		doLogout();
	}
	else{
		
		clearForm();
		modal.style.display = "block";
	}
	
}
 */

/* function submitClicked(){
	
	var $statusPara = $("#statuspara");

	var usrname = $("#txtusername").val().trim();
	var usrpassword = $("#txtpassword").val().trim();
	
	if(usrname.length <= 0)
		alert("Enter username.");
	else if(usrpassword.length <=0)
		alert("Enter password.");
	else{
				        			
		$.get("UserServlet",{operation:"getUserDetails",username:usrname,password:usrpassword},function(response, status) {
			
			console.log("status" + status);
	        if(response.length == 0){
	        	$statusPara.text ("Some error occured plase tray again later.");
				$statusPara.css("color", "red");
	        }
	        else{
	        	
	        	 var status = -1;
	        	 var msg = "Some  error occured please try again...";
	             $.each(response, function(index,item){     
	            	 status = item.status;
	            	 msg = item.msg;	            	 
	             })
	             
	             if(status <1){
	            		$statusPara.text (msg);
						$statusPara.css("color", "red");
	             }
	             else{
	            	 modal.style.display = "none";
	            	 reloadthepage();
	             }
	       	 }        	
	       
	  	  }) 			
	}
	
} */

/* function clearForm(){	
	var usrname = $("#txtusername").val("");
	var usrpassword = $("#txtpassword").val("");

}

function closeCliked(){
	
	clearForm();
    modal.style.display = "none";

}
 */
<%-- function checkUserSession(){
	
	var isSessionExist = false;
	var uname = '<%=session.getAttribute("userName")%>';
	console.log("uname - " +uname);
	if(uname != "null"){
		console.log("Session exist");
		isSessionExist = true; 		
	}else{
		console.log("Session expired");
		isSessionExist = false;
	}
	
	return isSessionExist;
}


function changeLoginLogoutBtn(){
	
	if(checkUserSession()){
		console.log("Login button changeg to logout");
		 var btn = document.getElementById("btnlogin");
		 console.log(btn);		 
		 /* btn.innerText("Logout"); */
		 $("#btnlogin").html("Logout");	 
	}else{
		console.log("Login button changeg to login");
		$("#btnlogin").html("Login");
	}
} --%>

/* function doLogout(){
	
	$.post("UserServlet", {operation:"Logout"},function(response, status) {	     
		console.log("UserServlet response came");		
		reloadthepage();
			
	  }) 
}

function reloadthepage(){
	window.location.reload(true);	
}
 */
</script>


<script type="text/javascript">




/* window.onload = function() {
	 
	
}
 */
<%-- $(document).ready(function() {

	console.log("Helloooooooooooo");
	console.log("Language=" + '<%= language %>');	
 
}); --%>

/* $(document).ready(function() {
	var btn = window.document.getElementById("btnlogin");
   console.log("btn = " + btn);
   changeLoginLogoutBtn(); 
});
 */
/* window.onload = function() {
	 
	 changeLoginLogoutBtn(); 
}
 */

</script>


</html>