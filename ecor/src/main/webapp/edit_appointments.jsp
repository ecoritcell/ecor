<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Appointment Details</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<link href="css/default.css" rel="stylesheet" type="text/css" media="all">
<script src="js/datespecial.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">

<style>
        
button {
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
</style>
</head>

<body>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="customclasses.*" %>

<div id="header"></div>
<div align="center"><a href="appointment_form.jsp"><button name="button" type="button" > Add New Appointment </button></a>
<a href="appointments_meetings.jsp"><button name="button" type="button" > Appointments & Meetings </button></a></div>
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
					<div class="col-lg-12">
                        <div class="panel panel-primary" id="dataTable">
                            
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table"  style="font-size:12px;" id="myTable1">
                                        <thead>
                                            <tr class="success">
                                                
                                                <th>Appointment Date</th>
                                                <th>Appointment Time</th>
                                                <th>Appointment With</th>
                                                <th>Designation</th>                                                                                                                                
                                                <th>Purpose</th>
                                                <th>Venue</th>
                                                
                                                <th>Edit/Delete</th>                                                                                                                                           
                                            </tr>
                                            
                                        </thead>
                                        <tbody>  
<%
int i=0;
String tte_count="";
String q="select * from appointment_details where status='1' order by appointment_date desc";
rs=st.executeQuery(q);

while(rs.next()){
%>	                                       <tr>
                                            <td ><%=rs.getString("appointment_date") %></td>
										    <td ><%=rs.getString("appointment_time") %></td>                                       	
										  	<td><%=rs.getString("appointment_with") %></td>	
										  	<td><%=rs.getString("designation") %></td>										  											  											  	
										  	<td><%=rs.getString("purpose") %></td>
										  	<td><%=rs.getString("venue") %></td>
										  	
										  	<td><a href="edit_appointment_details.jsp?appointment_date=<%=rs.getString("appointment_date") %>&appointment_time=<%=rs.getString("appointment_time") %>&appointment_with=<%=rs.getString("appointment_with") %>&designation=<%=rs.getString("designation") %>&purpose=<%=rs.getString("purpose") %>&venue=<%=rs.getString("venue") %>&id=<%=rs.getString("id") %>" ><img src="images/edit.png" width="20px"></a></td>
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
$("#header").load("header.html");
$("#footer").load("footer.html");
</script>

</html>

