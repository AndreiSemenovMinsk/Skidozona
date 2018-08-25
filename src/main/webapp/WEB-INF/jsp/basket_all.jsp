<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.ResourceBundle" %>
<table  class='table_menu' id=korz1>
<%
ArrayList<String> shopName = (ArrayList) request.getAttribute("shopName");
ArrayList<ArrayList<ArrayList<String>>> basketAll = (ArrayList<ArrayList<ArrayList<String>>>) request.getAttribute("basketAll");
ResourceBundle res = (ResourceBundle) request.getAttribute("res");
Iterator<ArrayList<ArrayList<String>>> itBasketAll = basketAll.iterator(); 
int i = 0;
ArrayList<String> geoLocation = new ArrayList<String>();

while(itBasketAll.hasNext())   
{	
						
	ArrayList<ArrayList<String>> shop = itBasketAll.next();
	Iterator<ArrayList<String>> it2 = shop.iterator(); 
%>
<tr><td><tr><td><%=res.getString("shop") %>:</td><td><%=shopName.get(i)%></td></tr><tr><td>
<%	while(it2.hasNext())   
	{
	ArrayList<String> daoResp = it2.next(); %>
	<table  id=k<%=i%> onmouseover="poper(<%=i%>);"><tr><td id=korz_dist<%=i%>></td></tr><tr><td>
	<%=res.getString("shop")%>:</td><td><%=daoResp.get(0) %>
	</td></tr>
		<tr><td><%=res.getString("action_name")%>:</td><td><%=daoResp.get(4) %></td></tr></table>
		
	<%  geoLocation.add(daoResp.get(2)+",'"+daoResp.get(3)+"','"+daoResp.get(1)+"'");
	i++;
	} %>
	<hr color=green></td></tr>
	<%
}%>
</table>123@ arr_korz_geo = [
<%	for(String geo : geoLocation) { %>
	"["+geo+"],"
<%  }%>
	<hr color=green></td></tr>
	

]; mapping2(lng, lat, arr_korz_geo, 'korz_dist');
</table>

							