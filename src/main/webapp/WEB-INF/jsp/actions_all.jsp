<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>

<table  class='table_menu' id=akc1>

<jsp:useBean class="by.eximer.library.controller.impl.side.ActionsAll" id="ActionsAll" /> 
<jsp:setProperty name="ActionsAll" property="*"/>

<c:set var="shops_str" value="${ActionsAll.shopString}" />
<c:set var="action_name_str" value="${ActionsAll.shopString}" />
<c:set var="description_str" value="${ActionsAll.descriptionString}" />
<c:set var="without_reminders_str" value="${ActionsAll.withoutRemindersString}" />
<c:set var="reminder_radius_str" value="${ActionsAll.reminderRadiusString}" />
<c:set var="shops_arr" value="${ActionsAll.basketAll}" />
<c:set var="shops_name" value="${ActionsAll.shopName}" />
<c:set var="geoLocation" value="${ActionsAll.geoLocation}" />

<c:forEach var="shop" items="shops_arr" varStatus="i">
<tr><td><tr><td>${shops_str}:</td><td>${shops_name[i.count]}<br><a  id=akc_dist${i.count}></a></td></tr>
<tr><td>
	<c:forEach var="item" items="shop" varStatus="j">
		<table  id=k${i.count} onmouseover="poper(${i.count});">
			<tr><td>${item[1]}:<br>${item[2]}</td>
				<td><img src='shop${item[9]}/${item[0]}${item[3]}'></td>
				<td>${action_name_str}:</td><td>${item[6]}</td>
				<td>${description_str}:</td><td>${item[4]}</td>
				<td><p onmousedown='strelka("${reminder_radius_str}", this);'>${reminder_radius_str} &#9660;</p>
							<p style='display:none;'><select onchange='add_circle(this.value, [
							${item[7]}],${item[8]},"actions_radius",${item[10]});'>
							<option value=0>${without_reminders_str}</option>
							<option value=50>50 м</option>
							<option value=100>100 м</option>
							<option value=200>200 м</option>
							<option value=500>500 м</option>
							</select></p></td></tr>
		</table>
	</c:forEach>
<hr color=green></td></tr>
</c:forEach>
123@ arr_korz_geo = [
<c:forEach var="geo_arr" items="geoLocation">
	[${geo_arr}],
</c:forEach>
]; mapping2(lng, lat, arr_korz_geo, 'korz_dist');
</table>
							