
<?php 

    session_start();
    require "./dbconnection.php";

    $user_id = $_SESSION["user_id"];


    
    try{

            $query = "SELECT count(movie_id) FROM cart_items WHERE user_id = ?";
            $stmt = $pdo->prepare($query);
            $stmt->execute([$user_id]);

            $vide = $stmt->fetchColumn();

            if($vide){
                $query = "DELETE FROM cart_items WHERE user_id = ?";
                $stmt = $pdo->prepare($query);
                $stmt->execute([$user_id]);
                $_SESSION["purchaseMessagePositive"] = "Tous les articles ont été supprimés.";
            }else{
                $_SESSION["purchaseMessagePositive"] = "Votre panier est déjà vide.";
                $_SESSION["emptyFailed"] = "boom";
            }

            
        

    }catch(PDOException $e){
    }

    header("Location: ../panier.php");


?>