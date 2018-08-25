package by.eximer.library.controller.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Locale;
import java.util.ResourceBundle;

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
import by.eximer.library.domain.User;
import by.eximer.library.service.ServiceFactory;
import by.eximer.library.service.LocalFactory;
import by.eximer.library.service.UserService;
import by.eximer.library.service.exeption.ServiceException;

//import org.apache.log4j.*;

public class LocalLeng implements Command {
	private static final String LENG = "leng";
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String leng = request.getParameter(LENG);
		
		ServiceFactory factory = ServiceFactory.getInstance();
		UserService userService = factory.getUserService();
		
		User user = null; 
		//String goToPage = null;
		final Logger log = LoggerFactory.getLogger(LocalLeng.class); //final Logger log = LogManager.getLogger(LocalLeng.class.getName());
		
		try {
				LocalFactory.setCurrent(leng);
				response.getWriter().print("0");
		} catch (Exception e) {
			//goToPage = JSPPagePath.ERROR_PAGE;
			log.error("Error LocalLeng: "+e);
			e.printStackTrace();
		}
	}

}
