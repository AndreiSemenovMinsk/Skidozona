package by.eximer.library.controller.impl.admin;

import by.eximer.library.service.AdminService;
import by.eximer.library.service.LocalFactory;
import by.eximer.library.service.ServiceFactory;
import by.eximer.library.service.SessionIdFactory;
import by.eximer.library.service.exeption.ServiceException;

import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import by.eximer.library.controller.Command;
import by.eximer.library.domain.User;

public class AddProductAction implements Command {

private static final String ID_PRODUCT_PARAM_NAME = "id_product";
private static final String ID_ACTION_PARAM_NAME = "id_action";
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idProduct;
		String idAction;
		
		idProduct = request.getParameter(ID_PRODUCT_PARAM_NAME);
		idAction = request.getParameter(ID_ACTION_PARAM_NAME);
		
		ServiceFactory factory = ServiceFactory.getInstance();
		AdminService userService = factory.getAdminService();		
		
		User user = null; 
		
		final Logger log = LoggerFactory.getLogger(AddProductAction.class); //final Logger log = LogManager.getLogger(InBasket.class.getName());
			
		try {
			String sessionId = SessionIdFactory.getSessionId();
			
			System.out.println("AddProductActions sessionId "+sessionId);
			
			Locale current = LocalFactory.getCurrent();				
			ResourceBundle res = ResourceBundle.getBundle("lang.lang", current);
			
			user = userService.addProductAction(Integer.parseInt(sessionId), Integer.parseInt(idProduct),  idAction);
			if (user.getSuccess()) {
				response.getWriter().print("0");
			}	else {
				response.getWriter().print("1");
			}
			
	} catch (ServiceException e) {
		//goToPage = JSPPagePath.ERROR_PAGE;
		log.error("ServiceException AddProductAction.java:"+e);
		e.printStackTrace();
	}
	catch (Exception e) {
		//goToPage = JSPPagePath.ERROR_PAGE;
		log.error("Error AddProductAction: "+e);
		e.printStackTrace();
	}
	}
}
