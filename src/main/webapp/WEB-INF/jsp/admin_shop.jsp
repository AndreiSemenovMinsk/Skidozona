<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
tru@<table>
<jsp:useBean class="by.eximer.library.controller.impl.admin.AdminShop" id="Admin" /> 
<jsp:setProperty name="Admin" property="*"/>

<c:set var="product_arr" value"${Admin.updateShopActionsProduct}" />
<c:forEach var="product" items="product_arr" varStatus="i">
<tr><td><table id=product${product[1]}>
<tr><td>Товар: <a>${product[2] }</a></td><td><img src="shops${product[2]}/${product[1]}${product[3]}" width=120 height=120></td>
<td>Назва:</td><td><a>${product[4]}</a></td><td><a>${product[5]}</a></td>
<td><a onmousedown=product_actions(${product[1]})>Акции			</a></td>
<td><a onmousedown=product_types(${product[1]})>Категории		</a></td>
<td><a onmousedown=product_update_show(${product[1]})>Редактировать</a></td>
</tr></table>
</c:forEach>
</table>
@
<select>
<c:set var="types_arr" value"${Admin.types}" />
<c:forEach var="types" items="types_arr" varStatus="i">
<option value=${types[1]}>${types[0]}</option>
</c:forEach></select>
@
<select>
<c:set var="actions_arr" value"${Admin.actions}" />
<c:forEach var="actions" items="actions_arr" varStatus="i">
<option value=${actions[1]}>${actions[0]}</option>
</c:forEach></select>

							