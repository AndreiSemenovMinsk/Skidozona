package by.eximer.library.controller.impl.search;

import by.eximer.library.service.SessionIdFactory;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
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
import by.eximer.library.service.SearchService;
import by.eximer.library.service.ServiceFactory;
import by.eximer.library.service.exeption.ServiceException;

public class Like implements Command{
// это не должно срабатывать в одиночку
	private static final String SEARCH_STRING = "search";
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
			String searchString;
					
			searchString = request.getParameter(SEARCH_STRING);
			
			ServiceFactory factory = ServiceFactory.getInstance();
			SearchService userService = factory.getSearchService();
			
			final Logger log = LoggerFactory.getLogger(Like.class); //final Logger log = LogManager.getLogger(BasketAll.class.getName());
			User user = null;
			//String goToPage = null;
			
			System.out.println(searchString);
			
			try {
				String sessionId = SessionIdFactory.getSessionId();
				
				user = userService.like(searchString);
				
				ArrayList<ArrayList<String>> title = user.getSearchResult();
				Iterator<ArrayList<String>> it = title.iterator(); 
				
				while(it.hasNext())   
				{	
					ArrayList<String> daoResp = it.next();
					
					response.setContentType("text/html");
					
					response.getWriter().print("<a onmousedown=\"search_text=document.getElementById('inputSearch').value; search_kategorii();\">"+daoResp.get(0)+"</a>@");
					
					/*String node = "eedeed";
					request.getRequestDispatcher("link.html").include(request, response);
					HttpSession session=request.getSession(false);
					HttpSession session=request.getSession();
					session.setAttribute("name", node);
					if(session!=null){
					String name=(String)session.getAttribute("name");					
					response.getWriter().print("Hello, "+name+" Welcome to Profile");*/
					
				} 
			} catch (ServiceException e) {
				//goToPage = JSPPagePath.ERROR_PAGE;
				log.error("ServiceException Like.java:"+e);
				e.printStackTrace();
			}
			catch (Exception e) {
				//goToPage = JSPPagePath.ERROR_PAGE;
				log.error("ServiceException Like.java:"+e);
				e.printStackTrace();
			}
			//System.out.println("!!!!!!!!!!!"+goToPage);
			//RequestDispatcher dispatcher = request.getRequestDispatcher(goToPage);			
			//dispatcher.forward(request, response);
		}
}
