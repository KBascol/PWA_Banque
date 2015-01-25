<%-- 
    Document   : listTrans
    Created on : 13 janv. 2015, 08:55:33
    Author     : Kevin
--%>

<%@page session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form action="<c:url value='/j_spring_security_logout' />" method="post" id="logoutForm">
    <input type="submit" value="Logout" />
</form>
                    
                    
<h1>Liste des transactions</h1>

NB total de transaction : ${transactions.lenght}

<table>
    <c:choose>
        <c:when test="empty param.id">
            <tr>
                <th>Id</th>
                <th>Amout</th>
            </tr>
            <c:forEach var="trans" items="${transactions}">
                <a href="./id=${trans.id}"> 
                    <tr>
                        <td>${trans.id}</td>
                        <td>${trans.amout}</td>
                    </tr>
                </a>
            </c:forEach> 
        </c:when>
        <c:otherwise>
            <c:forEach var="trans" items="${transactions}">
                <c:if test="param.id == ${trans.id}">
                    <tr>
                        <td>${trans.id}</td>
                        <td>${trans.amout}</td>
                        <td>Zoom in</td>
                    </tr>
                </c:if>
        </c:otherwise>
    </c:choose>
</table>

<jsp:include page="footer.jsp"/>