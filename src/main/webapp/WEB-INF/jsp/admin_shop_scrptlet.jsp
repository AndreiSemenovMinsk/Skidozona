<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
tru@<table>
<%
ArrayList<String> actionsName = (ArrayList) request.getAttribute("actionsName");
ArrayList<ArrayList<ArrayList<String>>> updateShopActionsProduct = (ArrayList<ArrayList<ArrayList<String>>>) request.getAttribute("updateShopActionsProduct");
ArrayList<ArrayList<ArrayList<String>>> productActions = (ArrayList<ArrayList<ArrayList<String>>>) request.getAttribute("productActions");
ArrayList<ArrayList<String>> updateShopProduct = (ArrayList<ArrayList<String>>) request.getAttribute("updateShopProduct");
ArrayList<ArrayList<ArrayList<String>>> productTipy = (ArrayList<ArrayList<ArrayList<String>>>) request.getAttribute("productTipy");
ArrayList<ArrayList<String>> actions = (ArrayList<ArrayList<String>>) request.getAttribute("actions");
ArrayList<ArrayList<String>> tipy = (ArrayList<ArrayList<String>>) request.getAttribute("tipy");

Iterator <String> itActionName = actionsName.iterator();
Iterator<ArrayList<ArrayList<String>>> itUKAT = updateShopActionsProduct.iterator();
while(itUKAT.hasNext())
{
	ArrayList<ArrayList<String>> UKAT = itUKAT.next();
	Iterator<ArrayList<String>> it2 = UKAT.iterator();
%>
<br><h1><%=itActionName.next() %></h1><br>
<%	while(it2.hasNext())
	{
	ArrayList<String> daoResp = it2.next(); %>
	<tr><td><table><tr><td>Товар: <%=daoResp.get(2) %></td><td><textarea></textarea></td><td><button onmousedown='na_odobrenie(
	<%=daoResp.get(3) %>,<%=daoResp.get(1) %>, this.parentNode.getElementsByTagName(\"TEXTAREA\")[0].value);'>На адабрэнне пакупнiку</button>
	</td><td><button onmousedown='delete_product(<%=daoResp.get(3) %>);'>Удалiць тавар з акцыi</button></td></tr></table></td></tr>
<%  }
}%>
</table>
<table>
<% Iterator<ArrayList<String>> itUKT = updateShopProduct.iterator();
Iterator<ArrayList<ArrayList<String>>> itProdAct = productActions.iterator();
Iterator<ArrayList<ArrayList<String>>> itTT = productTipy.iterator();

while(itUKT.hasNext())
					{
						ArrayList<String> daoUKT = itUKT.next();%>
						<tr style='box-shadow:  0px 0px 5px 0px rgba(0, 0, 0, .45);'><td>Товар: <br><input value='' ></td>
						<td><img src=shops<%=daoUKT.get(2)%>/<%=daoUKT.get(1)%><%=daoUKT.get(3)%> width=120 height=120></td><td>
						</td><td>Назва:</td><td><input value='<%=daoUKT.get(4)%>' ><br><textarea><%=daoUKT.get(5)%></textarea></td><td><br><button onmousedown='
						update_product(<%=daoUKT.get(3)%>,this, <%=daoUKT.get(1)%>);'>
						Абнавiць тавар</button><button onmousedown='delete_product(<%=daoUKT.get(1)%>);'>Удалiць тавар</button></td>
						<td><FORM ENCTYPE="multipart/form-data" ACTION="uploadFile" METHOD=POST target=self>
						Выберите файл:<INPUT NAME="uploadFile" TYPE="file">
						<input type="hidden" name="id_shop" value='<%=daoUKT.get(2)%>'><br>
						<input type="hidden" name="id_product" value='<%=daoUKT.get(1)%>'>
						<INPUT TYPE="submit" VALUE="Загрузить"></FORM></td><td class='select_actions'>

					<%ArrayList<ArrayList<String>> tA = itProdAct.next();
						Iterator<ArrayList<String>> it3 = tA.iterator();
						while(it3.hasNext())
						{
							ArrayList<String> daoA = it3.next();
							if (!daoA.isEmpty()) {%>
							<p id=<%=daoA.get(1)%>><%=daoA.get(0)%><a onmousedown='this.parentNode.parentNode.removeChild(this.parentNode);'>Х</a></p>
							<%}
						}
						Iterator<ArrayList<String>> itA = actions.iterator();  %>
						<select>
						<%
						while(itA.hasNext())
						{
							ArrayList<String> daoA = itA.next();
							if (!daoA.isEmpty()) {%><p id=<%=daoA.get(1)%>><%=daoA.get(0)%>
							<a onmousedown='this.parentNode.parentNode.removeChild(this.parentNode);'>Х</a></p>
							<%}

						} %>
						</select><br><button onmousedown='add_tipy(this.parentNode.getElementsByTagName("SELECT")[0]);'>
						Дадаць акцию</button></td>
						<td><td class='select_tipy'>
						<%ArrayList<ArrayList<String>> tT = itTT.next();
						Iterator<ArrayList<String>> it4 = tT.iterator();
						while(it4.hasNext())
						{
							ArrayList<String> daoTT = it4.next();
							if (!daoTT.isEmpty()) {%>
							<p id=<%=daoTT.get(1)%>><%=daoTT.get(0)%>
							<a onmousedown='this.parentNode.parentNode.removeChild(this.parentNode);'>Х</a></p>
							<%}
						}

						Iterator<ArrayList<String>> itT = tipy.iterator();%>
						<select>
						<% while(itT.hasNext())
						{
							ArrayList<String> daoT = itT.next();
							if (!daoT.isEmpty()) {%><p id="+daoT.get(1)+"><%=daoT.get(0)%>
							<a onmousedown='this.parentNode.parentNode.removeChild(this.parentNode);'>Х</a></p>
							<%}

						} %></select><br><button onmousedown='add_tipy(this.parentNode.getElementsByTagName(\"SELECT\")[0]);'>
							Дадаць тып</button></td></tr>
				<%} %>
</table>

							