<%-- 
    Document   : login
    Created on : 5 janv. 2015, 19:05:51
    Author     : kaldoran
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
    <head>
        <title>Connexion</title>
    </head>
    <body>
        <div>
            ${message}
        </div>
        
        <c:if test="${login}">

            <form th:action="@{/Connexion}" method="post">
                <div><label> User Name : <input type="text" name="username"/> </label></div>
                <div><label> Password: <input type="password" name="password"/> </label></div>
                <div><input type="submit" value="Sign In"/></div>
            </form>

        </c:if>
    </body>
</html>