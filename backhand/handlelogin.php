<?php 
session_start();
require "dbconnection.php";

if($erreur !== ""){
   $_SESSION["messageLogin"] = 'Une erreur est survenue lors de la connexion. Veuillez rafraîchir la page et réessayer';
   header("Location: ../login.php");
   exit();   
}


$mail = $_POST["mail"]  ?? ""  ;
$password = $_POST["password"] ?? "" ;
$rememberMe = $_POST["rememberMe"] ?? "";

if(!trim($mail) || !trim($password)){
    $_SESSION["messageLogin"] = 'Veuillez remplir tous les champs. Les espaces seuls ne sont pas acceptés';
    header("Location: ../login.php");
    exit();
   
}

if(strlen($password) < 6){
   $_SESSION["messageLogin"] = 'Le mot de passe doit contenir au moins 6 caractères';
   header("Location: ../login.php");
   exit();    
}

if(!filter_var($mail, FILTER_VALIDATE_EMAIL)){
   $_SESSION["messageLogin"] = 'Adresse e-mail invalide';
   header("Location: ../login.php");
   exit();
}

if(preg_match('/\s|[^\x{0000}-\x{FFFF}]/u', $password)){
    $_SESSION["messageLogin"] = 'Le mot de passe ne peut pas contenir d\'espaces ou d\'emojis';
   header("Location: ../login.php");
   exit();
}


try{
$query = "SELECT email,password,id,username,avatar FROM users WHERE email = ?";
$statement = $pdo->prepare($query);
$statement->execute([$mail]);
$userInfo = $statement->fetch(PDO::FETCH_ASSOC);

if(!$userInfo){
   $_SESSION["messageLogin"] = 'identifiants incorrects';
   header("Location: ../login.php");
   exit();   
}

$passwordReal = $userInfo["password"];

if(!password_verify($password,$passwordReal)){
   $_SESSION["messageLogin"] = 'identifiants incorrects';
   header("Location: ../login.php");
   exit();   
}

$_SESSION["user_id"] = $userInfo["id"];
$_SESSION["username"] = $userInfo["username"];
$_SESSION["avatar"] = $userInfo["avatar"];

}
catch(PDOException $a){
   $_SESSION["messageLogin"] = 'Une erreur est survenue lors de la connexion. Veuillez rafraîchir la page et réessayer';
   header("Location: ../login.php");
   exit();  
}


try{
    if(isset($rememberMe) && $rememberMe){

    $token = bin2hex(random_bytes(16));
    $tokenHashed = hash("sha256", $token);

    setcookie("token",$token,time() + 604800,"/","",true,true);
    $expires = date('Y-m-d', strtotime('+7 days'));

    $query = "SELECT COUNT(id)  FROM tokens WHERE user_id = ?";
    $stmt = $pdo->prepare($query);
    $existing = $stmt->execute([$_SESSION["user_id"]]);

    if($existing){
      $query = "DELETE FROM tokens WHERE user_id = ?";
      $stmt = $pdo->prepare($query);
      $existing = $stmt->execute([$_SESSION["user_id"]]);     
    }

    $query = "INSERT INTO tokens (user_id,token,expires) VALUES(?,?,?)";
    $stmt = $pdo->prepare($query);
    $stmt->execute([$_SESSION["user_id"],$tokenHashed,$expires]);
    }
    header("Location: ../index.php");
    exit();
}
catch(PDOException $a){
    // pas besoin de faire qqchs parce qu'il est pas vraiment important rememberMe au pire la prochaine fois il va se connecter encore une fois pa
    // pas besoin de lui confondre la tete
    header("Location: ../index.php");
    exit();
}






?>