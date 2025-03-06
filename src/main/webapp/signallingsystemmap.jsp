<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>S&T</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="css/default.css" rel="stylesheet" type="text/css" media="all">
<link href="css/signallingsystemmap.css" rel="stylesheet" type="text/css" media="all">

</head>
<body>

<div id="header"></div>


<div id="mainbody">
	<div id="pagename-wrapper">
			<div id="pagename" class="container">	
				<h3>Signalling & Telecom</h3>
			</div>
	</div>
	
	<div id="table-wrapper">
			<div id="table-container" class="container">
				<table id="tableqtrposition">
				<thead>
					<tr>
						<th colspan="4"> SIGNALLING SYSTEM MAPS </th>						
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td> 
							<a href="ExternalDocument?type=2&name=ECoR.pdf"> Ecor </a> 
						</td>
						<td> 
							<a href="ExternalDocument?type=2&name=KUR.pdf" > KUR </a> 
						</td>
						<td>
							<a href="ExternalDocument?type=2&name=SBP.pdf" > SBP </a>	
						</td>
						<td>
							<a href="ExternalDocument?type=2&name=VSKP.pdf" >WAT</a>							
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