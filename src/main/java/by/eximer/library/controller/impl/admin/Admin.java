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

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import by.eximer.library.controller.Command;
import by.eximer.library.controller.impl.JSPPagePath;
import by.eximer.library.domain.User;
import by.eximer.library.service.ServiceFactory;
import by.eximer.library.service.AdminService;

public class Admin implements Command{
	
	//private String testString;

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		final Logger log = LoggerFactory.getLogger(Admin.class); //final Logger log = LogManager.getLogger(BasketAll.class.getName());
		
		System.out.println("Admin++");
		
		
		ServiceFactory factory = ServiceFactory.getInstance();
		AdminService userService = factory.getAdminService();
		User user = null;
	
		//testString = "wfdfgf";

		//System.out.println(testString);
		
		try {	
			String sessionId = SessionIdFactory.getSessionId();
			
			user = userService.admin(Integer.parseInt(sessionId));
			
			ArrayList<ArrayList<String>> types = user.getTypes();	
			Iterator<ArrayList<String>> itT = types.iterator();
			
			String selector = "<select>";
			
			while(itT.hasNext())   
			{
				ArrayList<String> daoResp = itT.next();
				selector += "<option value="+daoResp.get(1)+">"+daoResp.get(0)+"</option> ";
			}
			selector += "</select>";
			
			request.setAttribute("selector", selector);
			request.setAttribute("testString", "okokoko");
			RequestDispatcher dispatcher = request.getRequestDispatcher(JSPPagePath.ADMIN);
			dispatcher.forward(request, response);
			
		} catch (ServletException| IOException e) {
			
			log.error("ServiceException Admin.java:"+e);
			e.printStackTrace();
		}
		catch (Exception e) {
			
			log.error("ServiceException Admin.java:"+e);
			e.printStackTrace();
		}
	}

}
