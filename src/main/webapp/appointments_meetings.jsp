<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Appointments & Meetings</title>
<link rel="icon" href="images/IR_logo.png" type="image/x-icon" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="css/default.css" rel="stylesheet" type="text/css" media="all">
<script src="js/datespecial.js"></script>
<link href="./css/bootstrap.min.css" rel="stylesheet">

<style>      
  


</style>
</head>
<body>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="customclasses.*" %>

<div id="header"></div>

<div align="center"><a href="appointment_form.jsp"><button id="btnaddnew" name="button" type="button" >Add New Appointment</button></a></div>

<div align="left">
                        <div class="col-lg-8 col-lg-offset-2">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                   <h4>Appointments & Meetings</h4>
                                    <h4><%=request.getParameter("ack")==null?"":request.getParameter("ack") %></h4>
                                </div>
                                <div class="panel-body">
                                    <div class="row">                                               	
<%
String id=request.getParameter("id")==null?"":request.getParameter("id");

ResultSet rs=null;
Statement st=null;
PreparedStatement ps=null;
String errmsg="";

DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
DateFormat tf = new SimpleDateFormat("dd-MMM-yyyy");

try{
	Connection con=DBConnect.getConnection();
    st=con.createStatement(); 
  
 
%> 
					<div class="col-lg-12 ">
                        <div class="panel panel-primary" id="dataTable">
                            
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table" style="font-size:12px;" id="myTable1">
                                        <thead>
                                            <tr class="success">
                                                <th>Appointment Date</th>
                                                <th>Appointment Time</th>
                                                <th>Appointment With</th>
                                                <th>Designation</th>
                                                <th>Purpose</th>                                                                                                                                
                                                <th>Venue</th>                                                                                                                                           
                                            </tr>                                            
                                        </thead>
                                        <tbody>  
<%
int i=0;
String tte_count="";
String q="select * from appointment_details where status='1' order by appointment_date, appointment_time desc";
rs=st.executeQuery(q);

while(rs.next()){
%>	                                       <tr>
                                            <td ><%=rs.getString("appointment_date") %></td>
										    <td ><%=rs.getString("appointment_time") %></td>                                       	
										  	<td><%=rs.getString("appointment_with") %></td>	
										  	<td><%=rs.getString("designation") %></td>										  											  											  	
										  	<td><%=rs.getString("purpose") %></td>
										  	<td><%=rs.getString("venue") %></td>
                                        </tr>
 <%}%>
 		                                		                                 															 						                                         
                                     </tbody>
                                    </table>
                                    
                                </div>
                                <!-- /.table-responsive -->
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>
                    
  <%

}
catch(SQLException e)
{
	out.println("SQL Error:"+e);
}
catch(Exception e)
{
	out.println("Error:"+e);
}
%>         		
		
		                                
                                    </div>
                                    <!-- /.row (nested) -->
                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
<div id="footer"></div>

</body>

<script type="text/javascript">
$(document).ready(function() {		
	
	showHideAddNew();
})

function showHideAddNew(){

	var btnnewanr = document.getElementById("btnaddnew");
	var uname = '<%=session.getAttribute("userName")%>';
	if(uname !='null'){			
		btnnewanr.style.display = "block";
	}
	else{
		btnnewanr.style.display = "none";
	}
	
}

</script>

<script type="text/javascript">
$("#header").load("header.jsp");
$("#footer").load("html/footer.html");
</script>

</html>