

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ChangeLanguageServlet
 */
@WebServlet("/ChangeLanguageServlet")
public class ChangeLanguageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("ChangeLanguageServlet doGet called");
		String language = request.getParameter("language");
		System.out.println("language = "+language);
        HttpSession session = request.getSession();
        session.setAttribute("language", language);
        response.sendRedirect("index.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("ChangeLanguageServlet doPost called");

		String language = request.getParameter("language");
		System.out.println("language = "+language);
        HttpSession session = request.getSession();
        session.setAttribute("language", language);
        response.sendRedirect("index.jsp");
	}

}
