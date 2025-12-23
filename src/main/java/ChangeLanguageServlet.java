

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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
