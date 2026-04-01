
<?php 

    session_start();
    require "./dbconnection.php";

    $user_id = $_SESSION["user_id"];

    if(!isset($_GET["id"])){
        header("Location: ../panier.php");
    }

    try{

        $movie_id = $_GET["id"];
        $query = "DELETE FROM cart_items WHERE user_id = ? AND movie_id = ?";
        $stmt = $pdo->prepare($query);
        $stmt->execute([$user_id,$movie_id]);
    }catch(PDOException $e){
    }
    header("Location: ../panier.php");


?>