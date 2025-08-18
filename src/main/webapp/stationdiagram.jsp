<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>S&T</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="css/default.css" rel="stylesheet" type="text/css" media="all">
<link href="css/stationdiagram.css" rel="stylesheet" type="text/css" media="all">

</head>
<body>

<div id="header"></div>


<div id="mainbody">
	<div id="pagename-wrapper">
			<div id="pagename" class="container">	
				<h3>STATION DIAGRAM</h3>
			</div>
	</div>
	
	<div id="table-wrapper">
			<div id="table-container" class="container">
				<table id="tableqtrposition">
				<thead>
					<tr>
						<th> KUR </th>
						<th> SBP </th>
						<th> VSKP </th>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td> 
							<ul class="tblelements">
								<li> <a href="DirectoryServlet?div=KUR&diagram=SD"> Station</a></li>
								<!-- <li> <a href="DirectoryServlet?div=KUR&diagram=LG">LC Gate</a></li> -->
								<li> <a href="DirectoryServlet?div=KUR&diagram=AS">Auto Signal</a></li>
							</ul>
						
						</td>
						<td>
							<ul class="tblelements">
								<li> <a href="DirectoryServlet?div=SBP&diagram=SD"> Station</a></li>
								<!-- <li> <a href="DirectoryServlet?div=SBP&diagram=LG">LC Gate</a></li> -->
							</ul>	
						</td>
						<td>
							<ul class="tblelements">
								<li> <a href="DirectoryServlet?div=WAT&diagram=SD"> Station</a></li>
								<!-- <li> <a href="DirectoryServlet?div=WAT&diagram=LG">LC Gate</a></li> -->
								<li> <a href="DirectoryServlet?div=WAT&diagram=AS">Auto Signal</a></li>
							</ul>							
						</td>
					</tr>
					
					<tr>
						<td colspan="3" style="text-align: center;"> 
							<a href="ExternalDocument?type=2&name=Station_List.pdf"> Station Code List</a>						
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