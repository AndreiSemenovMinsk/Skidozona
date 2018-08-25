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
//import javax.servlet.http.HttpSession;
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
import by.eximer.library.service.SideService;
import by.eximer.library.service.exeption.ServiceException;

//import org.apache.log4j.*;
/*
 * @author Андрей Семёнов
 * @param sessionId - id сессии клиента из куки
 */
public class BasketAll implements Command {
	
	public ArrayList<String> shopName;
	public ArrayList<ArrayList<ArrayList<String>>> basketAll;
	public ResourceBundle res;
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ServiceFactory factory = ServiceFactory.getInstance();
		SideService userService = factory.getSideService();
		
		User user = null; 
		
		final Logger log = LoggerFactory.getLogger(BasketAll.class); //final Logger log = LogManager.getLogger(BasketAll.class.getName());
		
		try {
				String sessionId = SessionIdFactory.getSessionId();
			
				System.out.println("Корзина BasketAll sessionId "+sessionId);
				
				Locale current = LocalFactory.getCurrent();				
				res = ResourceBundle.getBundle("lang.lang", current);
				
				user = userService.basketAll(Integer.parseInt(sessionId));

				shopName = user.getShopName();
				basketAll = user.getBasketAll();
				Iterator<ArrayList<ArrayList<String>>> itBasketAll = basketAll.iterator(); 
				
				request.setAttribute("res", res);
				request.setAttribute("shopName", shopName);
				request.setAttribute("basketAll", basketAll);
				
				/*
				response.getWriter().print("<table  class='table_menu' id=korz1>");
				int i = 0;
				ArrayList<String> geoLocation = new ArrayList<String>();
				//i = 1 / i;
				while(itBasketAll.hasNext())   
				{	
										
					ArrayList<ArrayList<String>> shop = itBasketAll.next();
					Iterator<ArrayList<String>> it2 = shop.iterator(); 

					response.getWriter().print("<tr><td><tr><td>"+res.getString("shop")+":</td><td>"+shopName.get(i)+
							"</td></tr><tr><td>");
					
					while(it2.hasNext())   
					{
						ArrayList<String> daoResp = it2.next();
						
					response.getWriter().print("<table  id=k"+i+" onmouseover=\"poper("+i+");\"><tr><td id=korz_dist"+i+"></td></tr><tr><td>"
					+res.getString("shop")+":</td><td>"+daoResp.get(0) +"</td></tr>"+							
					"<tr><td>"+res.getString("action_name")+":</td><td>"+daoResp.get(4) + "</td></tr></table>");
				
					geoLocation.add(daoResp.get(2)+",'"+daoResp.get(3)+"','"+daoResp.get(1)+"'");
					i++;
					}
					
					log.info("In the BasketAll");
					
					response.getWriter().print("<hr color=green></td></tr>");
					
				}
				
				response.getWriter().print("</table>123@ arr_korz_geo = [");
				for(String geo : geoLocation) {
					response.getWriter().print("["+geo+"],");
				}
				
				response.getWriter().print("]; mapping2(lng, lat, arr_korz_geo, 'korz_dist');  ");
				*/
		} catch (ServiceException e) {
			//goToPage = JSPPagePath.ERROR_PAGE;
			log.error("ServiceException BasketAll.java:"+e);
			e.printStackTrace();
		}
		catch (Exception e) {
			//goToPage = JSPPagePath.ERROR_PAGE;
			log.error("Error BasketAll: "+e);
			e.printStackTrace();
		}
	}

}
