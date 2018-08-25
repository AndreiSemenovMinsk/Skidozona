<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<jsp:useBean class="by.eximer.library.controller.impl.admin.ProductActions" id="Actions" /> 
<jsp:setProperty name="Actions" property="*"/>

<c:set var="product_actions_arr" value"${Actions.productActions}" />
<c:set var="id" value"${Actions.id}" />

tru@<select id=product_actions>
<c:forEach var="actions" items="product_actions_arr" varStatus="i">
<option value=${actions[1]}>${actions[0]}</option>
</c:forEach></select>
<button onmousedown='add_product_action(${id}, this.parentNode.getElementsByTagName("SELECT")[0]);'>
						Дадаць акцию</button>		