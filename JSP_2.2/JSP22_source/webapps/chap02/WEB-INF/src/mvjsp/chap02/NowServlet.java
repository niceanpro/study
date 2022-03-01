package mvjsp.chap02;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/now")
public class NowServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=euc-kr");
		Date now = new Date();

		PrintWriter writer = response.getWriter();
		writer.println("<html>");
		writer.println("<head><title>현재 시간</title></head>");
		writer.println("<body>");
		writer.println("서블릿 생성 현재 시간:");
		writer.println(now.toString());
		writer.println("</body>");
		writer.println("</html>");

		writer.close();
	}

}
