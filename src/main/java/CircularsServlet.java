import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;

import com.google.gson.Gson;

import customclasses.AppConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig
@WebServlet("/CircularsServlet")
public class CircularsServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("CircularsServlet doGet  called");
		String operation = req.getParameter("operation");
		System.out.println("operation " + operation);

		try {
			
			if (operation != null && operation.equalsIgnoreCase("getCircularsByCategory")) {

				System.out.println("Inside opration " + operation + " block.");
				String pageno = req.getParameter("pagenumber");
				 int pagenumber = 1;
				 if(pageno !=null && pageno.length()>0)
					 pagenumber = Integer.parseInt(pageno);

				String catid = req.getParameter("category_id");
				int cat_id = catid != null?Integer.parseInt(catid):-1;

				try {
					CircularsDAO  circular_dao = new CircularsDAO();
					HashMap<String,Object> myHashMap = circular_dao.getCircularsByCategory(cat_id,pagenumber);
					String json = new Gson().toJson(myHashMap);
					System.out.println("Json : " + json);
					resp.setContentType("application/json");
					resp.setCharacterEncoding("UTF-8");
					resp.getWriter().write(json);
				} catch (Exception e) {
					System.out.println("Excepetion occured in JpoServlet");
					e.printStackTrace();
					throw new ServletException(e);
				}
				
			}else if(operation != null && operation.equalsIgnoreCase("getAllCategory")) {
				
				
				System.out.println("Inside opration " + operation + " block.");
				try {
					
					CategoryDAO  cat_dao = new CategoryDAO();
					HashMap<String,ArrayList<CategoryDO>> myHashMap = cat_dao.getAllCategory();
					String json = new Gson().toJson(myHashMap);
					System.out.println("Json : " + json);
					resp.setContentType("application/json");
					resp.setCharacterEncoding("UTF-8");
					resp.getWriter().write(json);
				} catch (Exception e) {
					System.out.println("Excepetion occured in CircularsServlet");
					e.printStackTrace();
					throw new ServletException(e);
				}
			}
			else {
				
				resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Wrong Operation");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("CircularsServlet doPost called");
		String operation = req.getParameter("operation");
		System.out.println("operation " + operation);		
		
		String lastrecordId = "-1";
		
		if(operation.equals("insertNewCircular")) {			
			
			try {				
				
				String fileExtension="";
				String filePath = "";

				String cat_id = req.getParameter("categorydropdown").trim();			
				System.out.println("cat_id : "+cat_id);
				
				String ltr_date = req.getParameter("txt-ltr-date").trim();
				System.out.println("ltr_date : "+ltr_date);
				
				String ltr_no = req.getParameter("txt-ltr-no").trim();
				System.out.println("txt-ltr-no : "+ltr_no);
								
				String ltr_subject = req.getParameter("txt-ltr-subject").trim();
				System.out.println("txt-ltr-subject : "+ltr_subject);
								
				String fileName = "";
				Part p =  req.getPart("uploaddocument");		
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

						  CircularsDAO circulardao = new CircularsDAO(); 
						  int recordId = circulardao.insertNewCircular(cat_id,ltr_date,ltr_no,ltr_subject,fileName,filePath);
						  if(recordId == -1) {
							  System.out.println("Some error occured while inserting new circular");
							  deleteCustomFile(fileName,filePath);
						  }
						  else {
							  System.out.println("New Circular Record Inserted = " + recordId);					

						  }
						  
						  lastrecordId =Integer.toString(recordId);

					  } catch (Exception e) {
						  						  
						  deleteCustomFile(fileName,filePath);
						  System.out.println("Excepetion occured in CircularServlet");
						  e.printStackTrace(); 
						  throw new ServletException(e); 
					  }
				  
				  }
				
			} 
			catch (Exception e) {
				
				 System.out.println("Excepetion occured in CircularServlet");
				  e.printStackTrace(); 
				  throw new ServletException(e); 
			}
			finally {
				System.out.println("Finally called");
				 resp.setContentType("text/plain"); 
				 resp.getWriter().write(lastrecordId);
			}			
			
		}		
	}
	
	public void deleteCustomFile(String fileName,String filePath) {
		
		if(fileName.length() > 0 && filePath.length() > 0) {
			  File file = new File(filePath) ;
				// check if the file  present or not
				if(file.exists()) {
					file.delete() ;
					System.out.println("File Deleted");
				}
		  }
	}

}
