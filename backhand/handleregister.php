<?php 
session_start();
require "dbconnection.php";

if($erreur !== ""){
   $_SESSION["messageRegister"] = 'Une erreur est survenue lors de l\'inscription. Veuillez rafraîchir la page et réessayer';
   header("Location: ../register.php");
   exit();   
}

$mail = $_POST["mail"]  ?? ""  ;
$password = $_POST["password"] ?? "" ;
$confirmPassword = $_POST["confirmPassword"] ?? "" ;

if(!trim($mail) || !trim($password) || !trim($confirmPassword)){
    $_SESSION["messageRegister"] = 'Veuillez remplir tous les champs. Les espaces seuls ne sont pas acceptés';
    header("Location: ../register.php");
    exit();
   
}

if(strlen($password) < 6){
   $_SESSION["messageRegister"] = 'Le mot de passe doit contenir au moins 6 caractères';
   header("Location: ../register.php");
   exit();    
}




if(!filter_var($mail, FILTER_VALIDATE_EMAIL)){
   $_SESSION["messageRegister"] = 'Adresse e-mail invalide';
   header("Location: ../register.php");
   exit();
}

if(preg_match('/\s|[^\x{0000}-\x{FFFF}]/u', $password)){
    $_SESSION["messageRegister"] = 'Le mot de passe ne peut pas contenir d\'espaces ou d\'emojis';
   header("Location: ../register.php");
   exit();
}

if($password !== $confirmPassword){
   $_SESSION["messageRegister"] = 'Les mots de passe ne correspondent pas';
   header("Location: ../register.php");
   exit();
}


try{
            $query = "SELECT COUNT(id) FROM users WHERE email = ?";
            $stmt = $pdo->prepare($query);
            $stmt->execute([$mail]);
            $existe =  $stmt-> fetchColumn();

            if(isset($existe) && $existe){
                $_SESSION["messageRegister"] = 'Cette adresse e-mail est déjà utilisée';
                header("Location: ../register.php");
                exit();                    
            }

            $passwordHashed = password_hash($password, PASSWORD_DEFAULT);

            $query = "INSERT INTO users (email,password) VALUES(?,?)";
            $stmt = $pdo->prepare($query);
            $stmt->execute([$mail,$passwordHashed]);
            $_SESSION["messageRegister"] = 'Inscription réussie !';
 
}
catch(PDOException $e){
        $_SESSION["messageRegister"] = 'Une erreur est survenue lors de l\'inscription. Veuillez rafraîchir la page et réessayer';
        header("Location: ../register.php");
        exit();        
}




header("Location: ../register.php");
?>

