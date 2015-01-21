<%-- 
    Document   : admin
    Created on : 17 janv. 2015, 18:28:28
    Author     : kaldoran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
    <head>
        <style>
            body {
                background-color: #9FC1CD;
            }
            h3 {
                margin: auto;
                text-align:center;
            }
        </style>
    </head>
<body>
	<h3>Welcome to admin page</h3>
 
	<c:if test="${pageContext.request.userPrincipal.name != null}">

                <form action="<c:url value='/j_spring_security_logout' />" method="post" id="logoutForm">
                    <input type="submit" value="Logout" />
                </form>
		<h2>Welcome ${pageContext.request.userPrincipal.name}</h2>  
	</c:if>
</body>
</html>
