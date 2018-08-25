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
import by.eximer.library.service.LocalFactory;
import by.eximer.library.service.ServiceFactory;
import by.eximer.library.service.SideService;
import by.eximer.library.service.exeption.ServiceException;

public class BookmarksAll implements Command {

	//private static final String SEARCH_STRING = "sessionId";
		@Override
		public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			ServiceFactory factory = ServiceFactory.getInstance();
			SideService userService = factory.getSideService();
			
			final Logger log = LoggerFactory.getLogger(BookmarksAll.class); //final Logger log = LogManager.getLogger(BookmarksAll.class.getName());
			
			User user = null;
			
			try {
					String sessionId = SessionIdFactory.getSessionId();
					
					Locale current = LocalFactory.getCurrent();				
					ResourceBundle res = ResourceBundle.getBundle("lang.lang", current);
					int session = Integer.parseInt(sessionId);
					System.out.println("BookmarksAll session"+session);
					user = userService.bookmarksAll(session);

					ArrayList<ArrayList<String>> bookmarks = user.getBookmarks();	
					Iterator<ArrayList<String>> itBookmarks = bookmarks.iterator(); 
					
					response.getWriter().print("<table class='table_menu' id=zakl1>");
					int i = 0;
					ArrayList<String> geoLocation = new ArrayList<String>();
					
					while(itBookmarks.hasNext())   
					{	
						response.getWriter().print("<tr><td id=i"+i+" onmouseover=\"poper("+i+");\"><table>");
						
						ArrayList<String> daoResp = itBookmarks.next();
						
						response.getWriter().print("<tr><td>"+daoResp.get(0) +"</td><td>"+daoResp.get(2) +"</td>"+
								"<td id=zakl_dist"+i+"></td><td><p onmousedown='strelka(\""+res.getString("reminder_radius") +" \", this);'>"
								+res.getString("reminder_radius") +" &#9660;</p>"+
								"<p style='display:none;'><select onchange='add_circle(this.value, ["+daoResp.get(5) +"],\""+daoResp.get(6) +
								"\",\"akcii_radius\","+daoResp.get(3)+");'>"+
								"<option value=0>"+res.getString("without_reminders") +"</option>"+
								"<option value=50>50 ì</option>"+
								"<option value=100>100 ì</option>"+
								"<option value=200>200 ì</option>"+
								"<option value=500>500 ì</option>"+
								"</select></p></td></tr></table></td></tr>");
					
						geoLocation.add(daoResp.get(5)+",'"+daoResp.get(6)+"','"+daoResp.get(4)+"'");
						
						/*response.setContentType("text/html");
						String node = "eedeed";
						request.getRequestDispatcher("link.html").include(request, response);
						HttpSession session=request.getSession();
						session.setAttribute("name", node);*/
						i++;
						
					}
					
					response.getWriter().print("</table>@ arr_zakl_geo = [");
					for(String geo : geoLocation) {
						response.getWriter().print("["+geo+"],");
					}
					
					response.getWriter().print("];  mapping2(lng,lat, arr_zakl_geo, 'zakl_dist'); ");
			} catch (ServiceException e) {
				//goToPage = JSPPagePath.ERROR_PAGE;
				log.error("ServiceException BookmarksAll.java:"+e);
				e.printStackTrace();
			}
			catch (Exception e) {
				//goToPage = JSPPagePath.ERROR_PAGE;
				log.error("Error BookmarksAll.java: "+e);
				e.printStackTrace();
			}
		}

}
