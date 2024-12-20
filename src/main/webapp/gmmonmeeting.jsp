<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Monday Meeting</title>
<link rel="icon" href="images/IR_logo.png" type="image/x-icon" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="css/default.css" rel="stylesheet" type="text/css" media="all">
<link href="css/fonts.css" rel="stylesheet" type="text/css" media="all">
<link href="css/gmmonmeeting.css" rel="stylesheet" type="text/css" media="all">
</head>
<body>

<div id="header"></div>



<div id="mainbody">
		<div id="pagename-wrapper">
			<div id="pagename" class="container">
				<h3>TUESDAY MEETING POSITION</h3>
			</div>
		</div>
		
		<div id="table-wrapper">
			<div id="table-container" class="container">
			
				<table id="tablereport">
					
					<tr>
						<th style="text-align: left;"> <h1 id="report">Reports</h1> </th>
					</tr>				
					<tr>
						<td>
							<ul class="reportul">
								<li><a href="gminstruction.jsp" target="_blank">GM Instruction</a></li>
								<li><a href="gmmom.jsp" target="_blank">Minutes Of Meeting</a> </li>								
								<!-- <li><a href="#" >Compendium of Internal Audit Reports of Indian Railways</a> </li> -->
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