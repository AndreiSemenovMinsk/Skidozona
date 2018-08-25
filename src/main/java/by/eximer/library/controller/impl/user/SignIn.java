package by.eximer.library.controller.impl.user;

import by.eximer.library.service.SessionIdFactory;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
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

public class SignIn implements Command{

	private static final String LOGIN_PARAM_NAME = "login";
	private static final String PASSWORD_PARAM_NAME = "password";
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String login;
		String password;
		
		login = request.getParameter(LOGIN_PARAM_NAME);
		password = request.getParameter(PASSWORD_PARAM_NAME);
		
		final Logger log = LoggerFactory.getLogger(SignIn.class); //
		
		ServiceFactory factory = ServiceFactory.getInstance();
		
		UserService userService = factory.getUserService();
		
		User user = null;
		//String goToPage = null;

		try 
		{
			user = userService.signin(login, password);
			
			if (user != null && !(user.getSessionId()==null)) {
				
				  // Отличие от UpdateUserQR из-за того, то там считыватся QR  с мобилы и он правильный, а тут - с сайта и он не правильный
					String sessionIdComp = SessionIdFactory.getSessionId();
					
					response.getWriter().print("0@"+user.getSessionId()+"@"+user.getAccess());
						
					user = userService.updateUserQR(sessionIdComp, user.getSessionId());
										
					request.setAttribute("errorMessage", "incorrect login or password");
				} else {
					response.getWriter().print("1@");
				}
			
		} catch (ServiceException e) {
			//goToPage = JSPPagePath.ERROR_PAGE;
			// log
			System.out.println("******");
			e.printStackTrace();
		}
		
		//System.out.println("!!!!!!!!!!!"+goToPage);
		//RequestDispatcher dispatcher = request.getRequestDispatcher(goToPage);
		
		//dispatcher.forward(request, response);
	}

}
