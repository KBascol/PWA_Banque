<%-- 
    Document   : header
    Created on : 24 déc. 2014, 11:21:17
    Author     : bascool
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Projet PWA</title>
        <style>
            li { border: 1px dotted black; }
            li:nth-of-type(2n+1) { background-color: #9FC1CD; }
        </style>
    </head>
    <body>
    <jsp:include page="nav.jsp"/>
