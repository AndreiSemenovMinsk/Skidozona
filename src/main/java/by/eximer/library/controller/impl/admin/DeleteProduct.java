package by.eximer.library.controller.impl.admin;

import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import by.eximer.library.controller.Command;
import by.eximer.library.controller.impl.side.InBasket;
import by.eximer.library.domain.User;
import by.eximer.library.service.LocalFactory;
import by.eximer.library.service.ServiceFactory;
import by.eximer.library.service.SessionIdFactory;
import by.eximer.library.service.AdminService;
import by.eximer.library.service.exeption.ServiceException;

public class DeleteProduct implements Command {

	private static final String PRODUCT_PARAM_NAME = "id_product";
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	String idProduct;
	
	System.out.println("DeleteProduct");
	
	idProduct = request.getParameter(PRODUCT_PARAM_NAME);
	
	ServiceFactory factory = ServiceFactory.getInstance();
	AdminService userService = factory.getAdminService();		
	
	User user = null; 
	
	final Logger log = LoggerFactory.getLogger(InBasket.class); //final Logger log = LogManager.getLogger(InBasket.class.getName());
		
	try {
		String sessionId = SessionIdFactory.getSessionId();
		
		System.out.println("DeleteProduct sessionId "+sessionId);
		
		Locale current = LocalFactory.getCurrent();				
		ResourceBundle res = ResourceBundle.getBundle("lang.lang", current);
		
		user = userService.deleteProduct(Integer.parseInt(sessionId), Integer.parseInt(idProduct));
		
		if (user.getSuccess()) {
			response.getWriter().print("0");
		}	else {
			response.getWriter().print("1");
		}
		} catch (ServiceException e) {
			log.error("ServiceException UpdateProduct.java:"+e);
			e.printStackTrace();
		}
		catch (Exception e) {
			log.error("Error UpdateProduct: "+e);
			e.printStackTrace();
		}
	}
}
