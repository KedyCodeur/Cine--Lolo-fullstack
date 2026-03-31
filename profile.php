<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ciné Lolo</title>
        
        <meta name="author" content="KedyCodeur">
        <meta name="description" content="Gérez votre profil Ciné Lolo, modifiez votre avatar et vos informations personnelles.">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/profile.css">
        <link rel="icon" type="image/png" href="./assets/icon.png">
        <style>
        @import url('https://fonts.googleapis.com/css2?family=Shizuru&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap');
        </style>

    </head>
<body>
    <?php
        session_start();
        require "./htmlElements/header.php";

        $avatar = "./assets/avatars/avatar.png";
        if(isset($_SESSION["avatar"]) && $_SESSION["avatar"]){
            $avatar='./assets/avatars/'.$_SESSION["avatar"];
        }  
    ?>


    <main class="marginHeader">
        <div class="profileContainer" >
            <section id="UserInfo" class="profileUser">
                <img src="<?php echo $avatar ?>" alt="Avatar d'utilisateur" class="profileBigImage">
                <h1 class="profileUsername">Juanw</h1>
            </section>

            <section id="Change" class="changements">
                <form action="./backhand/handleChange.php"  method="POST">
                    <div class="changeAvatars">
                        <h2>Modifier l'avatar</h2>
                        <hr class="profileTitleLine">
                        <div class="profileAvatarContainer">

                            <div class="profilCheckboxContainer">
                                <input type="radio" name="avatar" value="avatar1.jpg" class="profilCheckbox">
                                <img src="./assets/avatars/avatar1.jpg" alt="">
                            </div>

                            <div class="profilCheckboxContainer">
                                <input type="radio" name="avatar" value="avatar2.jpg" class="profilCheckbox">
                                <img src="./assets/avatars/avatar2.jpg" alt="">
                            </div>
                    
                            <div class="profilCheckboxContainer">
                                <input type="radio" name="avatar" value="avatar3.jpg" class="profilCheckbox">
                                <img src="./assets/avatars/avatar3.jpg" alt="">
                            </div>

                            <div class="profilCheckboxContainer">
                                <input type="radio" name="avatar" value="avatar4.jpg" class="profilCheckbox">
                                <img src="./assets/avatars/avatar4.jpg" alt="">
                            </div>

                            <div class="profilCheckboxContainer">
                                <input type="radio" name="avatar" value="avatar5.jpg" class="profilCheckbox">
                                <img src="./assets/avatars/avatar5.jpg" alt="">
                            </div>

                            <div class="profilCheckboxContainer">
                                <input type="radio" name="avatar" value="avatar6.jpg" class="profilCheckbox">
                                <img src="./assets/avatars/avatar6.jpg" alt="">
                            </div>

                        </div>
                        <button  type="submit" class="profileValidationButton">Changer L'avatar</button>
                    </div>
                    
                </form>

                <form action="./backhand/handleChange.php"  method="POST">
                    <div class="changeUsername">
                        <h2>Modifier le nom d'utilisateur</h2>
                        <hr class="profileTitleLine">
            
                        <div class="profileChangeUsername">
                            <label for="username">
                              Nouveau username
                             <input type="text" id="username" name="username">
                            </label>
                        </div>     
                        <button  type="submit" class="profileValidationButton">Changer L'avatar</button>                   
                    </div>
                </form>

                <form action="">
                    <div class="changePassword">
                        <h2>Modifier le mot de passe</h2>
                        <hr class="profileTitleLine">
            
                        <div class="profileChangerPassword">
                            <div class="profileInputFlexColumn">
                                <label for="username">Mot de passe actuel</label>
                                <input type="password" id="username" name="username" minlength="6">
                            </div>

                            <div class="profileInputFlexColumn">
                                <label for="username">Nouveau mot de passe</label>
                                <input type="password" id="username" name="username" minlength="6">
                            </div>                            
                            <button  type="submit" class="profileValidationButton">Changer L'avatar</button>                   

                        </div>                        
                    </div>
                </form>


            </section>
        </div>
        
    </main>

</body>
</html>