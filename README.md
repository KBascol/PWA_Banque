#Projet PWA

### Présentation
Le projet se compose de 2 parties distinctes.
La première partie correspond à un site permettant l'affichage de transactions mises en base de donnée dans le projet XML (disponible [ici](https://github.com/kaldoran/PWA_XML_Banque)). Ce site doit être sécurisé à l'aide de Spring Security et doit fournir une pagination des transactions à l'aide de l'interface PagingAndSortingReository.
La seconde partie correspond à un site d'abonnements. Nous avons choisi de créer KNK Multimedia qui propose des abonnemnts pour des films, ebooks, etc. Cette partie doit implémenter une architecture rest avec un serveur java et un client lourd Angularjs.

----------------------------------------------------------------------------------------------------------

### Partie 1
[Spring Security Tutorial](http://www.mkyong.com/tutorials/spring-security-tutorials/)

-----------------------------------------------------------------------------------------------------------

### Partie 2

#### Client
Le client se compose de 3 pages html, 1 page de script et 1 feuille de style.
#####Le style
Les grandes lignes du style (couleurs, cadres,...) sont définies dans la feuille, mais pour tout le reste il y a bootstrap.

#####Les pages html:
###### index.html
Cette page statique décrit le site et les abonnements proposés.

###### products.html
Cette page est la principale du site. Elle regroupe la liste des produits, leurs abonnements et le filtre des catégories. Elle fournit aussi les fonctionnalités d'administration des données et de souscription aux abonnements.

###### order.html
Cette page permet l'affichage du résumé d'une souscription. Le résumé est accessible grace au numéro de la commande qui peut etre utilisé dans l'url (lien envoyé par mail) ou dans un champ texte sur la même page.

#####Le script
L'application angularjs utilisée se compose de 3 controlleur.
######catController
Controlleur gérant les accès et les ajouts des catégories

######prodController
Controlleur gérant les accès, ajouts et supressions des produits, de leurs abonnements. Il gère aussi la création de commande.

######ordController
Controlleur gérant les accès aux archives des commandes.


