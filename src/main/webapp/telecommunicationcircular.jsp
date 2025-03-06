<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>S&T</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="css/default.css" rel="stylesheet" type="text/css" media="all">
<link href="css/telecommunicationcircular.css" rel="stylesheet" type="text/css" media="all">

</head>
<body>

<div id="header"></div>


<div id="mainbody">
	<div id="pagename-wrapper">
			<div id="pagename" class="container">	
				<h3>TELECOMMUNICATION CIRCULARS</h3>
			</div>
	</div>
	
	<div id="table-wrapper">
			<div id="table-container" class="container">
				<table id="tableqtrposition">
				<thead>
					<tr>
						<th> ISSUED BY </th>
						<th> JPO </th>
						<th> MISC </th>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						 <td>
						 	<ul class="tblelements">
								<li> <a href="https://telerb.railnet.gov.in/wiki/policy"> Railway Board Telecomm.Circular</a></li>
								<li> <a href="http://10.100.2.19/01_english/telecom/index.htm">RDSO Telecom Wing</a></li>
								<li> <a href="DirectoryServlet?div=ECoR&diagram=ZPL">Zonal Policy Letter (ECoR)</a></li>
							</ul>
						 </td>
						  <td>
						 	<ul class="tblelements">
								<li> <a href="DirectoryServlet?div=ECoR&diagram=JPO"> JPO 2003-2024</a></li>
							</ul>
						 </td>
						  <td>
						 	<ul class="tblelements">
								<li> <a href="#"> Misc Circular</a></li>
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