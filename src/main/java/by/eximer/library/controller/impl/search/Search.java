package by.eximer.library.controller.impl.search;

import by.eximer.library.service.SessionIdFactory;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

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
import by.eximer.library.controller.Command;
import by.eximer.library.domain.User;
import by.eximer.library.service.ServiceFactory;
import by.eximer.library.service.SearchService;
import by.eximer.library.service.exeption.ServiceException;

public class Search implements Command{
	// ��� �� ������ ����������� � ��������
	private static final String SEARCH_STRING = "search";
	private static final String MAX = "max";
	private static final String MIN = "min";
	private static final String SORT_PRICE = "sort_price";
	private static final String START = "start";
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
			String searchString;
			String max;
			String min;
			String sort_price;
			String start;
					
			searchString = request.getParameter(SEARCH_STRING);
			max = request.getParameter(MAX);
			min = request.getParameter(MIN);
			sort_price = request.getParameter(SORT_PRICE);
			start = request.getParameter(START);
			
			ServiceFactory factory = ServiceFactory.getInstance();
			SearchService userService = factory.getSearchService();
			final Logger log = LoggerFactory.getLogger(Search.class); //final Logger log = LogManager.getLogger(BasketAll.class.getName());
			
			User user = null;
			
			try {
				String sessionId = SessionIdFactory.getSessionId();
				user = userService.search(searchString, max, min, sort_price, (Integer.parseInt(start)-1)*10, 10);
				
				ArrayList<ArrayList<String>> title = user.getSearchResult();
				
				String geo = "@ arr_posh_geo = [";
				Iterator<ArrayList<String>> it = title.iterator(); 
				String str = "<table class='table_menu' id=t1>";
				
				int i = 0;
				int n = 3; // number of columns in response
				while(it.hasNext())   
				{	
					ArrayList<String> daoResp = it.next();
					
					geo += "["+daoResp.get(6)+",'"+daoResp.get(3)+"']";
					
					System.out.println(daoResp.get(8));
					
					String[] akcii_arr = daoResp.get(8).split("|");
					String akcii = "";
					for (String akcii_sub : akcii_arr)
					{
						akcii.concat(akcii_sub + "<br>");		
					}
					
					if (i%n == 0) str += "<tr>";
					str += "<td class='td_poshuk' id=a"+i+" onmouseover=\"poper("+i+");\">"+
      			  "<table><tr><td colspan=2><a class='td_poshuk' >"+	//href='map/kramas/"+daoResp.get(1)+"/magazin.php#"+daoResp.get(0)+"'
      			  "<img src='shops/"+daoResp.get(1)+"/" +daoResp.get(0) +daoResp.get(5)+"' style='width:200px;height:200px;'></a>"+
      			  "</td></tr><tr><td>"+daoResp.get(3)+"</td><td>"+daoResp.get(4)+"</td></tr><tr><td>" 
      			  +daoResp.get(2)+"</td><td>" + akcii + "</td></tr><tr><td>"+daoResp.get(7)+"</td><td id=posh_dist"+i+"></td></tr><tr><td>"+
      			  "<a onmousedown='document.getElementById(prev_id).style.display=\"none\";"+
      			  "prev_id=\"bid"+daoResp.get(1)+"_"+daoResp.get(0)+"\";document.getElementById(prev_id).style.display=\"block\";prev_id_show=true;'>"+ //this.parentNode.getElementsByTagName(\"P\")[0].style.display=\"block\"
      			  "<img src=images/basket1.png width=30px heigth=30px></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
      			  //"<a onmousedown='this.parentNode.getElementsByTagName(\"P\")[1].style.display=\"block\";"+
      			  //"prev_id_show=true;prev_id=\"zid"+daoResp.get(1)+"_"+daoResp.get(0)+"\";'>"+
      			  "<a onmousedown='document.getElementById(prev_id).style.display=\"none\";"+
    			  "prev_id=\"zid"+daoResp.get(1)+"_"+daoResp.get(0)+"\";document.getElementById(prev_id).style.display=\"block\";prev_id_show=true;'>"+
    			  "<img src=images/zakladka1.png  width=30px heigth=30px></a>"+
      			  "<p style='display:none;' id=bid"+daoResp.get(1)+"_"+daoResp.get(0)+" onmousedown='prev_id_show=true;'><textarea></textarea>"+
    			  "<button  onmousedown=\"in_basket("+daoResp.get(0)+
      			  ",this.parentNode.getElementsByTagName('TEXTAREA')[0].value);\">��������</button></p>"+
      			  
      			  "<p style='display:none;' id=zid"+daoResp.get(1)+"_"+daoResp.get(0)+"  onmousedown='prev_id_show=true;'><select>"+
      			  "<option value='0'>��� �����������</option>\r\n" + 
      			  "<option value='50'>50 �</option>\r\n" + 
      			  "<option value='100'>100 �</option>\r\n" + 
      			  "<option value='200'>200 �</option>\r\n" + 
      			  "<option value='500'>500 �</option></select>"+
      			  "<button  onmousedown=\"in_bookmarks("+daoResp.get(0)+", this.parentNode.getElementsByTagName('SELECT')[0].value);\">��������</button></p>"+
      			  "</td></tr></table>"+
      			  "</td>";
                  if (i%n ==n-1) str += "</tr>";
					
					/*response.getWriter().print("<td><tr><table><tr><td>" + daoRespArr[0]+"</td><td>"+daoRespArr[1]+
							"<button onmousedown='take_book("+daoRespArr[2]+");'>�������</button></td></tr></table></td></tr>");*/
				} 
				str += "</table>";
				geo += "]; mapping2(lng, lat, arr_posh_geo, 'posh_dist');  ";
				response.getWriter().print(str + geo);
			} catch (ServiceException e) {
				//goToPage = JSPPagePath.ERROR_PAGE;
				log.error("ServiceException Search.java:"+e);
				e.printStackTrace();
			}
			catch (Exception e) {
				//goToPage = JSPPagePath.ERROR_PAGE;
				log.error("ServiceException Search.java:"+e);
				e.printStackTrace();
			}
			//System.out.println("!!!!!!!!!!!"+goToPage);
			//RequestDispatcher dispatcher = request.getRequestDispatcher(goToPage);			
			//dispatcher.forward(request, response);
		}
}
