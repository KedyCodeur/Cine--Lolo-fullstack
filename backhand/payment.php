<?php 

session_start();
require "dbconnection.php";

$user_id = $_SESSION["user_id"];

try{

    $query = "SELECT movie_id,id,quantity FROM cart_items WHERE user_id = ?";
    $stmt = $pdo->prepare($query);
    $stmt->execute([$user_id]);
    $infos = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if($infos){

        $movie_ids = array_column($infos,"movie_id");
        $cartItemIds = array_column($infos,"id");
        

        $values = [];
        $placeholder =[];

        

        foreach($infos as $info){
            array_push($placeholder,"(?,?,?)");
            array_push($values,$user_id);
            array_push($values,$info['movie_id']);
            array_push($values, $info['quantity']);
        }

        $query = "INSERT INTO purchases (user_id,movie_id,quantity) VALUES" . implode(",",$placeholder) . "ON DUPLICATE KEY UPDATE quantity = quantity + VALUES(quantity)";
        $stmt = $pdo->prepare($query);
        $stmt->execute($values);
        

        $placeholder = implode(",",array_fill(0,count($infos),"?"));
        $query = "DELETE FROM cart_items WHERE user_id = ? AND id IN ($placeholder)";
        $stmt = $pdo->prepare($query);
        $stmt->execute(array_merge([$user_id], $cartItemIds,));

        echo $_SESSION["purchaseMessagePositive"] = "Achat effectué avec succès !";
    }else{
        echo $_SESSION["purchaseMessageNegative"] = "Votre panier est déjà vide.";
    }
}catch(PDOException $e){
    echo $_SESSION["purchaseMessageNegative"] = "Erreur lors de l'achat. Veuillez réessayer.";
}

header("Location: ../panier.php");
?>