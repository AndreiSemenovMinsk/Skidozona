<%@page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@page import="java.util.Iterator" %>
<%@page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="id_product" value="${requestScope.id_product}" />
<c:set var="types_arr" value="${requestScope.types}" />
tru@
<c:forEach var="types" items="${types_arr}">
<p id=${types[1]}>${types[0]}
<a onmousedown="this.parentNode.parentNode.removeChild(this.parentNode);"><b>X</b></a>
</p>
</c:forEach>
@${id_product}