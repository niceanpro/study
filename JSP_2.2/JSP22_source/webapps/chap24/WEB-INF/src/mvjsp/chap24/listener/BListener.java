package mvjsp.chap24.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class BListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("B Listener ≥°");
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("B Listener Ω√¿€");
	}

}
