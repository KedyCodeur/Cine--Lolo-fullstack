<?php 

session_start();
require "dbconnection.php";

$avatar = isset($_POST["avatar"]) && $_POST["avatar"] ? $_POST["avatar"] : "";
$username = isset($_POST["username"]) && $_POST["username"] ? $_POST["username"] : "";

$password = $_POST["password"] ?? "" ;
$newPassword = $_POST["newPassword"] ?? "" ;
$confirmPassword = $_POST["confirmPassword"] ?? "" ;

$userId = isset($_SESSION["user_id"]) && $_SESSION["user_id"] ? $_SESSION["user_id"] : "";

if($avatar){

    if(isset($_SESSION["avatar"]) && $_SESSION["avatar"]){

        if($avatar !== $_SESSION["avatar"]){
            try{
                $query = "UPDATE users SET avatar = ? WHERE id = ?";
                $stmt = $pdo->prepare($query);
                $stmt->execute([$avatar,$userId]);
                $_SESSION["avatarChangeMessage"] = "L'avatar a été mis à jour avec succès.";

            }catch(PDOException $a){
                $_SESSION["avatarChangeMessage"] = "Une erreur est survenue lors de la mise à jour de l'avatar. Veuillez rafraîchir la page.";

            }
        }else{
         $_SESSION["avatarChangeMessage"] = "Cet avatar est déjà utilisé.";

        }
    }else{
         $_SESSION["avatarChangeMessage"] = "Une erreur est survenue lors de la mise à jour de l'avatar. Veuillez rafraîchir la page.";
    }

}

if($username){

    if(isset($_SESSION["username"]) && $_SESSION["username"]){

    if(strlen($username) <= 30){
                if($username !== $_SESSION["username"]){
            if(trim($username) !== ""){
                try{
                    $query = "UPDATE users SET username = ? WHERE id = ?";
                    $stmt = $pdo->prepare($query);
                    $stmt->execute([$username,$userId]);
                    $_SESSION["usernameChangeMessage"] = "Le pseudo a été mis à jour avec succès.";

                }catch(PDOException $a){
                    $_SESSION["usernameChangeMessage"] = "Une erreur est survenue. Veuillez rafraîchir la page.";
                }
            }else{
                $_SESSION["usernameChangeMessage"] = "Le pseudo ne peut pas être vide.";
            }
        }else{
         $_SESSION["usernameChangeMessage"] = "Ce pseudo est déjà le vôtre.";

        }
    }else{
        $_SESSION["usernameChangeMessage"] = "Votre pseudo ne peut pas contenir plus de 30 caractères.";
    }
    }else{
         $_SESSION["usernameChangeMessage"] = "Une erreur est survenue. Veuillez rafraîchir la page.";
    }

}

if(trim($newPassword) !== ""){

    switch(true){
    case strlen($newPassword) < 6 :
        $_SESSION["passwordChangeMessage"] = "Le mot de passe doit contenir au moins 6 caractères.";
        break;
    case preg_match('/\s|[^\x{0000}-\x{FFFF}]/u', $newPassword):
        $_SESSION["passwordChangeMessage"] = "Le mot de passe ne peut pas contenir d'espaces ou de caractères spéciaux invalides.";
        break;
    case $newPassword !== $confirmPassword :
        $_SESSION["passwordChangeMessage"] ='Les mots de passe ne correspondent pas';
        break;
    default:
        $query = "SELECT password FROM users  WHERE id = ?";
        $stmt = $pdo->prepare($query);
        $stmt->execute([$userId]);

        $passwordHashedRaw = $stmt->fetch(PDO::FETCH_ASSOC);
        $passwordHashed = $passwordHashedRaw["password"];
        

        $newPaswordHashed = password_hash($newPassword,PASSWORD_DEFAULT);
        if(password_verify($password,$passwordHashed)){
            $query = "UPDATE users SET password = ? WHERE id = ?";
            $stmt = $pdo->prepare($query);
            $stmt->execute([$newPaswordHashed,$userId]);
            $_SESSION["passwordChangeMessage"] = "Le mot de passe a été mis à jour avec succès.";
        }else{
            $_SESSION["passwordChangeMessage"] =  'identifiants incorrects';
        }

}
}


header("Location: ../profile.php")

?>