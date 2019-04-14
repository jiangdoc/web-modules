package cn.jiangdoc.web.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
/**
 * 服务启动时的监听器
 * @author jiangdoc
 *
 */
public class ServerStartupListener implements ServletContextListener{

	public void contextInitialized(ServletContextEvent sce) {
		//将web应用名称（路径）保存到application范围中
		ServletContext application = sce.getServletContext();
		String path = application.getContextPath();
		application.setAttribute("APP_PATH", path);
	}

	public void contextDestroyed(ServletContextEvent sce) {
		
	}
	

}
