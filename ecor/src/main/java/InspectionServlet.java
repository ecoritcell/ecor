

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
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
import javax.servlet.http.Part;

import com.google.gson.Gson;

import customclasses.AppConfig;

/**
 * Servlet implementation class GmiServlet
 */
@MultipartConfig
@WebServlet("/InspectionServlet")
public class InspectionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("InpsectionServlet doGet  called");
		String operation = request.getParameter("operation");
		System.out.println("operation " + operation);

		if (operation != null && operation.equalsIgnoreCase("loadAllInspection")) {

			System.out.println("Inside opration " + operation + "block.");
			String pageno = request.getParameter("pagenumber");
			 int pagenumber = 1;
			 if(pageno !=null && pageno.length()>0)
			 {
				 pagenumber = Integer.parseInt(pageno);
			 }

			try {
				InspectionDAO  inspdao = new InspectionDAO();
				/* List<InspectionDO> listAll = inspdao.getAllInspection(); */
				HashMap<String,Object> myHashMap = inspdao.getAllInspection(pagenumber);
				/* String json = new Gson().toJson(listAll); */
				String json = new Gson().toJson(myHashMap);
				System.out.println("Json : " + json);
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(json);
			} catch (Exception e) {
				System.out.println("Excepetion occured in GmiServlet");
				e.printStackTrace();
				throw new ServletException(e);
			}
			
		}else {
	 		response.sendError(HttpServletResponse.SC_NOT_FOUND, "Wrong Operation");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("InpsectionServlet doPost called");
		String operation = request.getParameter("operation");
		System.out.println("operation " + operation);		
		
		String lastrecordId = "-1";
		
		if(operation.equals("insertNewInspection")) {			
			
			try {				
				
				String fileExtension="";
				String filePath = "";

				String inspno = request.getParameter("txtinspno").trim();
				System.out.println("inspno : "+inspno);
				
				String insploc = request.getParameter("txtinsploc").trim();
				System.out.println("insploc : "+insploc);
								
				String inspdate = request.getParameter("txtinspdate").trim();
				System.out.println("inspdate : "+inspdate);
				
				String inspnote = request.getParameter("txtinspnote").trim();
				System.out.println("inspnote : "+inspnote);
				
				String inspcompliance = request.getParameter("txtcomplainces");
				System.out.println("inspcompliance : "+inspcompliance);
				
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
							System.out.println("Excepetion occured in GmiServlet");
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

						  InspectionDAO inspdao = new InspectionDAO(); 
						  int recordId = inspdao.insertNewInspection(inspno,insploc,inspdate,inspnote, inspcompliance,fileName,filePath);
						  System.out.println("New Inspection Record Inserted = " + recordId);					
						  lastrecordId =Integer.toString(recordId);


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
				 response.getWriter().write(lastrecordId);
			}			
			
		}
		
	}

}
