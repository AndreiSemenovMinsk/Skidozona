package by.eximer.library.controller.impl.user;

import by.eximer.library.service.SessionIdFactory;
import java.io.IOException;

//import javax.servlet.RequestDispatcher;
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
import by.eximer.library.service.ServiceFactory;
import by.eximer.library.service.UserService;
import by.eximer.library.service.exeption.ServiceException;

public class UpdateUserQR implements Command{

	private static final String ID = "id";
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sessionIdComp;
		
		sessionIdComp = request.getParameter(ID);
		
		ServiceFactory factory = ServiceFactory.getInstance();	
		UserService userService = factory.getUserService();
		
		final Logger log = LoggerFactory.getLogger(UpdateUserQR.class); //final Logger log = LogManager.getLogger(BasketAll.class.getName());
		
		User user = null;
		
		String registerWithLogin = "yes";

			try 
			{				
				String sessionId = SessionIdFactory.getSessionId();
				
				user = userService.updateUserQR(sessionId, sessionIdComp);
				
				if (user != null && user.getSuccess()) {
						response.getWriter().print("0@OK!");
					} else {
						response.getWriter().print("1@");
					}
				
			} catch (ServiceException e) {
				//goToPage = JSPPagePath.ERROR_PAGE;
				log.error("Error RegisterNoLogin.java: "+e);
				//e.printStackTrace();
			}
			
			catch (Exception e) {
				//goToPage = JSPPagePath.ERROR_PAGE;
				log.error("Error RegisterNoLogin.java: "+e);
				//e.printStackTrace();
			}
		
		//System.out.println("!!!!!!!!!!!"+goToPage);
		//RequestDispatcher dispatcher = request.getRequestDispatcher(goToPage);
		
		//dispatcher.forward(request, response);
	}

}
