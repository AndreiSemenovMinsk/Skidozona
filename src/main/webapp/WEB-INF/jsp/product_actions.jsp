<%@page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@page import="java.util.Iterator" %>
<%@page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="id_product" value="${requestScope.id_product}" />
<c:set var="actions_arr" value="${requestScope.actions}" />
tru@
<c:forEach var="actions" items="${actions_arr}">
<p id=${actions[1]}>${actions[0]}
<a onmousedown="this.parentNode.parentNode.removeChild(this.parentNode);"><b>X</b></a>
</p>
</c:forEach>
@${id_product}