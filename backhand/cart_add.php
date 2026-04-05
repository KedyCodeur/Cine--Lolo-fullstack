<?php 
session_start();
if(isset($_SESSION["user_id"]) && $_SESSION["user_id"] ){
    $user_id = $_SESSION["user_id"];
    if(isset($_GET["id"]) && $_GET["id"] ) {

        $movie_id = $_GET["id"];
        require "dbconnection.php";
        try{

        $query = "INSERT INTO cart_items (user_id,movie_id,quantity) VALUES(?,?,1) ON DUPLICATE KEY UPDATE quantity = quantity + 1;";
        $stmt = $pdo->prepare($query);
        $stmt->execute([$user_id,$movie_id]);

        header("Location: ../panier.php");
        exit();
            
        }catch(PDOException $e){
            header("Location: ../error404.php");
            exit();
        }
        
    }else{
        header("Location: ../error404.php");
        exit();
    }

}else{
    header("Location: ../login.php");
    exit();
}


?>