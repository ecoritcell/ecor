<%@page import="customclasses.AppConfig"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>e-Office Software</title>
<link rel="icon" href="images/IR_logo.png" type="image/x-icon" />
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="css/default.css" rel="stylesheet" type="text/css"media="all">
<link href="css/fonts.css" rel="stylesheet" type="text/css" media="all">
<link href="css/eofficesoftware.css" rel="stylesheet" type="text/css" media="all">

</head>
<body>

	<div id="header"></div>

	<div id="mainbody">
		<div id="pagename-wrapper">
			<div id="pagename" class="container">
				<h3>e-Office Software Links</h3>
			</div>
		</div>


		<div id="table-wrapper" class="container">
						
			<table id="eofficetable">
			<thead>
				<tr>
					<th width="20%">SL NO.</th>
					<th width="80%">DESCRIPTION</th>
				</tr>
				</thead>
				<tbody id="eofficetablebody">
					<tr > 
						<td style="text-align: center;"> 1 </td>					
						<td> <a href="https://drive.google.com/file/d/14CuemuHo5nyOoH-5LTdnqlMeLJ7aK4zH/view" target="_blank">DSC Signer Service 7.0.2 Windows (64bit OS)</a>  </td>						
					</tr>
					
					<tr > 
						<td style="text-align: center;"> 2 </td>
						<td> <a href="https://drive.google.com/file/d/1Xvw6wCq8pAMq7Nj4Xa-8muKLtS2-yDHH/view" target="_blank">DSC Signer Service 7.0.2 MAC (64bit OS)</a>  </td>						
					</tr>
					
					<tr > 
						<td style="text-align: center;"> 3 </td>
						<td> <a href="https://eoffsigner.eoffice.gov.in:55103/check/isLive" target="_blank">DSC Signer Service 7.0.2 CHECK LINK </a>  </td>						
					</tr>
					
				</tbody>
								
			</table>
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
	
$("#header").load("html/header.html");
$("#footer").load("html/footer.html");

</script>

</html>