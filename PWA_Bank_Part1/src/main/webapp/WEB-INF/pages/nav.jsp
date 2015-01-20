<%-- 
    Document   : nav
    Created on : 24 déc. 2014, 11:31:08
    Author     : bascool
--%>

<div>
    <form th:action="@{/logout}" method="post">
            <input type="submit" value="Sign Out"/>
    </form>
    <a href="">Accueil</a>
    <a href="List">Liste</a>
    <a href="Research">Recherche</a>
</div>
