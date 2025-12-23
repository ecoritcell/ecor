<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tour Programme</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<link href="./css/default.css" rel="stylesheet" type="text/css" media="all">
<!-- <link href="./css/appointment.css" rel="stylesheet" type="text/css" media="all">
<link href="Styles/mastercss.css" rel="stylesheet" type="text/css" /> -->
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
                                		<h4>Tour Programme/Leave</h4><h4> <a href="tour_programme_form.jsp"><button id="btnaddnew" name="button" type="button" style="margin: 0px;">Add Tour Program/Leave</button></a></h4>
                                	</div>
                             </div>
<%

String servletPath = request.getServletPath();
//Extract page name like "page.jsp"
String pageName = servletPath.substring(servletPath.lastIndexOf("/") + 1);
Set<String> page_access =  (HashSet<String>)session.getAttribute("page_access");

String id=request.getParameter("id")==null?"":request.getParameter("id");
String userid=(String)session.getAttribute("userName")==null?"":(String)session.getAttribute("userName");
String from_date=request.getParameter("from_date")==null?"":request.getParameter("from_date");
String to_date=request.getParameter("to_date")==null?"":request.getParameter("to_date");


ResultSet rs=null;
Statement st=null;
PreparedStatement ps=null;
String errmsg="";

DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
DateFormat tf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");

try{
	Connection con=DBConnect.getConnection();
    st=con.createStatement(); 
   
%>                                
                                <div class="panel-body">
                                <div align="center" style="display: flex; justify-content: space-between; padding-left: 10px;padding-right: 10px;">
                                <form action="tour_programme.jsp" name="tourpr" method="post" class="col-lg-12" >	                       			
									<TABLE border="1" style="width:70%;border:none;">		         
         							<tr>
           								<TD>			
											<div class="form-group has-success">
                   								<label>From Date:</label>
                     							<input name="from_date" id="fromdate" value="<%=from_date %>" type="date" class="form-control" autofocus required />                                              
                							</div>
										</TD>
										<TD>			
											<div class="form-group has-success">
                   								<label>To Date:</label>
                     							<input name="to_date" id="todate" value="<%=to_date %>" type="date" class="form-control" required />                                              
                							</div>
										</TD>
										<TD class="formheader" align="center" colspan="3" height="20"> </br>
											<input type="hidden" name="userid" value="<%=userid %>" >
											<INPUT name="submit" id="submit" type="submit"  value="SHOW" class="btn btn-primary">
											&nbsp;&nbsp;
				 							<INPUT name="clear" type="button" value=" CLEAR " class="btn btn-primary" onclick="clearData()"></TD>
									</tr></TABLE></form>
									</div>
                                <h4 style="margin: 0px;padding: 0px"><%=request.getParameter("ack")==null?"":request.getParameter("ack") %></h4>
                                    <div class="row">                                               	
 
					<div class="col-lg-12">
                        <!--<div class="panel panel-primary" id="dataTable">                           
                             /.panel-heading -->
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
                                                <% 
										  	if(!(userid.equals("") ||userid.equals("null"))  && page_access.contains(pageName)){%>
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
	 q="SELECT * FROM tour_details where status='1' and id not in (select id from tour_details where (date_format(coming_back_on, '%Y-%m-%d')< '"+from_date+"' or date_format(leaving_on, '%Y-%m-%d')> '"+to_date+"'))";
}
else{
	 //q="select * from tour_details where status='1' and leaving_on>=curdate() order by leaving_on asc";
	//q="select * from tour_details where status='1' and ((current_timestamp() between leaving_on and coming_back_on) or leaving_on>current_date()) order by leaving_on asc";
	//q="select * from tour_details where status='1' and (date_format(leaving_on, '%Y-%m-%d') >= curdate() or date_format(coming_back_on, '%Y-%m-%d') >= curdate()) order by leaving_on asc;";
	q="select * from tour_details where status='1' and coming_back_on > CURRENT_TIMESTAMP() order by leaving_on asc;";
}

//System.out.print("q="+q);

rs=st.executeQuery(q);

while(rs.next()){
	LocalDate leaveDate = LocalDate.parse(rs.getString("leaving_on").substring(0,10));
	LocalDate comingBackDate = LocalDate.parse(rs.getString("coming_back_on").substring(0,10));
	//if(rs.getString("leaving_on").substring(0,10).equals(strCurrentDate)){
	if((leaveDate.isBefore(currentDate) || leaveDate.isEqual(currentDate)) && (comingBackDate.isAfter(currentDate) || comingBackDate.isEqual(currentDate))){
		color="lightgreen";
		//System.out.println(rs.getString("leaving_on").substring(0,10));
	}
	else if(rs.getString("leaving_on").substring(0,10).equals(strNextDate)){
		color="yellow";
	}
	else if(leaveDate.isBefore(currentDate)){
		color="white";
	}
	else{
		color="lightgrey";
	}
%>	                                       <tr bgcolor="<%=color %>">
                                           <td ><%=rs.getString("designation") %></td>
										   <td ><%=tf.format(df.parse(rs.getString("leaving_on"))) %></td>                                       	
										  	<td><%=tf.format(df.parse(rs.getString("coming_back_on"))) %></td>	
										  	<td><%=rs.getString("location") %></td>										  											  											  	
										  	<td><%=rs.getString("leave_duty") %></td>
										  	<td><%=rs.getString("purpose") %></td>
										  	<% 
										  	if(!(userid.equals("") ||userid.equals(""))  && page_access.contains(pageName) ){%>
										  	<td><a href="edit_tour_details.jsp?officer_name=<%=rs.getString("officer_name") %>&designation=<%=rs.getString("designation") %>&hq_leaving=<%=rs.getString("leaving_on") %>&hq_return=<%=rs.getString("coming_back_on") %>&tour_purpose=<%=rs.getString("purpose") %>&tour_location=<%=rs.getString("location") %>&tour_type=<%=rs.getString("leave_duty") %>&id=<%=rs.getString("id") %>" ><img src="images/edit.png" width="20px"></a></td>										  		
										  	<% }%>
                                        </tr>
 <%}%>
 		                                		                                 															 						                                         
                                     </tbody>
                                    </table>                                   
                                </div>
                                <!-- /.table-responsive -->
                            </div>
                            <!-- /.panel-body 
                        </div> -->
                        <div style="display: flex; margin: 0px;padding: 0px;justify-content: space-between; padding-left: 10px;padding-right: 10px;">
                        <div class="input-color">
    <input type="text" value="On Duty/Leave (Today)" readonly/>
    <div class="color-box" style="background-color: lightgreen;"></div>
    
</div>
<div class="input-color">
    
    <input type="text" value="Duty/Leave (Tomorrow)" readonly/>
    <div class="color-box" style="background-color: yellow;"></div>
    
</div>
<div class="input-color">
    
    <input type="text" value="Future Duty/Leave" readonly/>
    <div class="color-box" style="background-color: lightgrey;"></div>
    <!-- Replace "#FF850A" to change the color -->
</div>
<div class="input-color">
    
    <input type="text" value="Past Duty/Leave" readonly/>
    <div class="color-box" style="background-color: white;"></div>
    
</div>
                        
                    </div>
                        <!-- /.panel -->
                    </div>
                    
  <%
}
catch(SQLException e)
{
	out.println("SQL Error: "+e);
}
catch(Exception e)
{
	out.println("Error: "+e);
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

$(document).ready(function() {		
	
	showHideAddNew();
})

document.addEventListener("visibilitychange", function() {
	  if (document.visibilityState === "visible") {
	    location.reload(); // Reloads the page when user switches back to this tab
	  }
	});


function showHideAddNew(){
	
 	let path = document.location.pathname;
	let page = path.split("/").pop();

	var btnnewanr = document.getElementById("btnaddnew");
	var uname = '<%=session.getAttribute("userName")%>';
	let page_access = '<%=session.getAttribute("page_access")%>';
	if(uname !=null && page_access !=null && page_access.includes(page)){		
		btnnewanr.style.display = "block";
	}
	else{
		btnnewanr.style.display = "none";
	}	
}

function clearData(){
	 window.location.href="tour_programme.jsp";
}
</script>

<script type="text/javascript">
$("#header").load("header.jsp");
$("#footer").load("html/footer.html");
</script>

</html>

