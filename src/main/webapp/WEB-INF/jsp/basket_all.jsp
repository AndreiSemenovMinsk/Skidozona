<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>

<table  class='table_menu' id=korz1>

<jsp:useBean class="by.eximer.library.controller.impl.side.BasketAll" id="BasketAll" /> 
<jsp:setProperty name="BasketAll" property="*"/>

<c:set var="shops_str" value"${BasketAll.shopString}" />
<c:set var="action_name_str" value"${BasketAll.shopString}" />
<c:set var="description_str" value"${BasketAll.descriptionString}" />
<c:set var="shops_arr" value"${BasketAll.basketAll}" />
<c:set var="shops_name" value"${BasketAll.shopName}" />
<c:set var="geoLocation" value"${BasketAll.geoLocation}" />

<c:forEach var="shop" items="shops_arr" varStatus="i">
<tr><td><tr><td>${shops_str}:</td><td>${shops_name[i]}<br><a  id=korz_dist${i}></a></td></tr>
<tr><td>
	<c:forEach var="item" items="shop" varStatus="j">
		<table  id=k${i} onmouseover="poper(${i});">
			<tr><td>${item[1]}:<br>${item[2]}</td>
				<td><img src='shop${item[8]}/${item[0]}${item[3]}'></td>
				<td>${action_name_str}:</td><td>${item[6]}</td>
				<td>${description_str}:</td><td>${item[4]}</td>
			</tr>
		</table>
	</c:forEach>
<hr color=green></td></tr>
</c:forEach>

</table>123@ arr_korz_geo = [
<c:forEach var="geo_arr" items="geoLocation">
	[${geo_arr}],
</c:forEach>
]; mapping2(lng, lat, arr_korz_geo, 'korz_dist');
</table>


							