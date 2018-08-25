<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<jsp:useBean class="by.eximer.library.controller.impl.admin.ProductTypes" id="Types" /> 
<jsp:setProperty name="Types" property="*"/>

<c:set var="product_types_arr" value"${Types.productTypes}" />
<c:set var="id" value"${Types.id}" />

tru@<select id=product_types>
<c:forEach var="types" items="product_types_arr" varStatus="i">
<option value=${types[1]}>${types[0]}</option>
</c:forEach></select>	
<button onmousedown='add_product_type(${id}, this.parentNode.getElementsByTagName("SELECT")[0]);'>
						Дадаць категорию</button>	