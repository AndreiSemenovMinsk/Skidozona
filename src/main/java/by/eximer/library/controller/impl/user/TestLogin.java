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

public class TestLogin implements Command{

	private static final String LOGIN = "login";
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String login;
				
		login = request.getParameter(LOGIN);
	
		final Logger log = LoggerFactory.getLogger(TestLogin.class); //
		ServiceFactory factory = ServiceFactory.getInstance();
		
		UserService userService = factory.getUserService();
		
		User user = null;
		//String goToPage = null;
		
		System.out.println("testLogin "+login);
		
		try {	
			String sessionId = SessionIdFactory.getSessionId();
			user = userService.testlogin(login);
			
			if (user != null) {
					//goToPage = JSPPagePath.TEST_LOGIN;
				System.out.println(user.getTestLogin()+(user.getTestLogin().equals("0")));
					if (user.getTestLogin().equals("0")) {
						//request.setAttribute("innerHTML", "0");
						response.getWriter().print("0");
					} else {
						//request.setAttribute("innerHTML", "1");
						response.getWriter().print("1");
					}
			} else {
				response.getWriter().print("1");
				//request.setAttribute("errorMessage", "incorrect login or password");
				//goToPage = JSPPagePath.MAIN_PAGE;
			}
		} catch (ServiceException e) {
			//goToPage = JSPPagePath.ERROR_PAGE;
			// log
			e.printStackTrace();
		}
		
		//RequestDispatcher dispatcher = request.getRequestDispatcher(goToPage);
		
		//dispatcher.forward(request, response);
	}

}
