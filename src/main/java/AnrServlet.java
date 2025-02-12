
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.google.gson.Gson;

import customclasses.AppConfig;

/**
 * Servlet implementation class AnrServlet
 */
@MultipartConfig
@WebServlet("/AnrServlet")
public class AnrServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
//		String realPathtoUploads = request.getSession().getServletContext().getRealPath("");
//		System.out.println("realPathtoUploads = " +realPathtoUploads);


		System.out.println("AnrServlet called");
		String operation = request.getParameter("operation");
		System.out.println("operation " + operation);

		if (operation != null && operation.equalsIgnoreCase("loadYearsData")) {

			System.out.println("Inside opration " + operation + "block.");

			String fyear = request.getParameter("fyear");
			 String pageno = request.getParameter("pagenumber");
			 int pagenumber = 1;
			 if(pageno !=null && pageno.length()>0)
			 {
				 pagenumber = Integer.parseInt(pageno);
			 }
			 
			System.out.println("fyear " + fyear);
			if (fyear.length() > 0) {
				try {
					AnrDAO anrdao = new AnrDAO();
					/* List<AnrDO> anrList = anrdao.getAnrist(fyear,pagenumber); */
					HashMap<String,Object> anrMap = anrdao.getAnrist1(fyear,pagenumber);
					
					//anrList = anrdao.getAnrist(fyear,pagenumber);					
					//String json = new Gson().toJson(anrList);
					String json = new Gson().toJson(anrMap);
					System.out.println("Json : " + json);
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write(json);
				} catch (Exception e) {
					System.out.println("Excepetion occured in AnrServlet");
					e.printStackTrace();
					throw new ServletException(e);
				}
			} else {

				System.out.println("Year Not found");
			}
		} else if (operation != null && operation.equalsIgnoreCase("getDistinctYear")) {

			System.out.println("Inside opration " + operation + "block.");

			try {
				AnrDAO anrdao = new AnrDAO();
				List<String> yearList = anrdao.getDistinctYearList();
				String json = new Gson().toJson(yearList);
				System.out.println("Json : " + json);
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(json);
			} catch (Exception e) {
				System.out.println("Excepetion occured in AnrServlet");
				e.printStackTrace();
				throw new ServletException(e);
			}
		}
		else {
			System.out.println("Unknown operation called for AnrServlet");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		
		System.out.println("AnrServlet doPost called");
		String operation = request.getParameter("operation");
		System.out.println("operation " + operation);		
		
		String recordId = "-1";
		
		if(operation.equals("insertnewanr")) {
			
			
			try {				
				
				String fileExtension="";
				String filePath = "";

				String year = request.getParameter("addnewanryearselect");
				System.out.println("year : "+year);

				
				String fileSubject = request.getParameter("txtfilename").trim();
				System.out.println("fileSubject : "+fileSubject);		
				
				String fileName = "";
				Part p =  request.getPart("uploaddocument");		
				int filewritestatus = 0;

				if(p != null)
				{
					fileName = p.getSubmittedFileName();
					if( fileName.length() > 0) 
					{	
				
						try {
							
							String[] fileNameArray = fileName.split("[.]");
							System.out.println("Length" + fileNameArray.length);						
							if(fileNameArray.length > 0) {
								fileExtension = fileNameArray[fileNameArray.length -1].trim();
								System.out.println("fileExtension " + fileExtension);
							}
							
							if(fileExtension.equalsIgnoreCase("PDF")) 
							{
								
								System.out.println("Original FileName" +fileName);
								fileName = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS"));
								fileName = fileName+"."+fileExtension;
								System.out.println("New File Name" +fileName);
								
								
								filePath = AppConfig.getFilePath()+File.separator + fileName;
								  System.out.println("filePath" +filePath);
									  if(filePath.length() > 0)
									  {
										  //filePath = filePath +File.separator+ fileName; 
										  System.out.println("filePath : "+filePath);
										  InputStream iStream = p.getInputStream(); 
										  byte []filedata = new byte[iStream.available()]; 
										  iStream.read(filedata);											  
										  FileOutputStream fStream = new FileOutputStream(filePath);
										  fStream.write(filedata);
										  fStream.close();
										  System.out.println("File copied successfully");
										  filewritestatus = 1;
									  }
									  else {
										  fileName = "";
										  System.out.println("File copied failed");
									  }
									 
							}
							else {
								System.out.println("Invalid file type = " +fileExtension);
							}
							  
						} catch (Exception e) {
							
							fileName = "";
							System.out.println("Excepetion occured in NewComplainServlet");
							e.printStackTrace(); 
							throw new ServletException(e); 
						}
						
					}else {
						System.out.println("File name not pound.");
					}

				}
				else {
					
					System.out.println("File not pound.");					

				}		
				
				
				 if(filewritestatus == 1) {
					  
					  try {

						  AnrDAO anrDAO = new AnrDAO(); 
						  int anrId = anrDAO.insertNewAnr(year, fileSubject,fileName,filePath);
						  System.out.println("New Anr Record Inserted = " + anrId);					
						  recordId =Integer.toString(anrId);


					  } catch (Exception e) {
						  
						  if(fileName.length() > 0 && filePath.length() > 0) {
							  File file = new File(filePath) ;
								// check if the file  present or not
								if( file.exists()) {
									file.delete() ;
									System.out.println("File Deleted");
								}
						  }
						  
						  System.out.println("Excepetion occured in AnrServlet");
						  e.printStackTrace(); 
						  throw new ServletException(e); 
					  }
				  
				  }
				
			} 
			catch (Exception e) {
				
				 System.out.println("Excepetion occured in AnrServlet");
				  e.printStackTrace(); 
				  throw new ServletException(e); 
			}
			finally {
				

				System.out.println("Finally called");
				 response.setContentType("text/plain"); 
				 response.getWriter().write(recordId);
			}			
			
		}
						
	}
		
	
	
}
