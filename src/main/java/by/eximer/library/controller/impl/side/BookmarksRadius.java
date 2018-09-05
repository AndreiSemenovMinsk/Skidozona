package by.eximer.library.controller.impl.side;

import by.eximer.library.service.SessionIdFactory;
import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

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
import by.eximer.library.service.LocalFactory;
import by.eximer.library.service.ServiceFactory;
import by.eximer.library.service.SideService;
import by.eximer.library.service.exeption.ServiceException;

public class BookmarksRadius implements Command {

	private static final String PRODUCT_PARAM_NAME = "product_id";
	private static final String TEXT_PARAM_NAME = "text";
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idProduct;
		String text;
		
		System.out.println("InBasket");
		
		idProduct = request.getParameter(PRODUCT_PARAM_NAME);
		text = request.getParameter(TEXT_PARAM_NAME);
		
		ServiceFactory factory = ServiceFactory.getInstance();
		SideService userService = factory.getSideService();		
		
		User user = null; 
		
		final Logger log = LoggerFactory.getLogger(BookmarksRadius.class); //final Logger log = LogManager.getLogger(InBasket.class.getName());
			
		try {
			String sessionId = SessionIdFactory.getSessionId();
			
			System.out.println("InBasket sessionId "+sessionId);
			
			Locale current = LocalFactory.getCurrent();				
			ResourceBundle res = ResourceBundle.getBundle("lang.lang", current);
			
			
			user = userService.inBasket(Integer.parseInt(sessionId), Integer.parseInt(idProduct), text);
			if (user.getSuccess()) {
				response.getWriter().print("0");
			}	else {
				response.getWriter().print("1");
			}
			
		} catch (ServiceException e) {
			//goToPage = JSPPagePath.ERROR_PAGE;
			log.error("ServiceException inBasket.java:"+e);
			e.printStackTrace();
		}
		catch (Exception e) {
			//goToPage = JSPPagePath.ERROR_PAGE;
			log.error("Error inBasket: "+e);
			e.printStackTrace();
		}
	}
}
