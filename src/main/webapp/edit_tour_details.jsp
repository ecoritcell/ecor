<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Tour/Leave Details</title>
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
String officer_name=request.getParameter("officer_name")==null?"":request.getParameter("officer_name");
String designation=request.getParameter("designation")==null?"":request.getParameter("designation");
String hq_leaving=request.getParameter("hq_leaving")==null?"":request.getParameter("hq_leaving");
String hq_return=request.getParameter("hq_return")==null?"":request.getParameter("hq_return");
String tour_purpose=request.getParameter("tour_purpose")==null?"":request.getParameter("tour_purpose");
String tour_location=request.getParameter("tour_location")==null?"":request.getParameter("tour_location");
String tour_type=request.getParameter("tour_type")==null?"":request.getParameter("tour_type");

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
<div align="center"><a href="tour_programme.jsp"><button name="button" type="button" > Tour Programme/Leave </button></a></div>
<div align="left">
                        <div class="col-md-4 col-md-offset-4">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                   <h4>Edit Tour Programme/Leave of Officers</h4>
                                    <h4><%=request.getParameter("ack")==null?"":request.getParameter("ack") %></h4>
                                </div>
                            	<div class="panel-body">
    							<div class="row">                                       
   <form name="app_form" id="app_form" method="post" target="_self" action="./TourDetailsForm"  >	          		
		<TABLE  class="table" >							   
			<TR class="success">
				<TD colspan="2">					 
                 <label style="color:#445ddd">Tour Programme/Leave Details:</label>	                  
                 </TD>				
	       </TR>
	       <TR class="success">
		        <TD>			
				<div class="form-group has-success">
                   <label>Officer's Name:</label>
                     <input name="officer_name" id="officer_name" value="<%=officer_name %>" type="text" class="form-control" autofocus required />                                              
                </div>
				</TD>
	       		<TD>			
				<div class="form-group has-success">
                   <label>Designation:</label>
                     <input name="designation" id="designation" value="<%=designation %>" type="text" class="form-control" required />                                              
                </div>
				</TD>
				</TR>
	       <TR class="success">
				 <TD>			
				<div class="form-group has-success">
                   <label>Leaving HQ on:</label>                    
                     <input name="hq_leaving" id="hq_leaving" value="<%=hq_leaving %>" type="datetime-local" class="form-control" required />                                              
                </div>
				</TD>		   	
				<TD>			
				<div class="form-group has-success">
                   <label>Coming Back on:</label>
                     <input name="hq_return" id="hq_return" value="<%=hq_return %>"type="datetime-local" class="form-control" required />                            
                </div>
				</TD>
				</TR>
	       <TR class="success">			 			 
	       		<TD colspan="2">			
				<div class="form-group has-success">
                   <label>Purpose:</label>                     
                     <textarea name="tour_purpose" id="tour_purpose"  class="form-control" placeholder="Enter Purpose" required ><%=tour_purpose %></textarea>                                              
                </div>
				</TD>		        							 			 
	       </TR>
	       <TR class="success">
				<TD>			
				 <div class="form-group has-success">
                   <label>Going to:</label>                  
				   <input name="tour_location" type="text" id="tour_location" value="<%=tour_location %>" class="form-control" placeholder="Enter Location" required />
                  </div>
				</TD>
				<TD>			
				 <div class="form-group has-success">
                   <label>Leave or Duty:</label>                  
				   <select name="tour_type" id="tour_type" value="<%=tour_type %>" class="form-control" required>
				   	<option value='Duty'>Duty</option>
				   	<option value='Leave'>Leave</option>
				   </select>
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