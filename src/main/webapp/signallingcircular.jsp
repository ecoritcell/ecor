<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>S&T</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="css/default.css" rel="stylesheet" type="text/css" media="all">
<link href="css/signallingcircular.css" rel="stylesheet" type="text/css" media="all">

</head>
<body>

<div id="header"></div>


<div id="mainbody">
	<div id="pagename-wrapper">
			<div id="pagename" class="container">	
				<h3>SIGNALLING CIRCULARS</h3>
			</div>
	</div>
	
	<div id="table-wrapper">
			<div id="table-container" class="container">
				<table id="tableqtrposition">
				<thead>
					<tr>
						<th> ISSUED BY </th>
						<th> YEAR WISE </th>
						<th> MISC </th>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						 <td>
						 	<ul class="tblelements">
								<li> <a href="https://indianrailways.gov.in/railwayboard/view_section.jsp?lang=0&id=0,1,304,366,544,1623"> Railway Board Policy Letters & Circular</a></li>
								<li> <a href="DirectoryServlet?div=ECOR&diagram=RDSOPL">RDSO Policy Letter</a></li>
								<li> <a href="DirectoryServlet?div=ECOR&diagram=ZONALSIGNALCIRCULAR">Zone(ECoR)</a></li>
							</ul>
						 </td>
						  <td>
						 	<ul class="tblelements">
								<li> <a href="DirectoryServlet?div=ECOR&diagram=TECHNICALCIRCULAR"> PCSTE Technical Circulars 2003-2024</a></li>
							</ul>
						 </td>
						  <td>
						 	<ul class="tblelements">
								<li> <a href="https://indianrailways.gov.in/railwayboard/view_section.jsp?lang=0&id=0,1,304,366,544,1623,2876,2897"> Signalling Establishment Circulars</a></li>
								<li> <a href="ExternalDocument?type=2&name=WARRANTY_REJECTION_IN_UDM.pdf"> Warrenty Rejection in UDM for Signal Item</a></li>
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