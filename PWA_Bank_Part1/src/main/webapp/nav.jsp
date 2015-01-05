<%-- 
    Document   : nav
    Created on : 24 déc. 2014, 11:31:08
    Author     : bascool
--%>

<div>
    <form th:action="@{/logout}" method="post">
            <input type="submit" value="Sign Out"/>
    </form>
    <a href="Redirect?p=a">Accueil</a>
    <a href="Redirect?p=l">Liste</a>
    <a href="Redirect?p=r">Recherche</a>
</div>
