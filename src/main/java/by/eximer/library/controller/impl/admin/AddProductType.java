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

public class AddProductType implements Command {

private static final String ID_PRODUCT_PARAM_NAME = "id_product";
private static final String ID_TYPE_PARAM_NAME = "id_type";
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idProduct;
		String idType;
		
		idProduct = request.getParameter(ID_PRODUCT_PARAM_NAME);
		idType = request.getParameter(ID_TYPE_PARAM_NAME);
		
		ServiceFactory factory = ServiceFactory.getInstance();
		AdminService userService = factory.getAdminService();		
		
		User user = null; 
		
		final Logger log = LoggerFactory.getLogger(AddProductType.class); //final Logger log = LogManager.getLogger(InBasket.class.getName());
			
		try {
			String sessionId = SessionIdFactory.getSessionId();
			
			System.out.println(idProduct);
			System.out.println(idType);
			user = userService.addProductType(Integer.parseInt(sessionId), Integer.parseInt(idProduct),  idType);
			if (user.getSuccess()) {
				response.getWriter().print("0");
			}	else {
				response.getWriter().print("1");
			}
			
	} catch (ServiceException e) {
		//goToPage = JSPPagePath.ERROR_PAGE;
		log.error("ServiceException AddProductType.java:"+e);
		e.printStackTrace();
	}
	catch (Exception e) {
		//goToPage = JSPPagePath.ERROR_PAGE;
		log.error("Error AddProductType: "+e);
		e.printStackTrace();
	}
	}
}
