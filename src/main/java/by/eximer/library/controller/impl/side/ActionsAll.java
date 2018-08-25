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
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ServiceFactory factory = ServiceFactory.getInstance();		
		SideService userService = factory.getSideService();

		final Logger log = LoggerFactory.getLogger(ActionsAll.class);
		
		User user = null;
		
		try {
				String sessionId = SessionIdFactory.getSessionId();
				
				Locale current = LocalFactory.getCurrent();				
				ResourceBundle res = ResourceBundle.getBundle("lang.lang", current);
				
				
				user = userService.actionsAll(Integer.parseInt(sessionId));

				ArrayList<ArrayList<ArrayList<String>>> updateAkciiList = user.getUpdateActionsList();	
				Iterator<ArrayList<ArrayList<String>>> itUpdateAkciiList = updateAkciiList.iterator(); 
				
				response.getWriter().print("<table class='table_menu' id=akc1>");
				int i = 0;
				ArrayList<String> geoLocation = new ArrayList<String>();
				
				while(itUpdateAkciiList.hasNext())   
				{	
					response.getWriter().print("<tr><td id=akc_geo"+i+" onmouseover=\"poper("+i+");\"><table><tr><td id=akc_dist"+i+"></td></tr>");
					
					ArrayList<ArrayList<String>> shop = itUpdateAkciiList.next();
					Iterator<ArrayList<String>> it2 = shop.iterator(); 

					while(it2.hasNext())   
					{
						ArrayList<String> daoResp = it2.next();
						
					response.getWriter().print("<tr><td>"+daoResp.get(3) +"</td><td>"+res.getString("action")+": </td><td>"+daoResp.get(4) +"</td>"+
							//"<td>Рекомендовать:</td><td> покажите другу QR <button onmousedown='qr_shower(\"qr_generator.php?id=123\");'>"+
							//"<img src=images/qr.png width=25px width=25px></button></td><td>  </td>"+
							"</tr><tr><td colspan=2><p onmousedown='strelka(\""+res.getString("reminder_radius") +" \", this);'>"+res.getString("reminder_radius") +
							" &#9660;</p><p style='display:none;'><select onchange='add_circle(this.value, ["
							+daoResp.get(0) +"],\""+daoResp.get(1) +"\",\"akcii_radius\","+daoResp.get(2)+");'>"+
							"<option value=0>"+res.getString("without_reminders") +"</option>"+
							"<option value=50>50 м</option>"+
							"<option value=100>100 м</option>"+
							"<option value=200>200 м</option>"+
							"<option value=500>500 м</option>"+
							"</select></p></td><td>"+daoResp.get(5)+"</td><td></td>"+
							/*"<td>либо введите логин друга:</td><td><input type=text><button onmousedown='sarafan_login("+
							daoResp.get(6)+", this.parentNode.getElementByTagName(\"INPUT\")[0]);'>Отправить</button></td>"+*/
							"</tr><hr color=green>");
				
					geoLocation.add(daoResp.get(0)+",'"+daoResp.get(1)+"','"+daoResp.get(2)+"'");
					}
					/*response.setContentType("text/html");
					String node = "eedeed";
					request.getRequestDispatcher("link.html").include(request, response);
					HttpSession session=request.getSession();
					session.setAttribute("name", node);*/
					i++;
					response.getWriter().print("</table></td></tr>");
				}
				
				response.getWriter().print("</table>@ arr_akc_geo = [");
				for(String geo : geoLocation) {
					response.getWriter().print("["+geo+"],");
				}
				
				response.getWriter().print("];  mapping2(lng, lat, arr_akc_geo, 'akc_dist'); ");
			
		} catch (ServiceException e) {
			//goToPage = JSPPagePath.ERROR_PAGE;
			log.error("ServiceException ActionsAll.java:"+e);
			e.printStackTrace();
		}
		catch (Exception e) {
			//goToPage = JSPPagePath.ERROR_PAGE;
			log.error("Error ActionsAll.java: "+e);
			e.printStackTrace();
		}
	}

}
