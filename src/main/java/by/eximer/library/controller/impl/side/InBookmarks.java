package by.eximer.library.controller.impl.side;

import by.eximer.library.service.SessionIdFactory;
import java.io.IOException;
//import java.util.Locale;
//import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
*/
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import by.eximer.library.controller.Command;
import by.eximer.library.domain.User;
//import by.eximer.library.service.LocalFactory;
import by.eximer.library.service.ServiceFactory;
import by.eximer.library.service.SideService;
import by.eximer.library.service.exeption.ServiceException;

public class InBookmarks implements Command {

	private static final String PRODUCT_ID_PARAM_NAME = "product_id";
	private static final String RADIUS_PARAM_NAME = "radius";
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idProduct;
		String radius;
		
		System.out.println("InBookmarks");
				
		idProduct = request.getParameter(PRODUCT_ID_PARAM_NAME);
		radius = request.getParameter(RADIUS_PARAM_NAME);
		
		ServiceFactory factory = ServiceFactory.getInstance();
		SideService userService = factory.getSideService();		
		
		User user = null; 
		
		final Logger log = LoggerFactory.getLogger(InBookmarks.class); //final Logger log = LogManager.getLogger(InBookmarks.class.getName());
			
		try {
			String sessionId = SessionIdFactory.getSessionId();
			
			System.out.println("InBookmarks sessionId "+sessionId);
			
			//Locale current = LocalFactory.getCurrent();				
			//ResourceBundle res = ResourceBundle.getBundle("lang.lang", current);
			
			
			user = userService.inBookmarks(Integer.parseInt(sessionId), Integer.parseInt(idProduct), radius);
			if (user.getSuccess()) {
				response.getWriter().print("0");
			}	else {
				response.getWriter().print("1");
			}
			
	} catch (ServiceException e) {
		//goToPage = JSPPagePath.ERROR_PAGE;
		log.error("ServiceException InBookmarks.java:"+e);
		e.printStackTrace();
	}
	catch (Exception e) {
		//goToPage = JSPPagePath.ERROR_PAGE;
		log.error("Error InBookmarks: "+e);
		e.printStackTrace();
	}
	}

}
