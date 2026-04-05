
<?php 

    session_start();
    require "./dbconnection.php";

    $user_id = $_SESSION["user_id"];

    if(!isset($_GET["id"])){
        header("Location: ../panier.php");
        exit();
    }
    
    try{

        $movie_id = $_GET["id"];
        $query = "SELECT quantity FROM cart_items WHERE user_id = ? AND movie_id = ?";
        $stmt = $pdo->prepare($query);
        $stmt->execute([$user_id,$movie_id]);
        $quantity = $stmt->fetchColumn();

        if($quantity > 1){
            $query = "UPDATE cart_items SET quantity = quantity - 1 WHERE user_id = ? AND movie_id = ?";
            $stmt = $pdo->prepare($query);
            $stmt->execute([$user_id,$movie_id]);         
        }else{
            $query = "DELETE FROM cart_items WHERE user_id = ? AND movie_id = ?";
            $stmt = $pdo->prepare($query);
            $stmt->execute([$user_id,$movie_id]);
        }
        
        

    }catch(PDOException $e){
        $_SESSION["purchaseMessageNegative"] = "Suppression échouée";
        
    }
    header("Location: ../panier.php");
    exit();


?>