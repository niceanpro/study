package mvjsp.chap24.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class AListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("A Listener ≥°");
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("A Listener Ω√¿€");
	}

}
