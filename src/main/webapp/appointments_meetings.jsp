<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Appointments & Meetings</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<link href="./css/default.css" rel="stylesheet" type="text/css" media="all">
<script src="js/datespecial.js"></script>
<link href="./css/bootstrap.min.css" rel="stylesheet">

<style>      
button {
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }  
.input-color {
    position: relative;
}
.input-color input {
    padding-left: 20px;
}
.input {
	border: 0px;
}
.input-color .color-box {
    width: 15px;
    height: 15px;
    display: inline-block;
    background-color: #ccc;
    position: absolute;
    left: 5px;
    top: 5px;
    
}
</style>
</head>
<body>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="customclasses.*" %>
<%@ page import="java.time.*" %>

<div id="header"></div></br>
<div class="container">

<div align="left">
                        <div class="col-lg-12 col-lg-offset-0">
                            <div class="panel panel-primary">
                                <div class="panel-heading" style="margin: 0px;padding: 0px;" >
                                
                                	<div style="display: flex; margin: 0px;padding: 0px;justify-content: space-between; padding-left: 10px;padding-right: 10px;">
                                		<h4>Appointments & Meetings</h4><h4> <a href="appointment_form.jsp"><button id="btnaddnew" name="button" type="button" style="margin: 0px;">Add New Appointment</button></a></h4>
                                	</div>
                                  
                                </div>
<%
String id=request.getParameter("id")==null?"":request.getParameter("id");
String userid=(String)session.getAttribute("userName")==null?"":(String)session.getAttribute("userName");
String from_date=request.getParameter("from_date")==null?"":request.getParameter("from_date");
String to_date=request.getParameter("to_date")==null?"":request.getParameter("to_date");

ResultSet rs=null;
Statement st=null;
PreparedStatement ps=null;
String errmsg="";

DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
DateFormat tf = new SimpleDateFormat("dd-MM-yyyy");

try{
	Connection con=DBConnect.getConnection();
    st=con.createStatement(); 
   
%>                                 
                                <div class="panel-body">
                                <div align="center" style="display: flex; justify-content: space-between; padding-left: 10px;padding-right: 10px;">
                                <form action="appointments_meetings.jsp" name="appmeet" method="post" class="col-lg-12" >	                       			
									<TABLE border="1" style="width:70%;border:none;">		         
         							<tr>
           								<TD>			
											<div class="form-group has-success">
                   								<label>From Date:</label>
                     							<input name="from_date" id="from_date" value="<%=from_date %>" type="date" class="form-control" autofocus required />                                              
                							</div>
										</TD>
										<TD>			
											<div class="form-group has-success">
                   								<label>To Date:</label>
                     							<input name="to_date" id="to_date" value="<%=to_date %>" type="date" class="form-control" required />                                              
                							</div>
										</TD>
										<TD class="formheader" align="center" colspan="3" height="20"> </br>
											<input type="hidden" name="userid" value="<%=userid %>" >
											<INPUT name="submit" id="submit"  type="submit"  value="SHOW" class="btn btn-primary">
											&nbsp;&nbsp;
				 							<INPUT name="clear" type="reset" value=" CLEAR " class="btn btn-primary" onclick="javascript:clearData()"></TD>
									</tr></TABLE></form>
									</div>
                                	<h4 style="margin: 0px;padding: 0px"><%=request.getParameter("ack")==null?"":request.getParameter("ack") %></h4>
                                    <div class="row">                                               	

					<div class="col-lg-12 ">
                        <!--<div class="panel panel-primary" id="dataTable">
                            
                             /.panel-heading -->
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table" style="font-size:12px;" id="myTable">
                                        <thead>
                                            <tr class="success">
                                                <th>Appointment Date</th>
                                                <th>Appointment Time</th>
                                                <th>Appointment With</th>
                                                <th>Designation</th>
                                                <th>Purpose</th>                                                                                                                                
                                                <th>Venue</th>
                                                <% 
										  	if(!(userid.equals("") ||userid.equals("null"))){%>
										  		<th>Edit</th>
										  	<% }%>
                                                                                                                                                                                           
                                            </tr>                                            
                                        </thead>
                                        <tbody>  
<%
int i=0;
String color="";
String q="";
LocalDate currentDate = LocalDate.now();
LocalDate nextDate = currentDate.plusDays(1);

String strCurrentDate = currentDate.toString();
String strNextDate = nextDate.toString();

if(!(((from_date==null)||(from_date==""))&&((to_date==null)||(to_date=="")))){
	 q="select * from appointment_details where status='1' and appointment_date between '"+from_date+"' and '"+to_date+"' order by appointment_date, appointment_time asc";
}
else{
	 q="select * from appointment_details where status='1' and curdate()<=appointment_date order by appointment_date, appointment_time asc";
}

rs=st.executeQuery(q);

while(rs.next()){
	LocalDate apptDate = LocalDate.parse(rs.getString("appointment_date"));
	if(rs.getString("appointment_date").equals(strCurrentDate)){
		color="lightgreen";		
	}
	else if(rs.getString("appointment_date").equals(strNextDate)){
		color="yellow";
	}
	else if(apptDate.isBefore(currentDate)){
		color="white";
	}
	else{
		color="lightblue";
	}
%>	                                       <tr bgcolor="<%=color %>">
                                            <td ><%=tf.format(df.parse(rs.getString("appointment_date"))) %></td>
										    <td ><%=rs.getString("appointment_time") %></td>                                       	
										  	<td><%=rs.getString("appointment_with") %></td>	
										  	<td><%=rs.getString("designation") %></td>										  											  											  	
										  	<td><%=rs.getString("purpose") %></td>
										  	<td><%=rs.getString("venue") %></td>
										  	<% 
										  	if(!(userid.equals("") ||userid.equals(""))){%>
										  	<td><a href="edit_appointment_details.jsp?appointment_date=<%=rs.getString("appointment_date") %>&appointment_time=<%=rs.getString("appointment_time") %>&appointment_with=<%=rs.getString("appointment_with") %>&designation=<%=rs.getString("designation") %>&purpose=<%=rs.getString("purpose") %>&venue=<%=rs.getString("venue") %>&id=<%=rs.getString("id") %>" ><img src="images/edit.png" width="20px"></a></td>
										  		
										  	<% }%>
                                        </tr>
 <%}%>
 		                                		                                 															 						                                         
                                     </tbody>
                                    </table>
                                    
                                </div>
                                <!-- /.table-responsive -->
                            <!--</div>
                             /.panel-body -->
                        </div>
                        <div style="display: flex; margin: 0px;padding: 0px;justify-content: space-between; padding-left: 10px;padding-right: 10px;">
                        <div class="input-color">
    <input type="text" value="Today" readonly/>
    <div class="color-box" style="background-color: lightgreen;"></div>
    
</div>
<div class="input-color">
    
    <input type="text" value="Tomorrow" readonly/>
    <div class="color-box" style="background-color: yellow;"></div>
    
</div>
<div class="input-color">
    
    <input type="text" value="Other Days" readonly/>
    <div class="color-box" style="background-color: lightblue;"></div>
    <!-- Replace "#FF850A" to change the color -->
</div>
<div class="input-color">
    
    <input type="text" value="Past Days" readonly/>
    <div class="color-box" style="background-color: white;"></div>
    
</div>
                        <!-- /.panel -->
                    </div></div>
                    
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
                    </div></div>
<div id="footer"></div>

</body>

<script type="text/javascript">

document.addEventListener("visibilitychange", function() {
	  if (document.visibilityState === "visible") {
	    location.reload(); // Reloads the page when user switches back to this tab
	  }
	});


$(document).ready(function() {		
	
	showHideAddNew();
})

function showHideAddNew(){
	var btnnewanr = document.getElementById("btnaddnew");
	var uname = '<%=session.getAttribute("userName")%>';
	var module = '<%=session.getAttribute("module")%>';
	if(uname !='null' && module == "APT"){			
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