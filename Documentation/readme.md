# Ciné Lolo #


## Description du Projet ##

L'objectif de ce projet est de créer un site web permettant aux utilisateurs d'acheter des films en ligne. Pour faciliter l'expérience utilisateur, le site propose les fonctionnalités suivantes 

**Système de Recherche :** Une barre de recherche intuitive permettant de trouver des films soit par leur titre, soit par le nom du réalisateur.

**Navigation par Catégories :** Un classement des films par genres pour une exploration plus fluide du catalogue.

**Gestion des Achats :** Une page Panier dédiée pour gérer les articles avant la validation de la commande.

**Espace Utilisateur :** Une page Profil permettant de modifier les informations du compte et de consulter l'historique des achats effectués.



## Technologies Utilisées ##

**Backend :** PHP 8.

**Base de données :** MySQL.

**Frontend :** HTML5, CSS3.



## Téléchargement des requis ## 

Pour le coup, il suffira de télécharger WampServer puisqu'il télécharge tout ce qui est nécessaire avec lui-même.

Pour cela, allez sur le lien ici [text](https://www.wampserver.com/en/download-wampserver-64bits/)   et cliquez sur le bouton "WAMPSERVER 64 BITS". Pas besoin de remplir toutes les informations là-bas, cliquez sur "you can download it directly" qui est situé tout en haut, en jaune. Une fois que vous l'avez téléchargé, faites l'installation.

Au cas où il manquerait des fichiers, vous pouvez tout télécharger d'ici : [text](https://wampserver.aviatechno.net/?lang=fr&prerequis=afficher)


## Installation ## 

extrez le dossier LOLO que vous avez téléchargé dans DISC C (ou vous avez installé le wampserver) -> wamp64 -> www


maintenant nous allons créer le database. pour faire ça d'abbord nous allons lancer le wampserver c'est assez facile double cliquez dessus

il va s'activer parcontre il faudrait verifier qu'il fonctionne donc cliquez sur la flech tout en bas a droit verifier bien l'icon de wamp est vert sinon ctrl + alt + del -> gestionaire des taches tapez apache fin de tache pour tous que vous vouyez fait le egalement pour le mysql aussi

apres clique droit sur l'icon de wamp cliquez sur redamarréz de zéro si le probleme continue redemarré votre ordi

***Une fois que c'est vert***

allez sur le lien [text](http://localhost/phpmyadmin)  


***si le lien ne marche pas :***

    nous allons vérifier la version de myphpadmin

    allez sur le disc C (ou vous avez installé le Wampserver) -> wamp64 -> alias -> les numéro que vous allez voir est la version

    ajouter la version a la fin du lien

    Par example: [text](http://localhost/phpmyadmin5.2.3/)


Mtn connectez-vous à phpMyAdmin. Par défaut :

Le nom d'utilisateur : root

Mot de passe : "" (ne mettez rien, laissez vide)

***Une fois que vous etes connecté***
trouvez le bouton "Importer" qui est tout en haut dans la barre de navigation
cliquez dessus choisissez le fichier "lolodb.sql" cliquez sur le bouton "Importer" qui est juste en bas
fait également la même pour le fichier "prepare.sql"
l'installation de database est fini

## Comment lancer le site ? ##

if suffira de allez le lien qui est l'ensemble de localhost/ + le chemin de dossier lolo

si vous avez fait comme je vous ai expliqué pour vous ça va etre :

[text](http://localhost/Lolo/index.php)

donc allez sur le lien [text](http://localhost/Lolo/index.php)

Pour que le site puisse communiquer avec la database, n'oubliez pas d'allumer Wampserver.

***IMPORTANT !!!!!!!!!!!! ***

Pour que vous puissiez utiliser la database, vous devrez faire la configuration.
Allez dans le dossier backend et modifiez le fichier 'dbconnection.php' d'après vos paramètres. Le port par défaut sera 3306 si vous ne l'avez pas changé.



## Explications Des fichier (les solutions) ##

### backhand ###

**----dbconnection.php----**

    C’est la fonction qui est le pont avec la base de données. Nous commençons par préparer les paramètres et les identifiants ; il est nécessaire de les modifier selon votre configuration, sinon la connexion ne fonctionnera pas.

    ! Important :
    Le port par défaut est 3306.

    Je crée une variable $erreur = "" vide, qui va etre utilisé pour la vérification de la connexion.

    Dans un bloc try...catch, je réalise la connexion en utilisant PDO pour des raisons de sécurité. De plus, si nous avons besoin de changer de base de données à l'avenir, il sera beaucoup plus facile de l'adapter.

    Le DSN est comme une requête où nous spécifions les paramètres de connexion.
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    Cette ligne permet de détecter s'il y a une erreur. Dans ce cas, elle nous affiche un tableau avec les raisons précises du problème.

    Enfin, dans le catch, je mets à jour la variable $erreur. Lors de la vérification, il suffira de regarder si cette variable est vide ou non pour confirmer que tout est en ordre.



**----cart_add.php----**

    Nous commençons par activer la session pour pouvoir récupérer les informations de l'utilisateur.

    À l'aide d'une condition if avec isset(), je contrôle si $_SESSION["user_id"] est bien attribué et je vérifie s'il est nul ou non.

    Si nous n'avons pas reçu l'ID, nous redirigeons l'utilisateur vers la page de login, car sans être connecté, il n'est pas possible d'enregistrer les achats. Ensuite, j'attribue le userId et je fais également une vérification pour l'ID du film (movie_id). S'il n'est pas attribué, nous effectuons une redirection vers la page 404. Comme l'utilisation de JavaScript n'était pas permise, même si l'erreur n'est pas très explicite, c'était le meilleur choix technique.

    Je réalise la connexion avec require 'dbconnection.php'. Enfin, dans un bloc try...catch, j'exécute le code SQL. si l'opération réussit, l'utilisateur est redirigé vers le panier, sinon il est renvoyé vers la page 404.


**----deconnection.php----**

    La logique derrière est assez simple : nous activons la session, puis nous la détruisons. À l'aide de isset(), nous vérifions s'il y a des cookies (comme le token pour "remember me" ).

    Pour nettoyer les cookies, nous utilisons explode() afin de diviser la chaîne de caractères (string) envoyée par $_SERVER. Nous créons ensuite notre propre tableau (array) classique, puis avec un foreach, nous récupérons la partie qui contient la clé, car $_SERVER envoie les données sous la forme "key=value;".

    Après cela, nous supprimons tout ce qui se trouve dans le cookie. C'est une sécurité pour éviter des conflits futurs, par exemple si nous décidons d'ajouter un autre type de cookie plus tard.

**----delete_panier_all.php----**

    Nous commençons par récupérer l'id de l'utilisateur (user_id) directement depuis la session.

    Ensuite, dans un bloc try...catch, j'exécute la requête SQL. Comme nous n'avons besoin que d'une seule colonne pour la vérification, j'utilise fetchColumn() pour obtenir le résultat. Cela permet de contrôler s'il y a effectivement des éléments dans le panier avant d'agir.

    Si la variable $cartItemInside confirme la présence d'articles, j'exécute la requête DELETE pour vider le panier. Si l'opération réussit, nous utilisons une variable de session pour afficher un message de succès à l'utilisateur ; sinon, un message d'erreur est généré pour signaler le problème.

**----delete_panier.php----**

    Nous commençons par récupérer l'id de l'utilisateur directement depuis la session. Ensuite, à l'aide de isset(), je contrôle si nous avons reçu l'id que nous sommes censés recevoir via l'URL, qui correspond au movie_id.

    Dans un bloc try...catch, j'exécute la requête SQL. J'utilise à nouveau fetchColumn() car nous avons seulement besoin de récupérer la quantité actuelle du film dans le panier.

    Sur mon site, il est possible d'ajouter le même film plusieurs fois. Voici la logique appliquée :

    S'il y a plus d'un exemplaire du film : Je baisse simplement la quantité de 1 (UPDATE).

    Sinon (s'il n'en reste qu'un) : Je supprime complètement le film du panier (DELETE).

    Bien sûr, en cas d'erreur lors de l'exécution, un message d'erreur est généré pour avertir l'utilisateur  grace au catch.

**----handlechange.php----**

    Nous commençons par récupérer les input et userId  à l'aide de isset() ET ?? qui est son egal 

    et puis nous avons trois if qui controle les variable qu'on etait censé tiré dans le fichier header.php et sinon on informe l'utilisateur que y a un erreur mais si oui tout va bien-> 

    avatar:

        Nous vérifions d'abord si l'avatar actuel est identique à l'avatar demandé. Si c'est le cas, nous informons l'utilisateur qu'aucun changement n'est nécessaire. Sinon, la procédure continue : dans un bloc try...catch, j'exécute la requête SQL pour mettre à jour l'avatar dans la base de données. En cas d'erreur, un message d'erreur est généré pour avertir l'utilisateur.

    username:

        De la même manière, nous contrôlons si le nom d'utilisateur actuel est identique au nouveau nom demandé. Si c'est le cas, nous informons l'utilisateur.

        Cependant, pour le pseudonyme, je contrôle également la longueur du texte car j'ai instauré une limite de 30 caractères. De plus, avec la fonction trim(), nous vérifions qu'il n'y ait pas uniquement des espaces vides. Ensuite, dans un bloc try...catch, j'exécute la requête SQL pour mettre à jour le nom d'utilisateur. En cas d'erreur, un message d'erreur est généré.

    password:

    avec un trim nous vérifions que le nouveau mot de passe (newPassword) n'est pas vide. après avec un switch(true) je fais les contrôles d'après les conditions que j'ai mis et il y a des messages pour tout.

    la première condition c'est pour vérifier que le mot de passe contient bien plus de 6 caractères.
    
    la deuxième c'est un regex qui vise à regarder si le mot de passe contient un emoji ou un espace. 
    
    et la troisième c'est pour être sûr que l'utilisateur a bien écrit le mot de passe et qu'il n'a pas fait un typo.

    si tout est bon nous récupérons le mot de passe actuel qui est haché dans la base de données pour le comparer avec celui saisi par l'utilisateur via password_verify(). si la vérification réussit nous générons un nouveau hash sécurisé avec password_hash() et nous mettons à jour la base de données avec un message de succès sinon on affiche un message d'erreur.
    
    password :  mot de passe actuel.
    newPassword :  nouveau mot de passe.
    confirmPassword : une sorte de couche de sécurité pour éviter les typo.

**----handlelogin.php----**

    Nous commençons par activer la session pour pouvoir récupérer les informations de l'utilisateur et bien sûr par établir la connexion entre nous et la base de données.

    Avec un if, je vérifie que la variable $erreur est vide, car sinon cela signifie qu'il y a eu un problème au niveau de la connexion avec la DB. Je récupère les inputs avec l'opérateur ?? ; s'ils ne sont pas remplis, je les laisse vides. Ensuite, il y a plusieurs contrôles que je fais avec leurs messages d'erreur respectifs.

    Avec les trim(), nous vérifions que les inputs (sauf "remember me") ne sont pas vides, sinon je redirige vers login.php. 

    Avec strlen(), je vérifie que le mot de passe contient au moins 6 caractères. 

    Avec filter_var($mail), je vérifie si l'adresse mail est au bon format. Après, 
    
    à nouveau avec le regex, je contrôle si le mot de passe contient des emojis ou des espaces.
        
***changements depuis ici ***   

    Dans un bloc try...catch, j'exécute le code SQL pour tirer les infos de l'utilisateur. Je contrôle si nous les avons bien reçues, sinon je redirige vers login.php avec une erreur.

    Ensuite, je récupère le mot de passe qui est enregistré dans la base de données. Avec password_verify(), je vérifie que les mots de passe sont identiques pour confirmer que c'est bien notre utilisateur, sinon c'est une redirection vers le login avec un message d'erreur. Une fois validé, je fais les attributions des variables de session comme le user_id, l'username et l'avatar.

    Après, si la case "Se souvenir de moi" (Remember Me) est cochée, je crée un token avec la fonction bin2hex(random_bytes(16)). Je fais le hachage avec la méthode sha256 car c'est une bonne pratique : c'est sécurisé et surtout beaucoup plus rapide que PASSWORD_DEFAULT, ce qui évite de ralentir le chargement des pages.

    Je mets en place un cookie qui va durer 7 jours avec le chemin "/" pour qu'il soit visible par toutes les pages du site. Je prépare aussi une date d'expiration en base de données pour vérifier plus tard que le token a bien moins de 8 jours.

    Enfin, je contrôle la base de données pour voir si l'utilisateur a déjà un token actif afin d'éviter les accumulations inutiles. Après la suppression de l'ancien token, j'enregistre le nouveau et je redirige vers index.php. En cas d'échec de cette partie, je redirige quand même vers l'accueil car ce n'est pas "la fin des haricots" : l'utilisateur pourra simplement se reconnecter manuellement la prochaine fois.



**----handleregister.php----**

    Jusqu'au titre changements depuis ici, le fonctionnement de handleRegister.php est identique à celui du login, donc je reprends l'explication à partir de ce point.

    Ce qui change, c'est que nous vérifions d'abord si le mot de passe et la confirmation sont identiques pour s'assurer qu'il n'y a pas de typo.

    Ensuite, avec une requête SQL, je regarde s'il y a déjà un mail existant dans la base de données. Si le même mail est déjà enregistré, j'envoie un message d'erreur pour informer l'utilisateur et je le redirige vers la page d'inscription (register).

    Sinon, si le mail est disponible, je procède au hachage du mot de passe. J'enregistre ensuite le nouvel utilisateur dans la base de données et j'envoie un message de réussite pour confirmer l'inscription.


    
**----payment.php----**

Nous commençons par activer la session pour pouvoir récupérer les informations de l'utilisateur et bien sûr par établir la connexion entre nous et la base de données. je tire également l'id d'utilisateur.

Dans un try catch je cherche les films étant dans le panier de l'utilisateur. je prends id movie id et quantity pour enregistrer les films dans l'historique d'achats et les id de cart_items pour pouvoir les supprimer du panier. donc if($infos) qui veut dire si le panier n'est pas vide je continue, sinon j'informe l'utilisateur que son panier est déjà vide il va payer quoi exactement ??

Puisque dans les statements $stmt->execute([?]); ? doit être une liste mais malheureusement c'est pas possible de faire $list,[$notlist], donc ce qu'on fait on unit les listes. avec execute et query il prend tous ce qui est là PAR L'ORDRE c'est pour cela qu'on crée une liste "$values" qui est comme [user_id,movie_id,quantity,user_id_movie_id_quantity]. comme execute respecte l'ordre il ne cause pas de problème.

Et si on veut utiliser prepare on est obligé de mettre les "?" autant que les variables c'est pour ça qu'avec foreach on crée la liste $values mais en même temps on crée les placeholders qui contiennent les (?,?,?) qui sont autant nombreux que les "FILMS".

Et puis j'exécute le code sql et j'enregistre les movies dans l'historique d'achats. ce qui est important ici c'est la partie "ON DUPLICATE KEY UPDATE quantity = quantity + VALUES(quantity)" qui fais :

    film name => x
    film quantity => 3

    $list = ["a"=>1]
    if(in_array($x, $list)){
        $list[$x] = $list[$x] + $x
    }else{
        array_push($list[$x] = $x)
    }

Et dernièrement on utilise les id de cart_items qu'on a tiré pour vider le panier après un achat RÉUSSI.



### les fichier de page ###

**----header.php----**

    Il n’y a pas grand-chose à expliquer ici, mais c'est essentiel pour l'expérience utilisateur. Nous commençons par activer la session pour pouvoir récupérer les informations de l'utilisateur et bien sûr par établir la connexion entre nous et la base de données. Je tire également l'ID de l'utilisateur.

    On crée $avatar = "avatar.png"; qui est l'avatar par défaut. On regarde si l'utilisateur est connecté en vérifiant que $_SESSION["user_id"] n'est pas vide. Dans un bloc try...catch, on exécute la requête SQL pour tirer les infos de l'utilisateur comme son avatar personnalisé et son username.

    On fait les attributions et on les met à leur place dans le HTML. Ce qui est important ici, c'est l'avatar : si l'utilisateur est connecté, on utilise le sien, mais sinon (ou s'il y a une erreur), le site ne bugge pas et utilise simplement l'avatar par défaut.

    Deuxième partie : Affichage conditionnel dans div.headerSide

    Ici, on décide de ce qu'on va afficher selon l'état de la session. Sans être connecté, comment je peux me déconnecter ou suivre mon panier ? N'est-ce pas ? Donc, si on n'est pas connecté, l'utilisateur voit uniquement les options "S'inscrire" et "Se connecter".

    Une fois connecté, la Navbar s'adapte dynamiquement pour afficher les liens vers le Profil, le Panier, l'Historique d'achats et le bouton de Déconnexion


**----all_movie.php----**

    C'est la page qui gère à la fois l'affichage de "Tous" les films et la "Recherche". Elle change de mode selon l'input : si rien n'est recherché, elle affiche tout ; s'il y a un input, elle agit comme une page de recherche.

    Nous commençons par inclure le header et la connexion à la base de données. On crée une liste vide $movies et $pageCount à zéro pour éviter les erreurs, car chercher dans du "vide" ou du "null", ce n'est pas la même chose. Si $_GET["page"] n'est pas défini, on le met à 1 par défaut.

    Le titre $mainTitleH3 est dynamique selon le mode. Nous commençons par compter le nombre de films pour faire le Paging. Si l'input de recherche est vide, on affiche tout avec un SQL basique et on calcule $pageCount = ceil($count / 12);. Pourquoi ceil ? Parce que si j'ai 13 films, sans le ceil, il dirait qu'il n'y a qu'une page et on ne verrait pas le 13ème film.

    Le mode Recherche :
    Si l'utilisateur fait une recherche, ça devient un peu plus compliqué. On utilise ce query :
    SELECT COUNT(DISTINCT movies.id) FROM movies LEFT JOIN movie_director ON movies.id = movie_director.movie_id LEFT JOIN director ON movie_director.director_id = director.id WHERE movies.title LIKE ? OR director.name LIKE ?

    On unit tout pour éviter de faire 3 requêtes. Pourquoi DISTINCT ? Parce que certains films ont plusieurs réalisateurs, donc ils seraient comptés deux fois. Avec le DISTINCT, SQL vérifie s'il l'a déjà compté et passe au suivant.

    Le Paging et la Sécurité :
    On affiche 12 films par page. On fait un suivi de $page pour ne pas perdre l'utilisateur. J'ai ajouté des contrôles : si quelqu'un (ou un bot SEO) tape page=99999, on le ramène au max, ve si c'est < 1, on le ramène à 1. On ne veut pas que le site crash et que ça affecte le SEO.

    Pour le database, on utilise $pageActuel = $page - 1;. Pour la première page, c'est LIMIT 0,12. On commence par 1 nous, car une "page 0", c'est trop bizarre, n'est-ce pas ?

    Récupération des données :
    Ici, on utilise bindValue() pour indiquer précisément le "type" de donnée. Si on ne fait pas ça, le LIMIT ne marche pas pour une raison inconnue (c'est comme ça la vie !).
    bindValue(placeholder, valeur, type);
    Après, avec fetchAll(PDO::FETCH_ASSOC), je tire les infos sous forme de dictionnaire.

    L'affichage (La partie "phpalisée") :
    Dans le div.filmsContainerIndex, j'utilise une variable $success initialisée à false. Si on trouve des films, elle devient true. Sinon, un message s'affiche : "On n'a pas trouvé ce que tu cherches :(" avec un bouton pour revenir. J'ai préparé le design du div pour chaque film et je l'ai ensuite "phpalisé" avec des echo pour mettre les infos au bon endroit.

    Tout en bas, on fait le paging pour changer de page. Le lien ressemble à ?search=$input&page=$page. Si on est à la page 4, les boutons affichent par exemple : 2 3 4 5 6 ...


**----categorie.php----**

C'est à peu près la même chose que all_movie.php, je vous conseille de le lire pour comprendre la base. Ce qui est différent ici, c'est qu'on cherche les films qui sont dans le tableau movie_genre.

Le processus est simple :

On va d'abord dans la table genres pour récupérer l'ID de la catégorie demandée.

On utilise cet ID pour chercher dans la table de liaison movie_genre.

Après, on récupère tous les movie_ids correspondants.

Enfin, on récupère leur Count (pour le paging) et toutes leurs infos (titre, image, etc.) pour les afficher.

C'est une structure en trois étapes qui permet de filtrer précisément les films tout en gardant le système de pagination qu'on a vu précédemment.




**----director.php----**
    Nous commençons par inclure le header et la connexion à la base de données. On contrôle si on a bien reçu l'ID, qui correspond au director_id. Sinon, on redirige directement vers la page 404 ; si tout va bien, on continue dans un bloc try...catch.

    Avec l'ID du directeur, on récupère son nom avec une requête SQL. Mais ce qui est intéressant, c'est ce qui se passe en bas. D'abord, on tire les movies_id via le director_id. On prend tous les films associés à ce réalisateur.

    On prépare ensuite un placeholder qui va contenir autant de "?" que le nombre de films trouvés. Pourquoi ? Parce que dans la requête SQL WHERE id IN (...), il faut mettre les ? manuellement, sinon ça ne marchera pas. Comme on a déjà fait un fetchColumn() auparavant, on récupère un array classique, ce qui facilite l'insertion dans le execute().

    Après, je contrôle $movieInfos. Si la liste des films est vide, c'est une redirection vers la page d'erreur. Sinon, parfait ! On affiche tous les films proprement avec un foreach.




**----index.php----**

    Nous commençons par inclure le header. Ce qui est important ici, c'est qu'on gère les messages de session dès le début. Si on a des messages de "Register" ou "Login", on les fait unset pour ne pas qu'ils restent affichés pour rien après.

    Après, on regarde si l'utilisateur a un token dans le cookie. Si oui, on fait un hachage de sha256 et on le cherche dans le database. Si c'est trouvé, on tire le user_id et expires. Si la date d'expiration n'est pas venue (ça fait pas encore 8 jours), on l'accepte et on le laisse se connecter automatiquement. Sinon, il doit se connecter quand même manuellement.

    Les nouveaux films :

    On inclut le database. Avec un query, on tire les films par leur date de création avec "added". On prend les 6 nouveaux .

    Après, s'ils sont trouvés, tout va bien : on met les films avec un foreach. Sinon, on met un "p" qui explique qu'il y a une erreur pour ne pas laisser l'utilisateur sans infos.


**----login.php----**

Il n'y a rien à expliquer ici. il y a des notifications qui s'affiche en fonction de l'existence d'erreurs ou de succés de session. nous envoyons les info avec le  méthod post à "handlelogin.php ". Regardez Le.

**----register.php----**

Il n'y a rien à expliquer ici. il y a des notifications qui s'affiche en fonction de l'existence d'erreurs ou de succés de session. nous envoyons les info avec le  méthod post à" handleregister.php" . Regardez Le.


**----movie.php----**

Nous commençons par inclure le header et la connexion à la base de données. On vérifie bien qu'on a reçu l'id avec la méthode GET.

Après, en utilisant l'id avec un query, on tire les data du film comme img, titre, prix, etc. C'est ce qui est vraiment important. Si c'est vide ou si ça a crashé, on redirige direct vers la page 404.

Sinon, on continue. Il y a 3 blocs de try...catch qui font à peu près la même chose, la méthode est pareille. Pourquoi un autre try...catch pour eux ? Parce qu'ils ne sont pas "vital" pour la page. Ça peut marcher même sans eux, donc au lieu de montrer un error404, je choisi d'afficher la page quand même.

Ce qui se passe dans les try...catch (exemple du Genre) :
D'abord, on contrôle la table movie_genre. Via le movie_id, on tire les genre_ids. Comme toujours, on crée un placeholder pour chercher les noms des genres dans la table genres via l'ID.

S'ils ne sont pas vides, on affiche les genres.

S'ils sont vides, on met juste un message : "Information indisponible".

C'est la même logique pour les acteurs et les réalisateurs. La seule petite différence, c'est pour le Directeur : si on le trouve, au lieu de mettre un simple texte, on met un lien "a" pour diriger l'utilisateur vers director.php s'il clique dessus.

et a la fin on mets le prix et un bouton pour ajouter au panier comme les autres fois.

**----panier.php----**
