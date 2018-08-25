package by.eximer.library.controller.impl.admin;

import by.eximer.library.service.SessionIdFactory;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

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
import by.eximer.library.service.AdminService;
import by.eximer.library.service.exeption.ServiceException;

public class Sound implements Command {
// роли название - определить роли - пользоваьтель под какой роллью что будет уметь делать - написать на бумаге
	// имея таколе описание можно будет написать план, залогиниться, зарегаться, переключать локаль,
	// продумать разницу между юзером и админом магазина - и написать это на бумаге
	// нжно смотреть код внимательно 
	
	//конспект по вопросам
	// комменты
	private static final String ID_PRODUCT_BUYER = "id_product_buyer";
		@Override
		public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String searchString = request.getParameter(ID_PRODUCT_BUYER);
			final Logger log = LoggerFactory.getLogger(Sound.class); //final Logger log = LogManager.getLogger(BasketAll.class.getName());
			
			ServiceFactory factory = ServiceFactory.getInstance();
			AdminService userService = factory.getAdminService();
			
			User user = null;
			
			try {
				String sessionId = SessionIdFactory.getSessionId();
					/*
					ArrayList<ArrayList<String>> sound = user.getSound();	
					Iterator<ArrayList<String>> itSound = sound.iterator(); 
					response.getWriter().print("<table>");
					
					while(itSound.hasNext())   
					{	
						ArrayList<String> daoResp = itSound.next();
						response.getWriter().print("<tr><td><table><tr><td>"+daoResp.get(0)+"</td><td>"+daoResp.get(1)+"</td><td>"+daoResp.get(2)+
								"</td><td><button onmousedown=\"remove_sound('"+daoResp.get(0)+"')\">Удалить</button></td></tr>");					
						response.getWriter().print("</table></td></tr>");
					}
					response.getWriter().print("</table>");
					*/
					user = userService.sound(Integer.parseInt(sessionId));
					
					ArrayList<ArrayList<String>> soundTovar = user.getSoundProduct();	
					Iterator<ArrayList<String>> itSoundTovar = soundTovar.iterator(); 
					response.getWriter().print("<table>");
					
					while(itSoundTovar.hasNext())   
					{	
						ArrayList<String> daoResp = itSoundTovar.next();
						response.getWriter().print("<tr><td><table><tr><td>"+daoResp.get(1)+"</td><td>"+daoResp.get(0)+"</td><td>"+daoResp.get(2)+"</td></tr>"+
								"<tr><td>"+daoResp.get(1)+"</td><td>"+daoResp.get(0)+"</td>"+
								"<td><button onmousedown=\"approve_sound('"+daoResp.get(4)+"')\">Удалить</button></td></tr>");				
						response.getWriter().print("</table></td></tr>");
					}
					/*stringList.add(rs.getString(1));//product_buyer.text
					stringList.add(rs.getString(2));//product.text
					stringList.add(rs.getString(3));//product.cana
					stringList.add(rs.getString(4));//actions.text
					stringList.add(rs.getString(5));//product_buyer.id*/
					response.getWriter().print("</table>");
				
			} catch (IOException e) {
				
				log.error("ServiceException Admin.java:"+e);
				e.printStackTrace();
			}
			catch (Exception e) {
				
				log.error("ServiceException Admin.java:"+e);
				e.printStackTrace();
			}
		}
}
