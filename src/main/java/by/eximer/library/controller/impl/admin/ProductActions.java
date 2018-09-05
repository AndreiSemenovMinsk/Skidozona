package by.eximer.library.controller.impl.admin;

import by.eximer.library.service.SessionIdFactory;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
*/
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import by.eximer.library.controller.Command;
import by.eximer.library.controller.impl.JSPPagePath;
import by.eximer.library.domain.User;
import by.eximer.library.service.ServiceFactory;
import by.eximer.library.service.AdminService;
import by.eximer.library.service.exeption.ServiceException;
/** 
 * @autor Андрей Семёнов
 * @version 2.0
*/

public class ProductActions implements Command {
	
	private static final String ID_PRODUCT = "id_product";
	
		@Override
		public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String idProduct = request.getParameter(ID_PRODUCT);
			
			ServiceFactory factory = ServiceFactory.getInstance();	
			AdminService userService = factory.getAdminService();
			
			User user = null;
			System.out.println("productActions");
			final Logger log = LoggerFactory.getLogger(ProductActions.class); //final Logger log = LogManager.getLogger(BasketAll.class.getName());
			
			try {			
					String sessionId = SessionIdFactory.getSessionId();

					user = userService.productActions(Integer.parseInt(sessionId), Integer.parseInt(idProduct));
					request.setAttribute("actions", user.getActions());
					request.setAttribute("id_product", idProduct);
				
					RequestDispatcher dispatcher = request.getRequestDispatcher(JSPPagePath.PRODUCT_ACTIONS);
					dispatcher.forward(request, response);
			} catch (ServiceException e) {
				log.error("ServiceException AdminShop.java:"+e);
			} catch (Exception e) {
				log.error("Error ProductActions: "+e);
			}
		}
}
