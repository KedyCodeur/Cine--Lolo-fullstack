<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profile | Ciné Lolo</title>
        
        <meta name="author" content="KedyCodeur">
        <meta name="description" content="Gérez votre profil Ciné Lolo, modifiez votre avatar et vos informations personnelles.">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/profile.css">
        <link rel="stylesheet" href="css/footer.css">
        <link rel="icon" type="image/png" href="./assets/icon.png">
        <style>
        @import url('https://fonts.googleapis.com/css2?family=Shizuru&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap');
        </style>

    </head>
<body>
    <?php

        require "./htmlElements/header.php";

        $avatar = isset($_SESSION["avatar"]) && $_SESSION["avatar"] ? './assets/avatars/'.$_SESSION["avatar"] : "./assets/avatars/avatar.png";
        $username = isset($_SESSION["username"]) && $_SESSION["username"] ?  $_SESSION["username"] : "Erreur";
        
        if(!empty($erreur)){ 
            header("Location: ./error404.php");
            exit();
        }

   ?>


    <main class="marginHeader">
        <div class="profileContainer" >
            <section id="UserInfo" class="profileUser">
                <img src="<?php echo $avatar ?>" alt="Avatar d'utilisateur" class="profileBigImage">
                <h2 class="profileUsername"><?php echo htmlspecialchars($username) ?></h2>
            </section>

            <section id="Change" class="changements">
                <form action="./backhand/handlechange.php"  method="POST">
                    <div class="changeAvatars">
                        <h2>Modifier l'avatar</h2>
                        <hr class="profileTitleLine">
                        <div class="profileAvatarContainer">

                            <div class="profilCheckboxContainer">
                                <input type="radio" name="avatar" value="avatar1.jpg" class="profilCheckbox">
                                <img src="./assets/avatars/avatar1.jpg" alt="Image avatar">
                            </div>

                            <div class="profilCheckboxContainer">
                                <input type="radio" name="avatar" value="avatar2.jpg" class="profilCheckbox">
                                <img src="./assets/avatars/avatar2.jpg" alt="Image avatar">
                            </div>
                    
                            <div class="profilCheckboxContainer">
                                <input type="radio" name="avatar" value="avatar3.jpg" class="profilCheckbox">
                                <img src="./assets/avatars/avatar3.jpg" alt="Image avatar">
                            </div>

                            <div class="profilCheckboxContainer">
                                <input type="radio" name="avatar" value="avatar4.jpg" class="profilCheckbox">
                                <img src="./assets/avatars/avatar4.jpg" alt="Image avatar">
                            </div>

                            <div class="profilCheckboxContainer">
                                <input type="radio" name="avatar" value="avatar5.jpg" class="profilCheckbox">
                                <img src="./assets/avatars/avatar5.jpg" alt="Image avatar">
                            </div>

                            <div class="profilCheckboxContainer">
                                <input type="radio" name="avatar" value="avatar6.jpg" class="profilCheckbox">
                                <img src="./assets/avatars/avatar6.jpg" alt="Image avatar">
                            </div>
                        

                        </div>
                        <?php if(isset($_SESSION["avatarChangeMessage"]) && $_SESSION["avatarChangeMessage"] ){
                        $style = $_SESSION["avatarChangeMessage"] == "L'avatar a été mis à jour avec succès." ? 'color:green' : 'color:red';    
                        echo '<p class="profileChangeMessage" style="' . $style . '">' . $_SESSION["avatarChangeMessage"] . '</p>';
                            unset($_SESSION["avatarChangeMessage"]);
                        }?>   
                        <button  type="submit" class="profileValidationButton">Modifier l'avatar</button>
                    </div>
                    
                </form>

                <form action="./backhand/handlechange.php"  method="POST">
                    <div class="changeUsername">
                        <h2>Modifier le nom d'utilisateur</h2>
                        <hr class="profileTitleLine">
            
                        <div class="profileChangeUsername">
                            <label for="username">
                              Nouveau nom d'utilisateur
                             <input type="text" id="username" name="username" required>
                            </label>
                        </div>
                        <?php
                            if(isset($_SESSION["usernameChangeMessage"]) && $_SESSION["usernameChangeMessage"] ){
                                $style = $_SESSION["usernameChangeMessage"] == "Le pseudo a été mis à jour avec succès." ? 'color:green' : 'color:red';    
                                echo '<p class="profileChangeMessage" style="' . $style . '">' . $_SESSION["usernameChangeMessage"] . '</p>';
                                unset($_SESSION["usernameChangeMessage"]);
                            }
                          ?>
                        <button  type="submit" class="profileValidationButton">Modifier le pseudo</button>                   
                    </div>
                </form>

                <form action="./backhand/handlechange.php"  method="POST">
                    <div class="changePassword">
                        <h2>Modifier le mot de passe</h2>
                        <hr class="profileTitleLine">
            
                        <div class="profileChangerPassword">
                            <div class="profileInputFlexColumn">
                                <label for="password">Mot de passe actuel</label>
                                <input type="password" id="password" name="password" minlength="6" required>
                            </div>

                            <div class="profileInputFlexColumn">
                                <label for="newPassword">Nouveau mot de passe</label>
                                <input type="password" id="newPassword" name="newPassword" minlength="6" required>
                            </div>
                            <div class="profileInputFlexColumn">
                                <label for="confirmPassword">Confirmez le mot de passe</label>
                                <input type="password" id="confirmPassword" name="confirmPassword" minlength="6" required>
                            </div>
                            <?php
                                if(isset($_SESSION["passwordChangeMessage"]) && $_SESSION["passwordChangeMessage"] ){
                                   $style = ($_SESSION["passwordChangeMessage"] == "Le mot de passe a été mis à jour avec succès.") ? 'color:green' : 'color:red';    
                                   echo '<p class="profileChangeMessage" style="' . $style . '">' . $_SESSION["passwordChangeMessage"] . '</p>';
                                   unset($_SESSION["passwordChangeMessage"]);
                                }
                            ?>
                   
                            <button  type="submit" class="profileValidationButton">Modifier le mot de passe</button>                   

                        </div>                        
                    </div>
                </form>


            </section>

            <section id="purchaseHistory" >
                
                <div class="changements marginFixHistory">

                    <h2>L'historique d'achats</h2>
                    <hr class="profileTitleLine">
                    <ul class="history">

                        <?php
                            $totalPrice = 0;
                            try{
                                $userId = $_SESSION["user_id"];
                                $query = "SELECT movie_id,quantity FROM purchases WHERE user_id = ?";
                                $stmt = $pdo->prepare($query);
                                $stmt->execute([$userId]);
                                $movieInfos = $stmt->fetchAll(PDO::FETCH_ASSOC);
                        

                                if ($movieInfos) {

                                    $quantitys = array_column($movieInfos, 'quantity', 'movie_id');
                                    
                                    $movie_ids = array_column($movieInfos,"movie_id");

                                    $placeholder = implode(',', array_fill(0, count($movie_ids), '?'));
                                    $query = "SELECT title,price,id FROM movies WHERE id IN ($placeholder)";
                                    $stmt = $pdo->prepare($query);
                                    $stmt->execute($movie_ids);

                                    $movies = $stmt->fetchAll(PDO::FETCH_ASSOC);

                                    foreach($movies as $movie){
                                        $title = $movie["title"];
                                        $price = $movie["price"];
                                        $quantity = $quantitys[$movie["id"]];
                                        $totalPrice += $price * $quantity;
                                        echo "<li> <span>" . htmlspecialchars($title) ."</span> <span>". htmlspecialchars($quantity) . " <span style='color:white !important;'> x </span> " . htmlspecialchars($price) . "€</span> </li>";
                                    }
                                    echo "<li class='totalSpend'>Dépense totale: "." <strong style='color:white !important;'> $totalPrice". "€". "</strong><li>";
                                }
                                else{
                                    echo "<p>Vous n'avez pas encore effectué d'achats.</p>";    
                                }             
                                
                            }catch(PDOException $a){
                               echo "<li style='color:red;'>Erreur lors de la récupération de l'historique d'achats.</li>";
                            }
                        ?>


                    </ul>
                </div>

            </section>

            <a href="./backhand/deconnection.php" class="buttonDeconnectionProfile">Déconnexion</a>
        </div>
        
    </main>
    <?php require "./htmlElements/footer.php" ?>
</body>
</html>