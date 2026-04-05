
<?php 

    session_start();
    require "./dbconnection.php";

    $user_id = $_SESSION["user_id"];


    
    try{

            $query = "SELECT count(movie_id) FROM cart_items WHERE user_id = ?";
            $stmt = $pdo->prepare($query);
            $stmt->execute([$user_id]);

            $cartItemInside = $stmt->fetchColumn();

            if($cartItemInside){
                $query = "DELETE FROM cart_items WHERE user_id = ?";
                $stmt = $pdo->prepare($query);
                $stmt->execute([$user_id]);
                $_SESSION["purchaseMessagePositive"] = "Tous les articles ont été supprimés.";
            }else{
                $_SESSION["purchaseMessageNegative"] = "Votre panier est déjà vide.";
                
            }

            
        

    }catch(PDOException $e){
    }

    header("Location: ../panier.php");
    exit();


?>