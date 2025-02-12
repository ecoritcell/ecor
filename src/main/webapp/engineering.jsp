<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Engineering</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="css/default.css" rel="stylesheet" type="text/css" media="all">
<link href="css/engineering.css" rel="stylesheet" type="text/css" media="all">

</head>
<body>

<div id="header"></div>


<div id="mainbody">
	<div id="pagename-wrapper">
			<div id="pagename" class="container">	
				<h3>ENGINEERING</h3>
			</div>
	</div>
	
	<div id="table-wrapper">
			<div id="table-container" class="container">
				<p id="stnYardPara">STATION YARD DIGRAM</p>
				<table id="tableqtrposition">
				<thead>
					<tr>
						<th> KUR </th>
						<th> SBP </th>
						<th> WAT </th>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td> 
							<a href="DirectoryServlet?div=KUR&diagram=SYD" target="_blank"> Station Yard Diagram </a> 
						</td>
						<td>
							<a href="DirectoryServlet?div=SBP&diagram=SYD" target="_blank"> Station Yard Diagram </a>	
						</td>
						<td>
							<a href="DirectoryServlet?div=WAT&diagram=SYD" target="_blank"> Station Yard Diagram </a>							
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