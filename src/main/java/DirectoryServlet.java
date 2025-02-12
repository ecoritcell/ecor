

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customclasses.ConfigLoader;

import java.io.OutputStream;
import java.net.URLEncoder;
import java.io.FileInputStream;
/**
 * Servlet implementation class DirectoryServlet
 */
@WebServlet("/DirectoryServlet")
public class DirectoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String BASE_DIRECTORY = "";
	private static String DIVISION = "";
	private static String DIAGRAM = "";
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String div = request.getParameter("div");
		String diagram = request.getParameter("diagram");
		String path = request.getParameter("path");
		
		if(diagram == null)
			diagram = "";
		
		if(div == null)
			div = "";

		DIVISION = div;
		DIAGRAM = diagram;
		BASE_DIRECTORY = getBaseDirectoryPath(diagram, div);
		
		
		//System.out.println("BASE_DIRECTORY = "+BASE_DIRECTORY);
		
        if (path == null || path.isEmpty()) {
            path = BASE_DIRECTORY;
        } else {
           // path = BASE_DIRECTORY + File.separator + path;
        	path = BASE_DIRECTORY +  path;
        	path = path.replace("/", "\\");
        }

       // System.out.println("path = " + path);
        File directory = new File(path);
        if (directory.exists() && directory.isDirectory()) {
            displayDirectory(response, directory, path);
        } else if (directory.exists() && directory.isFile()) {
            downloadFile(response, directory);
        } else {
            response.getWriter().println("<h3>Invalid path!</h3>");
        }
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	
	
	private String getBaseDirectoryPath(String diagram,String div) {
		
		String baseDirString = "";
		
		ConfigLoader config = new ConfigLoader();
		
		if(diagram.equalsIgnoreCase("SYD")) { //SYD FOR STATION YARD DIAGRAM
			
			if(div.equalsIgnoreCase("KUR")) {
				baseDirString = config.getProperty("live.kursyd.folderpath"); 
			}else if (div.equalsIgnoreCase("SBP")) {
				baseDirString = config.getProperty("live.sbpsyd.folderpath");
			}else if (div.equalsIgnoreCase("WAT")) {
				baseDirString = config.getProperty("live.watsyd.folderpath");
			}

			
		}else if (diagram.equalsIgnoreCase("SD")) { //STATION DIAGRAM
			
			if(div.equalsIgnoreCase("KUR")) {
				baseDirString = config.getProperty("live.kurstndiagram.folderpath"); 
			}else if (div.equalsIgnoreCase("SBP")) {
				baseDirString = config.getProperty("live.sbpstndiagram.folderpath");
			}else if (div.equalsIgnoreCase("WAT")) {
				baseDirString = config.getProperty("live.watstndiagram.folderpath");
			}
			
		}else if (diagram.equalsIgnoreCase("LG")) { //LC GATE
			
			if(div.equalsIgnoreCase("KUR")) {
				baseDirString = config.getProperty("live.kurlcgate.folderpath"); 
			}else if (div.equalsIgnoreCase("SBP")) {
				baseDirString = config.getProperty("live.sbplcgate.folderpath");
			}else if (div.equalsIgnoreCase("WAT")) {
				baseDirString = config.getProperty("live.watlcgate.folderpath");
			}
			
		}else if (diagram.equalsIgnoreCase("AS")) { //AUTO SIGNAL
			
			if(div.equalsIgnoreCase("KUR")) {
				baseDirString = config.getProperty("live.kuras.folderpath"); 
			}else if (div.equalsIgnoreCase("WAT")) {
				baseDirString = config.getProperty("live.watas.folderpath");
			}
			
		}else {
			
		}
	
		
		return baseDirString;
		
		
	}
	
	  private void displayDirectory(HttpServletResponse response, File directory, String currentPath) throws IOException {
	        
		  	response.setContentType("text/html");
		  	// System.out.println("currentPath = " +currentPath);
	        //String relativePath = currentPath.replace(BASE_DIRECTORY, "").replace("\\", "/");
		  	String relativePath = currentPath.replace(BASE_DIRECTORY, "").replace("\\", "/");
		  	// System.out.println("relativePath = " +relativePath);

	        try (OutputStream out = response.getOutputStream()) {
	            out.write(("<html><body>").getBytes());
	            out.write(("<h2>Directory: " + relativePath + "</h2>").getBytes());
	            out.write(("<ul>").getBytes());

	            // Go back option
	            if (!relativePath.isEmpty()) {
	                String parentPath = relativePath.lastIndexOf("/") > 0 ? relativePath.substring(0, relativePath.lastIndexOf("/")) : "";
	                out.write(("<li><a href='DirectoryServlet?div="+DIVISION+"&diagram="+DIAGRAM + "&path=" + parentPath + "' style=\"text-decoration: none;\">&#11013; Back</a></li>").getBytes());
	            }

	            File[] files = directory.listFiles();
	            if (files != null) {
	                for (File file : files) {
	                    String filePath = (relativePath.isEmpty() ? "" : relativePath + "/") + file.getName();
	                  //  System.out.println("filePath = " + filePath);
	                    if (file.isDirectory()) {
	                        out.write(("<li>&#128194 <a href='DirectoryServlet?div="+DIVISION+"&diagram="+DIAGRAM +"&path=" + filePath + "' style=\"text-decoration: none;\">" + file.getName() + "</a></li>").getBytes());
	                    } else {
	                        out.write(("<li>&#128196; <a href='DirectoryServlet?div="+DIVISION+"&diagram="+DIAGRAM + "&path="+filePath + "' style=\"text-decoration: none;\" target='_blank'>" + file.getName() + "</a></li>").getBytes());
	                    }
	                   // System.out.println("<li>&#128194 <a href='DirectoryServlet?path=" + filePath + "' style=\"text-decoration: none;\">" + file.getName() + "</a></li>");
	                    
	                }
	            }

	            out.write(("</ul></body></html>").getBytes());
	        }
	    }

	    private void downloadFile(HttpServletResponse response, File file) throws IOException {
	    	
	    	 response.setContentType(getServletContext().getMimeType(file.getName()));
//	        response.setContentType("application/octet-stream");
	       // response.setHeader("Content-Disposition", "attachment; filename=\"" + URLEncoder.encode(file.getName(), "UTF-8") + "\"");
	    	 response.setHeader("Content-Disposition", "filename=\"" + URLEncoder.encode(file.getName(), "UTF-8") + "\"");
	        response.setContentLength((int) file.length());

	        try (FileInputStream in = new FileInputStream(file); OutputStream out = response.getOutputStream()) {
	            byte[] buffer = new byte[1024];
	            int bytesRead;
	            while ((bytesRead = in.read(buffer)) != -1) {
	                out.write(buffer, 0, bytesRead);
	            }
	        }
	    }

}
