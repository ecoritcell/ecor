package customclasses;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/GMISLogin")
public class GMISLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Admin Login");
		HttpSession session=request.getSession();
		String password=request.getParameter("PASSWORD");
		String userid=request.getParameter("USERID");
		String ipAddress =  request.getRemoteAddr();
		try {
		Connection con=DBConnect.getConnection();
		PreparedStatement ps=con.prepareStatement("SELECT userid FROM gmis_user WHERE userid LIKE ? AND password LIKE ?");
		ps.setString(1,userid);
		ps.setString(2,password);
		ResultSet rs=ps.executeQuery();
		System.out.println("exec query");
		if(rs.next()) {
		    ps=con.prepareStatement("insert into gmis_log(userid,password,ip_address,log_time) values(?,?,?,sysdate())");
			ps.setString(1,userid);
			ps.setString(2, password);
			ps.setString(3, ipAddress);
		    ps.executeUpdate();
			System.out.println("Logged in Successfully"+rs.getString(1));
			session.setAttribute("userid", rs.getString(1));			
			response.sendRedirect("./appointment_form.jsp");	
			
			
		}else {
			response.sendRedirect("index.html?bpt_ack=Invalid Credentials,Try again!");	
		}
		}catch(SQLException e) {
			System.out.println(e);			
			request.setAttribute("bpt_ack", "Some Error Occured, Please Try Later");
			request.getRequestDispatcher("login.jsp").forward(request, response);	
			
			}
		catch(Exception e) {
			System.out.println(e);			
			request.setAttribute("bpt_ack", "Some Error Occured, Please Try Later");
			request.getRequestDispatcher("login.jsp").forward(request, response);	
			
			}
	}

}
