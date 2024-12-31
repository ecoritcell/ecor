

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import customclasses.AppConfig;
import customclasses.OqaUpdateDAO;

/**
 * Servlet implementation class OqaServlert
 */
@MultipartConfig
@WebServlet("/OqaServlert")
public class OqaServlert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		

		
		System.out.println("OqaServlert doPost called");
		String operation = request.getParameter("operation");
		System.out.println("operation " + operation);		
		
		String status = "-1";
		
		if(operation.equals("updateofficerquarterdetail")) {			
			
			try {				
				
				String fileExtension="";
				String filePath = "";

				String itemid = request.getParameter("itemid").trim();
				System.out.println("itemid : "+itemid);
								
				String fileName = "";
				Part p =  request.getPart("uploaddocument");		

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
								fileName = itemid;
								fileName = fileName+"."+fileExtension;
								System.out.println("New File Name" +fileName);
								
								filePath = AppConfig.getManualFilePath()+File.separator + fileName;
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
										  //status = "Successfully updated.";
										  
										  //To maintain the last updated date
										  OqaUpdateDAO objOqaUpdateDAO  = new OqaUpdateDAO();
										  status =  objOqaUpdateDAO.updateOqaLastUpdatedItem(itemid);
										  
									  }
									  else {
										  fileName = "";
										  System.out.println("File copied failed");
										  //status = "Invalid file path.";
									  }
									 
							}
							else {
								System.out.println("Invalid file type = " +fileExtension);
								//status = "Invalid file type.";
							}
							  
						} catch (Exception e) {
							
							fileName = "";
							//status = "Exception occured please contact administrator.";
							System.out.println("Excepetion occured in OqaServlet");
							e.printStackTrace(); 
							throw new ServletException(e); 
						}
						
					}else {
						System.out.println("File name not pound.");
						//status = "File name not pound please contact administrator.";
					}

				}
				else {
					
					System.out.println("File not pound.");			
					//status = "File not pound please contact administrator.";

				}		
				
				
			} 
			catch (Exception e) {
				
				//status = "Exception occured please contact administrator.";
				 System.out.println("Excepetion occured in OqaServlet");
				  e.printStackTrace(); 
				  throw new ServletException(e); 
			}
			finally {
				
				System.out.println("Finally called");
				 response.setContentType("text/plain"); 
				 response.getWriter().write(status);

			}			
			
		}else {
			
			System.out.println("Invalid operation.");
			 response.setContentType("text/plain"); 
			 response.getWriter().write(status);

		}
		
		
	}

}
