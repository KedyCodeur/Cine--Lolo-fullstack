<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Connexion | Ciné Lolo</title>
        
        <meta name="author" content="KedyCodeur">
        <meta name="description" content="Page de connexion sécurisée pour accéder à votre espace Ciné Lolo.">
        <link rel="stylesheet" href="css/login_register.css">
        <link rel="icon" type="image/png" href="./assets/icon.png">
       <style>
            @import url('https://fonts.googleapis.com/css2?family=Comic+Neue:ital,wght@0,300;0,400;0,700;1,300;1,400;1,700&family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap');
            @import url('https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap');
       </style>
    </head>
   
    <body class="loginBackground">

        <div class="container">

            <h1 class="loginTitle">Connectez-vous</h1>
            
            <form class="inputContainer" action="./backhand/handlelogin.php" method="POST">
                <div class="inputFlexColumn">
                    <label for="email" class="labelLogin">Mail</label>
                    <input type="text" name="mail" class="inputLogin" required >
                </div>

                <div class="inputFlexColumn">
                    <label for="password" class="labelLogin">Mot de passe</label>
                    <input type="password" name="password" class="inputLogin" minlength="6" required >
                    <label for="rememberMe" class="rememberMe">Se souvenir de moi<input type="checkbox" name="rememberMe" id="rememberMe"></label>
                </div>
                <?php 
                    session_start();
                    if(isset($_SESSION["messageRegister"])){
                        $_SESSION["messageRegister"] = "";
                    }
                    
                    if (isset($_SESSION["messageLogin"]) && $_SESSION["messageLogin"] !== "") {
                        $message = $_SESSION["messageLogin"];
                        if($message == "connexion réussie !"){
                            $color = "color: green;";
                        }else{
                            $color = "color: red;";
                        }
                        echo "<p class='infoMessage' style='$color'>$message</p>";
                    }

                ?>
                        
                <button class="loginButton"  type="submit">Se Connecter</button>
            </form>

    
            <p class="redirectionP">Vous n'avez pas de compte ? <a href="./register.php" class="redirectionLink">Inscrivez-vous</a></p>

        </div>

        
    </body>
</html>