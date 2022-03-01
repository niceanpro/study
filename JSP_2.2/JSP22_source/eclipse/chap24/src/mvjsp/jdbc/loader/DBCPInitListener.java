package mvjsp.jdbc.loader;

import java.util.StringTokenizer;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class DBCPInitListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		try {
			ServletContext context = sce.getServletContext();
			String drivers = context.getInitParameter("jdbcdriver");
			StringTokenizer st = new StringTokenizer(drivers, ",");
			while (st.hasMoreTokens()) {
				String jdbcDriver = st.nextToken();
				Class.forName(jdbcDriver);
			}

			Class.forName("org.apache.commons.dbcp.PoolingDriver");
		} catch (Exception ex) {
			throw new RuntimeException(ex);
		}
		System.out.println("DBCP 초기화 완료");
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
	}

}
