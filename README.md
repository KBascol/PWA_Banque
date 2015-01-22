# Projet PWA

### Présentation
Le projet se compose de 2 parties distinctes.
La première partie correspond à un site permettant l'affichage de transactions mises en base de donnée dans le projet XML (disponible [ici](https://github.com/kaldoran/PWA_XML_Banque)). Ce site doit être sécurisé à l'aide de Spring Security et doit fournir une pagination des transactions à l'aide de l'interface PagingAndSortingReository.
La seconde partie correspond à un site d'abonnements. Nous avons choisi de créer KNK Multimedia qui propose des abonnemnts pour des films, ebooks, etc. Cette partie doit implémenter une architecture rest avec un serveur java et un client lourd Angularjs.

----------------------------------------------------------------------------------------------------------

### Partie 1
Etant donnée que la sécurité + l'affichage était pratiquement impossible a faire nous avons fait le choix de séparer la parte I en 2 sous partie.
Une partie avec la sécurité l'autre avec l'affichage seulement.

#### Partie Securisée
La partie sécurisée se compose en plusieurs partie. Les configurations de sécurité; les pages jsp et les controlleurs.

##### Configuration
###### mvc-dispatcher-servlet.xml
Cette page sert juste à faire correspondre les pages du type /Liste vers la sp associée, celle ci étant retournée par le controller. Les pages sont alors cherchée dans /WEB-INF/Pages puis l'extension est ajoutée.

###### spring-security.xml
Cette configuration contiens la liste des comptes et leurs autorisation. L'utilisateur Admin à accès à toutes les pages. User à accès a accès juste a la page Research.
Elle contient également la redirection en cas d'essai d'accès aux pages sécurisée et la redirection en cas de déconnexion.

##### Les Controlleurs
###### Les controlleurs sont juste la pour rediriger l'utilisateur vers les jsp associées.

#### Partie Non sécurisée
Cette partie ne marche pas pour des raisons très obsure, cependant toutes les pages sont prete en cas de débug.

-----------------------------------------------------------------------------------------------------------

### Partie 2


#### Client
Le client se compose de 3 pages html, 1 page de script et 1 feuille de style.

##### Le style
Les grandes lignes du style (couleurs, cadres,...) sont définies dans la feuille, mais pour tout le reste il y a bootstrap.


##### Les pages html:
###### index.html
Cette page statique décrit le site et les abonnements proposés.

###### products.html
Cette page est la principale du site. Elle regroupe la liste des produits, leurs abonnements et le filtre des catégories. Elle fournit aussi les fonctionnalités d'administration des données et de souscription aux abonnements.

###### order.html
Cette page permet l'affichage du résumé d'une souscription. Le résumé est accessible grace au numéro de la commande qui peut etre utilisé dans l'url (lien envoyé par mail) ou dans un champ texte sur la même page.


##### Le script
L'application angularjs utilisée se compose de 3 controlleur.
###### catController
Controlleur gérant les accès et les ajouts des catégories

###### prodController
Controlleur gérant les accès, ajouts et supressions des produits, de leurs abonnements. Il gère aussi la création de commande.

###### ordController
Controlleur gérant les accès aux archives des commandes.

#### Serveur
##### Controlleurs
Chaque controlleur côté client correspond à un controlleur côté serveur qui lui fournit les méthodes d'accès et de modifications des données.

##### Données
Les données fournies sont enregistrées sous la forme suivante:
+ Un produit (Product) est composé de:
  + Son nom, qui est sa clé primaire (String).
  + Le nom de sa categorie (String).
  + Une liste d'abonnement (List<Subscription>).
+ Une catégorie (Category) est composée de:
  + Son nom, qui est sa clé primaire (String).
+ Un abonnement (Subscription) est composé de:
  + Son nom, qui est sa clé primaire (String).
  + Son prix (float).
  + Sa durée (Integer).
+ Une commande (Order) est composée de:
  + Son numero de commande, qui est sa clé primaire (Integer).
  + Du nom de l'abonné (String).
  + Du prénom de l'abonné (String).
  + De l'adresse mail de l'abonné (String).
  + De l'IBAN de l'abonné (String).
  + Du nom de l'abonnement (String).
  + Du nom du produit (String).

Chacune des donnée est passée en base de donnée via des repository de type JpaRepository.

##### Mails
La classe AutoMail gère l'envoie des mails de confirmation de souscription à l'aide de l'API Commons Email d'apache.


