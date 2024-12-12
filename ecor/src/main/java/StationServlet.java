

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
import java.util.stream.Collectors;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.google.gson.Gson;
import customclasses.StationDO;


/**
 * Servlet implementation class GmiServlet
 */
@MultipartConfig
@WebServlet("/StationServlet")
public class StationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("StationServlet doGet  called");
		String operation = request.getParameter("operation");
		System.out.println("operation " + operation);

		if (operation != null && operation.equalsIgnoreCase("getStationByDivcode")) {

			System.out.println("Inside opration " + operation + " block.");
			String divisioncode = request.getParameter("divisioncode");
			if(divisioncode == null)
				divisioncode = "";

			try {
				StationDAO  stationdao = new StationDAO();
				List<StationDO> listAll = stationdao.getStationByDivisioncode(divisioncode);
				
				  ServletContext context = getServletContext();
			      context.setAttribute("stationArray", listAll);
				
				String json = new Gson().toJson(listAll);
				System.out.println("Json : " + json);
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(json);
			} catch (Exception e) {
				System.out.println("Excepetion occured in StationServlet");
				e.printStackTrace();
				throw new ServletException(e);
			}
			
		}else if (operation != null && operation.equalsIgnoreCase("search")) {
			
			try {
				
				System.out.println("Inside opration " + operation + " block.");
				String searchquery = request.getParameter("searchquery");
				ServletContext context = getServletContext();
				List<StationDO> listAll = (List<StationDO>) context.getAttribute("stationArray");
				 List<StationDO> results = null;
				if(searchquery.length()>0)
				{
					results = ( List<StationDO>)listAll.stream().filter(obj -> obj.getStationcode().toLowerCase().contains(searchquery) || obj.getStationdesc().toLowerCase().contains(searchquery))
				                .collect(Collectors.toList());

				}
				else {
					results = listAll;
				}
				String json = "[]";
				if(results != null)
					json = new Gson().toJson(results);
				System.out.println("Json : " + json);
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(json);				
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("Excepetion occured in StationServlet");
				e.printStackTrace();
				throw new ServletException(e);
			}
			
		}
		else {
	 		response.sendError(HttpServletResponse.SC_NOT_FOUND, "Wrong Operation");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
	}

}
