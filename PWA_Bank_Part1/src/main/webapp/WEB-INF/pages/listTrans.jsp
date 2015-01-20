<%-- 
    Document   : listTrans
    Created on : 13 janv. 2015, 08:55:33
    Author     : Kevin
--%>

<%@page session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="header.jsp"/>
        <h1>Liste des transactions</h1>
        <ul>
            <c:forEach var="trans" items="${transactions}">
                <li>${trans.amout}</li>
            </c:forEach>
        </ul>

<jsp:include page="footer.jsp"/>