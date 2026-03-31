<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ciné Lolo</title>
        
        <meta name="author" content="KedyCodeur">
        <meta name="description" content="Page de connexion sécurisée pour accéder à votre espace Ciné Lolo.">
        <link rel="stylesheet" href="css/header.css">
        <link rel="icon" type="image/png" href="./assets/icon.png">
        <style>
        @import url('https://fonts.googleapis.com/css2?family=Shizuru&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap');
        </style>

    </head>
<body>

    <?php 
       
        require "./backhand/dbconnection.php";

        if(isset($_SESSION["messageRegister"])){
            
                $_SESSION["messageRegister"] = "";
        }
        if(isset($_SESSION["messageLogin"])){
            
                $_SESSION["messageLogin"] = "";
        }

        if(isset($_COOKIE["token"])){
             
            try{
                $tokenHashed = hash("sha256",$_COOKIE["token"]);

                $query = "SELECT user_id,expires FROM tokens WHERE token = ?";
                $stmt = $pdo->prepare($query);
                $stmt->execute([$tokenHashed]);
               
                $infos = $stmt->fetch(PDO::FETCH_ASSOC);

                $expires = $infos["expires"] ?? "";
                $user_id = $infos["user_id"] ?? "";
          
                if($expires && $user_id){
                     
                    if(time() <= strtotime($expires)){
                       $_SESSION["user_id"]=$user_id;
                    }
              
                }


            }catch(PDOException $a){
                //pas besoin de faire qqchs parce que au pire il devra se connecter encore une fois 
                
            }
        }

        require "./htmlElements/header.php"
    ?>





</body>
</html>