package by.eximer.library.controller.impl;

import by.eximer.library.service.SessionIdFactory;
import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.RequestDispatcher;
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
import by.eximer.library.service.LocalFactory;

public class MainPage implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(JSPPagePath.MAIN_PAGE);
		
		final Logger log = LoggerFactory.getLogger(MainPage.class); //final Logger log = LogManager.getLogger(BasketAll.class.getName());
		
		try {
			Locale current = LocalFactory.getCurrent();				
			ResourceBundle res = ResourceBundle.getBundle("lang.lang", current);
			
			request.setAttribute("shop", res.getString("shop"));
			request.setAttribute("description", res.getString("description"));
			request.setAttribute("action_name", res.getString("action_name"));
			request.setAttribute("action", res.getString("action"));
			request.setAttribute("reminder_radius", res.getString("reminder_radius"));
			request.setAttribute("without_reminders", res.getString("without_reminders"));
			request.setAttribute("current", res.getString("current"));
			request.setAttribute("offers", res.getString("offers"));
			request.setAttribute("bookmarks", res.getString("bookmarks"));
			request.setAttribute("basket", res.getString("basket"));
			request.setAttribute("bind", res.getString("bind"));
			request.setAttribute("sport", res.getString("sport"));
			request.setAttribute("electronics", res.getString("electronics"));
			request.setAttribute("beauty", res.getString("beauty"));
			request.setAttribute("clothing", res.getString("clothing"));
			request.setAttribute("auto", res.getString("auto"));
			request.setAttribute("equipment", res.getString("equipment"));
			request.setAttribute("building", res.getString("building"));
			request.setAttribute("cafe", res.getString("cafe"));
			request.setAttribute("registration", res.getString("registration"));
			request.setAttribute("enter", res.getString("enter"));
			request.setAttribute("exit", res.getString("exit"));
			request.setAttribute("password", res.getString("password"));
			request.setAttribute("login", res.getString("login"));
			request.setAttribute("link_message", res.getString("link_message"));
			request.setAttribute("start_point", res.getString("start_point"));
			request.setAttribute("i_m_here", res.getString("i_m_here"));
			request.setAttribute("yes", res.getString("yes"));
			request.setAttribute("no", res.getString("no"));
			request.setAttribute("name", res.getString("name"));
			request.setAttribute("phone", res.getString("phone"));
			
			dispatcher.forward(request, response);
			
		} catch (ServletException| IOException e) {
			// TODO Auto-generated catch block
			
			log.error("ServiceException MainPage.java:"+e);
			//e.printStackTrace();
		}
		catch (Exception e) {
			// TODO Auto-generated catch block
			
			log.error("ServiceException MainPage.java:"+e);
			//e.printStackTrace();
		}
	}

}