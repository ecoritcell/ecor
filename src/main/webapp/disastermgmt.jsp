<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZDMP</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="css/default.css" rel="stylesheet" type="text/css" media="all">
<link href="css/fonts.css" rel="stylesheet" type="text/css" media="all">
<link href="css/disastermgmt.css" rel="stylesheet" type="text/css" media="all">
</head>
<body>

<div id="header"></div>

<div id="mainbody">
	<div id="pagename-wrapper">
			<div id="pagename" class="container">
				<h3>DISASTER MANAGEMENT</h3>
			</div>
		</div>
		
		<div id="table-wrapper">
			<div id="table-container" class="container">
			
				<table id="tablereport">
					
					<tr>
						<th style="text-align: left;"><h2 style="margin: 0px;padding: 0px;">Links</h2></th>
					</tr>				
					<tr>
						<td>
							<ul class="reportul">																			
								<li><a href="ExternalDocument?type=2&name=ZDMP.pdf" target="_blank">ZONAL DISASTER MANAGEMENT PLAN 2024</a></li>
							</ul>
						</td>
					</tr>					
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