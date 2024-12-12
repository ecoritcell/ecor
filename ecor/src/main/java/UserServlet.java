

import java.awt.desktop.AboutHandler;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.google.gson.Gson;

/**
 * Servlet implementation class GmiServlet
 */
@MultipartConfig
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("UserServlet doGet  called");
		String operation = request.getParameter("operation");
		System.out.println("operation " + operation);
		String json = "[]";
		
		if (operation != null && operation.equalsIgnoreCase("getUserDetails")) {

			System.out.println("Inside opration " + operation + " block.");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			if(username.length()>0 && password.length()>0) {
				try {
					UserDAO  userdao = new UserDAO();
					List<UserDO> listAll = userdao.getUserDetails(username,password);
		            if(listAll.isEmpty())
		            {
						json = "[{\"status\":0,\"msg\":\"Enter valid username and password.\"}]";
						System.out.println("Json:" +json);
						response.setContentType("application/json");
						response.setCharacterEncoding("UTF-8");
						response.getWriter().write(json);				

		            }
		            else {
		            	
						  UserDO userdo = listAll.get(0); 
						  HttpSession oldSession = request.getSession(false); 
						  if (oldSession != null)
							  oldSession.invalidate(); 
						  //generate a new session 
						  HttpSession newSession = request.getSession(true); 
							/* newSession.setMaxInactiveInterval(10*60); */					  
						  newSession.setAttribute("userId", userdo.userid);
						  newSession.setAttribute("userName", userdo.username);
						  newSession.setAttribute("module", userdo.module);
							 						
							json = "[{\"status\":1,\"msg\":\"Valid user.\",\"username\":\""+userdo.username+"\",\"userid\":"+userdo.userid+",\"module\":\""+userdo.module+"\"}]";
							System.out.println("Json:" +json);
							response.setContentType("application/json");
							response.setCharacterEncoding("UTF-8");
							response.getWriter().write(json);				

		            }
					
					
					
				} catch (Exception e) {
					System.out.println("Excepetion occured in JpoServlet");
					e.printStackTrace();
					throw new ServletException(e);
				}
			}
			else {
				
				
				
				json = "[{\"status\":0,\"msg\":\"Enter valid username and password.\"}]";
				System.out.println("Json before:" +json);
				Gson gson = new Gson();
				json = gson.toJson(json);
				System.out.println("Json before:" +json);
				
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(json);				

			}
		}else {
	 		response.sendError(HttpServletResponse.SC_NOT_FOUND, "Wrong Operation");
		}
	}
	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String operation = request.getParameter("operation");
		System.out.println("operation " + operation);
		
		if (operation != null && operation.equalsIgnoreCase("Logout")) {
			
			System.out.println("userservlet do post called");
			HttpSession session = request.getSession(false);
	        if (session != null) {
	            session.invalidate();
	    		System.out.println("session invalidated");
	        }
		}
	}
}
