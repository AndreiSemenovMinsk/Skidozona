package by.eximer.library.controller.impl.user;

import by.eximer.library.service.SessionIdFactory;
import java.io.IOException;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
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

public class RegisterNoLogin implements Command{

	private static final String LOGIN_PARAM_NAME = "login";
	private static final String PASSWORD_PARAM_NAME = "password";
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String login;
		String password;
		
		login = request.getParameter(LOGIN_PARAM_NAME);
		password = request.getParameter(PASSWORD_PARAM_NAME);
		
		ServiceFactory factory = ServiceFactory.getInstance();	
		UserService userService = factory.getUserService();
		
		final Logger log = LoggerFactory.getLogger(RegisterNoLogin.class); //final Logger log = LogManager.getLogger(BasketAll.class.getName());
		
		User user = null;
		
		String registerWithLogin = "no";

			try 
			{
				user = userService.register(login, password, "noname", "nophone"); //NoLogin -  не надо, работает стандартный метод
				
				if (user != null && !(user.getSessionId()==null)) {
						response.getWriter().print("0@"+user.getSessionId()+"@"+registerWithLogin);
					} else {
						response.getWriter().print("1@");
					}
				
			} catch (ServiceException e) {
				//goToPage = JSPPagePath.ERROR_PAGE;
				log.error("Error RegisterNoLogin.java: "+e);
				//e.printStackTrace();
			}
		
		//System.out.println("!!!!!!!!!!!"+goToPage);
		//RequestDispatcher dispatcher = request.getRequestDispatcher(goToPage);
		
		//dispatcher.forward(request, response);
	}

}
