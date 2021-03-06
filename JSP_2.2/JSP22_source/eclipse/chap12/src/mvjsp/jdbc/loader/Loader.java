package mvjsp.jdbc.loader;

import javax.servlet.http.HttpServlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import java.util.StringTokenizer;

public class Loader extends HttpServlet {


  /**
   * 
   */
  private static final long serialVersionUID = -3488931027026677039L;

  public void init(ServletConfig config) throws ServletException {
		try {
			String drivers = config.getInitParameter("jdbcdriver");
			StringTokenizer st = new StringTokenizer(drivers, ",");
			while (st.hasMoreTokens()) {
				String jdbcDriver = st.nextToken();
				Class.forName(jdbcDriver);
			}
		} catch(Exception ex) {
			throw new ServletException(ex);
		}
	}
}
