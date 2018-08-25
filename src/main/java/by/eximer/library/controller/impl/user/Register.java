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
/*import java.util.regex.Matcher;  
import java.util.regex.Pattern; */ 

import by.eximer.library.controller.Command;
import by.eximer.library.domain.User;
import by.eximer.library.service.ServiceFactory;
import by.eximer.library.service.UserService;
import by.eximer.library.service.exeption.ServiceException;

/*
 * @param login, password, name, phone
 */
public class Register implements Command{

	private static final String LOGIN_PARAM_NAME = "login";
	private static final String PASSWORD_PARAM_NAME = "password";
	private static final String NAME_PARAM_NAME = "name";
	private static final String PHONE_PARAM_NAME = "phone";
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String login;
		String password;
		String name;
		String phone;
		
		login = request.getParameter(LOGIN_PARAM_NAME);
		password = request.getParameter(PASSWORD_PARAM_NAME);
		name = request.getParameter(NAME_PARAM_NAME);
		phone = request.getParameter(PHONE_PARAM_NAME);
		
		ServiceFactory factory = ServiceFactory.getInstance();
		UserService userService = factory.getUserService();		
		final Logger log = LoggerFactory.getLogger(Register.class); //final Logger log = LogManager.getLogger(BasketAll.class.getName());
		
		User user = null;
		
		String registerWithLogin;
		
		boolean goodPassLogin = false;
		
			registerWithLogin = "yes";
			
	        try {			
				user = userService.testlogin(login);	
				if (user != null) {
						
						if (user.getTestLogin().equals("0")) {				
							goodPassLogin = true;
						} 
				} 
			} catch (ServiceException e) {
				//goToPage = JSPPagePath.ERROR_PAGE;
				log.error("Error testlogin Register.java: "+e);
				e.printStackTrace();
			}
	        
		
		if (goodPassLogin)
		{
			try 
			{
				user = userService.register(login, password, name, phone);
				
				if (user != null && !(user.getSessionId()==null)) {
						response.getWriter().print("0@"+user.getSessionId()+"@"+registerWithLogin);
					} else {
						response.getWriter().print("1@");
					}
				
			} catch (ServiceException e) {
				//goToPage = JSPPagePath.ERROR_PAGE;
				log.error("Error register Register.java: "+e);
				//e.printStackTrace();
			}
		}
		//System.out.println("!!!!!!!!!!!"+goToPage);
		//RequestDispatcher dispatcher = request.getRequestDispatcher(goToPage);
		
		//dispatcher.forward(request, response);
	}

}
