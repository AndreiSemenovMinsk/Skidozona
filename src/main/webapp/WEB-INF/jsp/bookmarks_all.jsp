<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>

<jsp:useBean class="by.eximer.library.controller.impl.side.BookmarksAll" id="BookmarksAll" /> 
<jsp:setProperty name="BookmarksAll" property="*"/>

<c:set var="shops_str" value="${BookmarksAll.shopString}" />
<c:set var="without_reminders_str" value="${BookmarksAll.withoutRemindersString}" />
<c:set var="reminder_radius_str" value="${BookmarksAll.reminderRadiusString}" />
<c:set var="shops_arr" value="${BookmarksAll.basketAll}" />
<c:set var="shops_name" value="${BookmarksAll.shopName}" />
<c:set var="geoLocation" value="${BookmarksAll.geoLocation}" />

<table class='table_menu' id=zakl1>

	<c:forEach var="item" items="shop" varStatus="j">
		<table  id=i${i.count} onmouseover="poper(${i.count});">
			<tr><td id=zakl_dist${i.count}>${item[1]}:<br>${item[2]}</td>
				<td><img src='shop${item[8]}/${item[0]}${item[3]}'></td>
				<td><p onmousedown='strelka("${reminder_radius_str}", this);'>${reminder_radius_str} &#9660;</p>
							<p style='display:none;'><select onchange='add_circle(this.value, [
							${item[6]}],${item[7]},"actions_radius",${item[4]});'>
							<option value=0>${without_reminders_str}</option>
							<option value=50>50 м</option>
							<option value=100>100 м</option>
							<option value=200>200 м</option>
							<option value=500>500 м</option>
							</select></p></td></tr>
		</table>
	</c:forEach>
	
<hr color=green></td></tr>
123@ arr_zakl_geo = [
<c:forEach var="geo_arr" items="geoLocation">
	[${geo_arr}],
</c:forEach>
]; mapping2(lng, lat, arr_zakl_geo, 'zakl_dist');
</table>
							