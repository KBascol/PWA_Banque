<%-- 
    Document   : nav
    Created on : 24 d�c. 2014, 11:31:08
    Author     : bascool
--%>

<div>
    <form th:action="@{/logout}" method="post">
            <input type="submit" value="Sign Out"/>
    </form>
    <a href="home">Accueil</a>
    <a href="Liste">Liste</a>
    <a href="reasearch.jsp">Recherche</a>
</div>
