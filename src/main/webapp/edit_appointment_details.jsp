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

<body style="background-color:lightgrey;">
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="customclasses.*" %>
<%

String userid=(String)session.getAttribute("userName")==null?"":(String)session.getAttribute("userName");
String id=request.getParameter("id")==null?"":request.getParameter("id");
String app_date=request.getParameter("appointment_date")==null?"":request.getParameter("appointment_date");
String app_time=request.getParameter("appointment_time")==null?"":request.getParameter("appointment_time");
String app_with=request.getParameter("appointment_with")==null?"":request.getParameter("appointment_with");
String remarks=request.getParameter("remarks")==null?"":request.getParameter("remarks");
String app_purpose=request.getParameter("purpose")==null?"":request.getParameter("purpose");
String app_venue=request.getParameter("venue")==null?"":request.getParameter("venue");
String is_vip=request.getParameter("is_vip")==null?"":request.getParameter("is_vip");

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

<div id="header"></div></br>
<div align="center"><a href="appointments_meetings.jsp"><button name="button" type="button" > Appointments & Meetings </button></a></div>
<div align="left">
                        <div class="col-md-4 col-md-offset-4">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                   <h4>Edit Appointments & Meetings</h4>
                                    <h4><%=request.getParameter("ack")==null?"":request.getParameter("ack") %></h4>
                                </div>
                            	<div class="panel-body">
    							<div class="row">                                       
   <form name="app_form" id="app_form" method="post" action="./AppointmentForm"  >	
          		
		<TABLE  class="table" >							   
			<TR class="success">
				<TD colspan="2">					 
                 <label style="color:#445ddd">Appointment Details:</label>	                  
                 </TD>				
	       </TR>
	       <TR class="success">
		        <TD>			
				<div class="form-group has-success">
                   <label>Appointment Date:</label>
                     <input name="app_date" value="<%=app_date %>" type="date" class="form-control" autofocus required />                                              
                </div>
				</TD>
	       
				 <TD>			
				<div class="form-group has-success">
                   <label>Appointment Time:</label>
                     <input name="app_time" type="time" value="<%=app_time %>" class="form-control" required />                                              
                </div>
				</TD>
		   </TR>
	       <TR class="success">	
				<TD>			
				<div class="form-group has-success">
                   <label>Appointment With:</label>
                     <input name="app_with" type="text" value="<%=app_with %>" class="form-control" placeholder="Enter Person's Name" required />                                              
                </div>
				</TD>
				<TD>			
				<div class="form-group has-success">
                   <label>Is VIP:</label>
                     <input name="is_vip" type="checkbox" <%=is_vip.equals("on")?"selected":"" %> />                                              
                </div>
				</TD>
				</TR>
	       <TR class="success">			 			 
	       		<TD colspan="2">			
				<div class="form-group has-success">
                   <label>Purpose:</label>                     
                     <textarea name="app_purpose" class="form-control" placeholder="Enter Purpose" required ><%=app_purpose %></textarea>                                              
                </div>
				</TD>							 			 
	       </TR>
	       <TR class="success">
				<TD>			
				 <div class="form-group has-success">
                   <label>Venue:</label>                  
				   <input name="app_venue" type="text"  class="form-control" value="<%=app_venue %>" placeholder="Enter Venue" required />
                  </div>
				</TD>
		        <TD>			
				<div class="form-group has-success">
                   <label>Remarks:</label>
                     <input name="remarks" type="text" value="<%=remarks %>" class="form-control" placeholder="Enter Remarks" />                                              
                </div>
				</TD>	           
			</TR>	        				  		   		   	       	        
	        <TR>
				<TD class="formheader" align="center" colspan="5" height="20"></br>
					<input type="hidden" name="userid" value="<%=userid %>" >
					<input type="hidden" name="id" value="<%=id %>" > 
					<INPUT name="update" id="update"  type="submit"  value="UPDATE" class="btn btn-primary">
					<INPUT name="delete" id="delete"  type="submit"  value="DELETE" class="btn btn-primary">						
				</TD>
			</TR>
		</TABLE>		
</form>                                        
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
</body>

<script type="text/javascript">
$("#header").load("header.jsp");
$("#footer").load("html/footer.html");
</script>

</html>