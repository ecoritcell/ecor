

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customclasses.AppConfig;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

/**
 * Servlet implementation class ExternalDocument
 */
@WebServlet("/ExternalDocument")
public class ExternalDocument extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		 	String imageName = request.getParameter("name");
		 	String type = request.getParameter("type");
		 	String fullPathString = ""; 
		 	if(type.equalsIgnoreCase("1")) {
		 		fullPathString = AppConfig.getFilePath()+File.separator + imageName;
		 	}
		 	else if (type.equalsIgnoreCase("2")) {
		 		fullPathString = AppConfig.getManualFilePath()+File.separator + imageName;
			}
		 		
		 	if(fullPathString.length()>0) {
		 		System.out.println("fullPathString = "+fullPathString);
		        // Build the full path of the image file
		        File imageFile = new File(fullPathString);

		        // Check if the file exists
		        if (imageFile.exists()) {
		            // Set the content type based on the image type (optional)
		            response.setContentType(getServletContext().getMimeType(imageFile.getName()));

		            // Read the image file and write to the response output stream
		            FileInputStream fileInputStream = new FileInputStream(imageFile);
		            OutputStream outputStream = response.getOutputStream();

		            byte[] buffer = new byte[1024];
		            int bytesRead;
		            while ((bytesRead = fileInputStream.read(buffer)) != -1) {
		                outputStream.write(buffer, 0, bytesRead);
		            }
		            fileInputStream.close();
		            outputStream.close();
		        } else {
		            // If the file is not found, send a 404 response
		            response.sendError(HttpServletResponse.SC_NOT_FOUND, "File not found");
		        }
		 	}
		 	else {
		 		response.sendError(HttpServletResponse.SC_NOT_FOUND, "File not found");
			}
		 	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
