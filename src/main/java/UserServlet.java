import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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
			String pagename = request.getParameter("pagename");
			System.out.println("pagename = " +pagename);
			if(username.length()>0 && password.length()>0 && pagename.length()>0) {
				
				/*
				 * String moduleName = getModulenameFromPagename(pagename);
				 * System.out.println("moduleName = " +moduleName);
				 */
				
				try {
					UserDAO  userdao = new UserDAO();
					List<UserDO> listAll = userdao.getUserDetails(username,password,pagename);
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
							/* newSession.setAttribute("module", userdo.module); */	
						  System.out.println("userdo.pageAccess = " +userdo.pageAccess);
						  
						  Set<String> page_access = new HashSet<>();
						  page_access.addAll(Arrays.asList(userdo.pageAccess.split(",")));						  
						  System.out.println("page_access = " +page_access);
						  newSession.setAttribute("page_access", page_access);
							 						
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
	
	/*
	 * public String getModulenameFromPagename(String pagename) {
	 * 
	 * String modulename = "";
	 * if(pagename.equalsIgnoreCase("appointments_meetings.jsp")) modulename =
	 * "APT"; else if(pagename.equalsIgnoreCase("tour_programme.jsp")) modulename =
	 * "APT"; else if(pagename.equalsIgnoreCase("oqa.jsp")) modulename = "ANR"; else
	 * if(pagename.equalsIgnoreCase("jpo.jsp")) modulename = "ANR"; else
	 * if(pagename.equalsIgnoreCase("gmanr.jsp")) modulename = "ANR"; else
	 * if(pagename.equalsIgnoreCase("circular_and_policy.jsp")) modulename = "ANR";
	 * 
	 * return modulename;
	 * 
	 * }
	 */
	
	
	
}
