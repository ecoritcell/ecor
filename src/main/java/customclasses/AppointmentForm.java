package customclasses;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class AppointmentForm
 */
@WebServlet("/AppointmentForm")
public class AppointmentForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String app_date=request.getParameter("app_date");		
		String app_time=request.getParameter("app_time");
		String app_with=request.getParameter("app_with");
		String designation=request.getParameter("designation");
		String app_purpose=request.getParameter("app_purpose");
		String app_venue=request.getParameter("app_venue");
		String is_vip=request.getParameter("is_vip");		
		String id=request.getParameter("id");
		String status="0";					
		String userid=request.getParameter("userid");
		//System.out.println(id);
		try {
		Connection con=DBConnect.getConnection();
		ResultSet rs=null;
		Statement st=null;
		PreparedStatement ps=null;
		st=con.createStatement();
		//System.out.println("Start table");
		
		
		if(request.getParameter("submit")!=null) {
			
		ps=con.prepareStatement("insert into appointment_details (appointment_date,appointment_time,appointment_with,designation,purpose,venue,vip,userid"
				+ ") values(?,?,?,?,?,?,?,?)");
		ps.setString(1,app_date);
		ps.setString(2,app_time);		
		ps.setString(3,app_with);
		ps.setString(4,designation);
		ps.setString(5,app_purpose);
		ps.setString(6,app_venue);
		ps.setString(7,is_vip);
		ps.setString(8,userid);		
				
		ps.executeUpdate();
		//System.out.println("End table");
		
	
		System.out.println("Saved Successfully");
		response.sendRedirect("appointments_meetings.jsp?ack=Saved Successfully");
		}
		
		else if(request.getParameter("update")!=null) {
			ps=con.prepareStatement("update appointment_details set appointment_date=?,appointment_time=?,appointment_with=?,designation=?,purpose=?,venue=?,vip=?,userid=? where id=?");
			ps.setString(1,app_date);
			ps.setString(2,app_time);		
			ps.setString(3,app_with);
			ps.setString(4,designation);
			ps.setString(5,app_purpose);
			ps.setString(6,app_venue);
			ps.setString(7,is_vip);
			ps.setString(8,userid);
			ps.setString(9,id);
			
			ps.executeUpdate();
			System.out.println("Updated Successfully");
			response.sendRedirect("appointments_meetings.jsp?ack=Updated Successfully");
			}
		else if(request.getParameter("delete")!=null) {
			ps=con.prepareStatement("update appointment_details set status=? where id=?");
			ps.setString(1,status);
			ps.setString(2,id);
			ps.executeUpdate();
			System.out.println("Deleted Successfully");
			response.sendRedirect("appointments_meetings.jsp?ack=Deleted Successfully");
			}
		
		}
		catch(SQLException e) {
			System.out.println("SQL Error: " +e);			
			response.sendRedirect("appointment_form.jsp?ack=Some Error Occured, Please Try Later");	
			
			}
		catch(Exception e) {
			System.out.println("Exception Error: " +e);			
			response.sendRedirect("appointment_form.jsp?ack=Some Error Occured, Please Try Later");	
			
			}
		
	}
}
