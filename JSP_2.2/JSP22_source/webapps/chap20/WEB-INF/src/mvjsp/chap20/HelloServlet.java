package mvjsp.chap20;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/hello")
public class HelloServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=euc-kr");
		
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>¿ŒªÁ</title></head>");
		out.println("<body>");
		out.println("æ»≥Á«œººø‰, ");
		out.println(request.getParameter("name"));
		out.println("¥‘");
		out.println("</body></html>");
	}

}
