

import java.awt.desktop.AboutHandler;
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

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import com.google.gson.Gson;

import customclasses.AppConfig;

/**
 * Servlet implementation class GmiServlet
 */
@MultipartConfig
@WebServlet("/JpoServlet")
public class JpoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("JpoServlet doGet  called");
		String operation = request.getParameter("operation");
		System.out.println("operation " + operation);

		if (operation != null && operation.equalsIgnoreCase("getJpoByDepartment")) {

			System.out.println("Inside opration " + operation + " block.");
			String pageno = request.getParameter("pagenumber");
			 int pagenumber = 1;
			 if(pageno !=null && pageno.length()>0)
			 {
				 pagenumber = Integer.parseInt(pageno);
			 }
			String deptid = request.getParameter("deptid");
			if(deptid == null)
				deptid = "-1";

			try {
				JpoDAO  jpodao = new JpoDAO();
				/* List<JpoDO> listAll = jpodao.getJpoByDepartment(deptid); */
				HashMap<String,Object> myHashMap = jpodao.getJpoByDepartment(deptid,pagenumber);
				/* String json = new Gson().toJson(listAll); */
				String json = new Gson().toJson(myHashMap);
				System.out.println("Json : " + json);
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(json);
			} catch (Exception e) {
				System.out.println("Excepetion occured in JpoServlet");
				e.printStackTrace();
				throw new ServletException(e);
			}
			
		}else {
	 		response.sendError(HttpServletResponse.SC_NOT_FOUND, "Wrong Operation");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("JpoServlet doPost called");
		String operation = request.getParameter("operation");
		System.out.println("operation " + operation);		
		
		String lastrecordId = "-1";
		
		if(operation.equals("insertNewJpo")) {			
			
			try {				
				
				String fileExtension="";
				String filePath = "";

				String deptid = request.getParameter("departmentdropdown");
				if(deptid != null && deptid.length() >0)
					deptid = deptid.trim();
				System.out.println("deptid : "+deptid);
				
				String departmentname = request.getParameter("departmentname").trim();
				System.out.println("departmentname : "+departmentname);
				
				String jposlno = request.getParameter("txtjposlno").trim();
				System.out.println("jposlno : "+jposlno);
								
				String jposubject = request.getParameter("txtjposubject").trim();
				System.out.println("jposubject : "+jposubject);
								
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

						  JpoDAO jpodao = new JpoDAO(); 
						  int recordId = jpodao.insertNewJpo(jposlno,departmentname,deptid,jposubject,fileName,filePath);
						  System.out.println("New Jpo Record Inserted = " + recordId);					
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
						  
						  System.out.println("Excepetion occured in JpoServlet");
						  e.printStackTrace(); 
						  throw new ServletException(e); 
					  }
				  
				  }
				
			} 
			catch (Exception e) {
				
				 System.out.println("Excepetion occured in JpoServlet");
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
