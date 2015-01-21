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
        <style>
            body {
                background-color: #9FC1CD;
            }
            #login-box {
                width: 300px;
                padding: 20px;
                padding-bottom: 0px;
                margin: auto;
                background: #fff;
                border-radius: 4px;
                border: 1px solid #000;
            }
            
            #login-box .msg, #login-box .error {
                padding: 15px;
                margin-bottom: 20px;
                border: 1px solid #bce8f1;
                border-radius: 4px;
                color: #31708f;
                background-color: #d9edf7;
            }
            
            #login-box .error {
                color: #a94442;
                border-color: #ebccd1;
                background-color: #f2dede;
            }
            
            h3 {
                margin: auto;
                text-align:center;
                margin-top: 15%;
            }
            
            input[type="submit"] {
                display: inline-block;
                padding: 5px 12px;
                margin-bottom: 0px;
                font-size: 14px;
                font-weight: 400;
                text-align: center;
                cursor: pointer;
                border: 1px solid transparent;
                border-radius: 4px;
            }
        </style>
    </head>
    <body>
        <h3>Welcome to login page :)</h3>

                    
        <div id="login-box">
                
         
        <c:choose>
            <c:when test="${param.error == null}">
                <div class="msg">
            </c:when>
            <c:otherwise>
                <div class="error"> 
            </c:otherwise>
        </c:choose>
            ${message}
        </div>
        
        
        <c:if test="${login}">
            <table>
                <form action="<c:url value='/j_spring_security_check' />" method="post">
                    <tr>
                        <td><label> User Name</label></td> 
                        <td>:</td>
                        <td><input type="text" name="username"/> </td>
                    </tr>
                    <tr>
                        <td><label> Password</label></td>
                        <td>:</td>
                        <td><input type="password" name="password"/> <td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center"><input type="submit" value="Sign In"/></form>
                    </tr>
                </form>
            </table>
        </c:if>
        </div>
    </body>
</html>