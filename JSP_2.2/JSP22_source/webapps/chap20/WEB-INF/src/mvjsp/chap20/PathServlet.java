package mvjsp.chap20;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PathServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html; charset=euc-kr");
		PrintWriter out = resp.getWriter();
		out.println("<html><head><title>Servlet</title></head>");
		out.println("<body>");
		out.println(getServletName());
		out.println("<body></html>");
	}

}
