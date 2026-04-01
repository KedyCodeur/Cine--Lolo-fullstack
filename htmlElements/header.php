<?php
session_start();
require "./backhand/dbconnection.php";
$avatar = "avatar.png";

if(isset($_SESSION["user_id"]) && $_SESSION["user_id"]){
    try{
        $query = "SELECT username,avatar FROM users WHERE id = ?";
        $statement = $pdo->prepare($query);
        $statement->execute([$_SESSION["user_id"]]);
        $userInfo = $statement->fetch(PDO::FETCH_ASSOC);

        $userAvatar = $userInfo["avatar"];
        $username = $userInfo["username"];
        if($userInfo){
            $avatar = "$userAvatar";
            $_SESSION["avatar"] = $avatar;
            $_SESSION["username"] = $username;
        }
    }
        catch(PDOException $a){
    }
}
?>

<header>
    <nav>
        <h1><a href="./index.php">Lolo</a></h1>

        <form action="../backhand/handleSearch.php" method="GET">
            <label for="searchInput"><input type="text" name="searchInput" placeholder="Recherche"></label>
            <button type="submit"><img src="./assets/search.png" alt="icone de recherche" class="searchIcon"></button>
        </form>

        <input type="checkbox" name="toggleHeader" class="toggleHeader" id="toggleHeader">

        <label for="toggleHeader" class="avatarContainer"><img src="<?php  echo "./assets/avatars/" . $avatar ;?>" alt="Icone photo de profile " class="avatar"></label>

        <div class="headerSide">
            <ul>
                <label for="toggleHeader"><img src="./assets/cross.png" alt="icone de croix" class="cross"></label>
                <img src="<?php  echo "./assets/avatars/" . $avatar ;?>" alt="Icone photo de profile " class="avatarBig">
                <li class="title"><span>Compte</span></li>
                <?php 
                    if(isset($_SESSION["user_id"]) && $_SESSION["user_id"]){
                        echo '<li class="hoverable"><a href="./profile.php" >Profile</a></li>';
                        echo '<li class="hoverable"><a href="./panier.php" >Panier</a></li>';
                        echo '<li class="hoverable"><a href="./profile.php #purchaseHistory" >L\'historique d\'achats</a></li>';
                        echo '<li class="hoverable"><a href="./index.php" >Accueil</a></li>';
                        echo '<li class="hoverable"><a href="./backhand/deconnection.php" >Déconnexion</a></li>';
                    }else{
                         echo '<li class="hoverable"><a href="./login.php" >Se connecter</a></li>';
                         echo '<li class="hoverable"><a href="./register.php" >S\'inscrire</a></li>';
                    }
                    
                ?>
               
                <li class="title"><span>Films</span></li>
                <li class="hoverable"><a href="" >Action</a></li>
                <li class="hoverable"><a href="" >Comedie</a></li>
                <li class="hoverable"><a href="" >Adventure</a></li>
                <li class="hoverable"><a href="" >Tout</a></li>

                
            </ul>
        </div>
    </nav>
</header>
