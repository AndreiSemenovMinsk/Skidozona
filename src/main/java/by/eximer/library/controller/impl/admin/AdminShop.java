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

public class AdminShop implements Command {
	
	public ArrayList<ArrayList<ArrayList<String>>> updateShopActionsProduct;
	public ArrayList<ArrayList<String>> actions;
	public ArrayList<ArrayList<String>> types;
	
		@Override
		public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			ServiceFactory factory = ServiceFactory.getInstance();
			
			AdminService userService = factory.getAdminService();
			
			User user = null;
			System.out.println("AdminShop");
			final Logger log = LoggerFactory.getLogger(AdminShop.class); //final Logger log = LogManager.getLogger(BasketAll.class.getName());
			
			try {
				//HttpSession session=request.getSession(false);
					String sessionId = SessionIdFactory.getSessionId();

					user = userService.adminShop(Integer.parseInt(sessionId));
					
					updateShopActionsProduct = user.getUpdateShopActionsProduct();	
					actions = user.getActions();	
					types = user.getTypes();					
				
					RequestDispatcher dispatcher = request.getRequestDispatcher(JSPPagePath.ADMIN_SHOP);
					dispatcher.forward(request, response);
				
			} catch (ServiceException e) {
				log.error("ServiceException AdminShop.java:"+e);
			}
			catch (Exception e) {
				log.error("Error BasketAll: "+e);
			}
		}
}
