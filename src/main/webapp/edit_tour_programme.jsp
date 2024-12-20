<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Tour Details</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<link href="css/default.css" rel="stylesheet" type="text/css" media="all" />
<script src="./js/datespecial.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet" />

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

<div id="header"></div></br>
<div align="center"><a href="tour_programme_form.jsp"><button name="button" type="button" > Add New Tour Program </button></a>
<a href="tour_programme.jsp"><button name="button" type="button" > Tour Program </button></a></div>
<div align="left">
                        <div class="col-lg-8 col-lg-offset-2">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                   <h4>Tour Programme</h4>
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
                                                <th>Officer:</th>
                                                <th>From</th>
                                                <th>To</th>
                                                <th>Out To</th>
                                                <th>Duty/Leave</th>                                                                                                                                
                                                <th>Purpose</th>
                                                <th>Edit/Delete</th>                                                                                                                                           
                                            </tr>
                                            
                                        </thead>
                                        <tbody>  
<%
int i=0;
String tte_count="";
String q="select * from tour_details where status='1' order by leaving_on desc";
rs=st.executeQuery(q);

while(rs.next()){
%>	                                       <tr>
                                           <td ><%=rs.getString("designation") %></td>
										   <td ><%=rs.getString("leaving_on") %></td>                                       	
										  	<td><%=rs.getString("coming_back_on") %></td>	
										  	<td><%=rs.getString("location") %></td>										  											  											  	
										  	<td><%=rs.getString("leave_duty") %></td>
										  	<td><%=rs.getString("purpose") %></td>
										  	<td><a href="edit_tour_details.jsp?officer_name=<%=rs.getString("officer_name") %>&designation=<%=rs.getString("designation") %>&hq_leaving=<%=rs.getString("leaving_on") %>&hq_return=<%=rs.getString("coming_back_on") %>&tour_purpose=<%=rs.getString("purpose") %>&tour_location=<%=rs.getString("location") %>&tour_type=<%=rs.getString("leave_duty") %>&id=<%=rs.getString("id") %>" ><img src="images/edit.png" width="20px"></a></td>
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
$("#header").load("header_tour.html");
$("#footer").load("footer.html");
</script>

</html>

