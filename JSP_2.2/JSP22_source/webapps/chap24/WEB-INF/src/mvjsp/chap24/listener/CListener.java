package mvjsp.chap24.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class CListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("C Listener ≥°");
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("C Listener Ω√¿€");
	}

}
