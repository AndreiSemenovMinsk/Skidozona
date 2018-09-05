package by.eximer.library.controller.impl.side;

import by.eximer.library.service.SessionIdFactory;
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
import by.eximer.library.service.AdminService;
import by.eximer.library.service.LocalFactory;
import by.eximer.library.service.ServiceFactory;
import by.eximer.library.service.SideService;
import by.eximer.library.service.exeption.ServiceException;

public class ActionsAll implements Command {
	

	public ArrayList<String> shopName;
	public ArrayList<ArrayList<ArrayList<String>>> actionsAll;
	public String shopString;
	public String actionNameString;
	public String descriptionString;
	public String withoutRemindersString;
	public String reminderRadiusString;
	public ArrayList<String> geoLocation;
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ServiceFactory factory = ServiceFactory.getInstance();
		SideService userService = factory.getSideService();
		
		User user = null; 
		
		final Logger log = LoggerFactory.getLogger(ActionsAll.class); //final Logger log = LogManager.getLogger(BasketAll.class.getName());
		
		try {
				String sessionId = SessionIdFactory.getSessionId();
			
				System.out.println("Корзина ActionsAll sessionId "+sessionId);
				
				Locale current = LocalFactory.getCurrent();				
				ResourceBundle res = ResourceBundle.getBundle("lang.lang", current);
				shopString = res.getString("shop");
				actionNameString = res.getString("action_name");
				descriptionString = res.getString("description");
				withoutRemindersString = res.getString("without_reminders");
				withoutRemindersString = res.getString("reminder_radius");
				
				user = userService.actionsAll(Integer.parseInt(sessionId));

				shopName = user.getShopName();
				actionsAll = user.getProductActions();
				geoLocation = new ArrayList<String>();
				Iterator<ArrayList<ArrayList<String>>> itActionsAll = actionsAll.iterator(); 
				int i = 0;
				while(itActionsAll.hasNext())   
				{	
										
					ArrayList<ArrayList<String>> shop = itActionsAll.next();
					Iterator<ArrayList<String>> it2 = shop.iterator(); 

					while(it2.hasNext())   
					{
						ArrayList<String> daoResp = it2.next();
						geoLocation.add(daoResp.get(7)+",'"+shopName.get(i)+"','"+daoResp.get(5)+"'");				
					}
					i++;
					log.info("In the ActionsAll");			
				}
		} catch (ServiceException e) {
			
			log.error("ServiceException ActionsAll.java:"+e);
			e.printStackTrace();
		}
		catch (Exception e) {
			
			log.error("Error ActionsAll: "+e);
			e.printStackTrace();
		}
	}
}
