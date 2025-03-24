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
 * Servlet implementation class TourDetailsForm
 */
@WebServlet("/TourDetailsForm")
public class TourDetailsForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String officer_name=request.getParameter("officer_name");		
		String designation=request.getParameter("designation");
		String hq_leaving=request.getParameter("hq_leaving");
		String hq_return=request.getParameter("hq_return");
		String tour_purpose=request.getParameter("tour_purpose");
		String tour_location=request.getParameter("tour_location");
		String tour_type=request.getParameter("tour_type");									
		String userid=request.getParameter("userid");
		String id=request.getParameter("id");
		String status="0";
		//System.out.println(id);
		
		try {
		Connection con=DBConnect.getConnection();
		ResultSet rs=null;
		Statement st=null;
		PreparedStatement ps=null;
		st=con.createStatement();
		//System.out.println("Start table");
				
		if(request.getParameter("submit")!=null) {
			
		ps=con.prepareStatement("insert into tour_details (officer_name,designation,leaving_on,coming_back_on,purpose,location,leave_duty,userid"
				+ ") values(?,?,?,?,?,?,?,?)");
		ps.setString(1,officer_name);
		ps.setString(2,designation);		
		ps.setString(3,hq_leaving);
		ps.setString(4,hq_return);
		ps.setString(5,tour_purpose);
		ps.setString(6,tour_location);
		ps.setString(7,tour_type);
		ps.setString(8,userid);		
				
		ps.executeUpdate();
		//System.out.println("End table");
			
		System.out.println("Saved Successfully");
		response.sendRedirect("tour_programme.jsp?ack=Saved Successfully");
		}
		else if(request.getParameter("update")!=null) {
			ps=con.prepareStatement("update tour_details set officer_name=?,designation=?,leaving_on=?,coming_back_on=?,purpose=?,location=?,leave_duty=?,userid=? where id=?");
			ps.setString(1,officer_name);
			ps.setString(2,designation);		
			ps.setString(3,hq_leaving);
			ps.setString(4,hq_return);
			ps.setString(5,tour_purpose);
			ps.setString(6,tour_location);
			ps.setString(7,tour_type);
			ps.setString(8,userid);
			ps.setString(9,id);
			
			ps.executeUpdate();
			System.out.println("Updated Successfully");
			response.sendRedirect("tour_programme.jsp?ack=Updated Successfully");
			}
		else if(request.getParameter("delete")!=null) {
			ps=con.prepareStatement("update tour_details set status=? where id=?");
			ps.setString(1,status);
			ps.setString(2,id);
			ps.executeUpdate();
			System.out.println("Deleted Successfully");
			response.sendRedirect("tour_programme.jsp?ack=Deleted Successfully");
			}
		}
		catch(SQLException e) {
			System.out.println(e);			
			response.sendRedirect("tour_programme.jsp?ack=Some Error Occured, Please Try Later");	
			
			}
		catch(Exception e) {
			System.out.println(e);			
			response.sendRedirect("tour_programme.jsp?ack=Some Error Occured, Please Try Later");	
			
			}
		
	}
}
