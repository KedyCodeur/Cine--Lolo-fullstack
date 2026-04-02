<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Panier | Ciné Lolo</title>
        
        <meta name="author" content="KedyCodeur">
        <meta name="description" content="Consultez votre panier Ciné Lolo, finalisez vos achats et profitez de vos films préférés dès maintenant.">        
        <link rel="stylesheet" href="css/panier.css">
        <link rel="stylesheet" href="css/header.css">
        <link rel="icon" type="image/png" href="./assets/icon.png">
        <style>
        @import url('https://fonts.googleapis.com/css2?family=Shizuru&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap');
        </style>

    </head>

<body>
    <?php 
        require "./htmlElements/header.php";

        require "./backhand/dbconnection.php";

        $user_id = $_SESSION["user_id"];


    ?>

    <main class="marginHeader panierMain" >

        <div class="panierLeft">

            <div class="panierLeftFirst">
                <h2>MON PANIER</h2>
                <hr>
            </div>

            <div class="panierLeftSecond">
                <ul>
                    <?php 
                            $totalPrice = 0;
                    
                            try{
                                $query = "SELECT movie_id,quantity FROM cart_items WHERE user_id = ?";
                                $stmt = $pdo->prepare($query);
                                $stmt->execute([$user_id]);

                                $userCartInfos = $stmt->fetchAll(PDO::FETCH_ASSOC);

                                

                                if($userCartInfos){
                                    $quantitys = array_column($userCartInfos, 'quantity', 'movie_id');
                                    $userCartIds = array_column($userCartInfos,"movie_id");
                                    $placeholder = implode(',', array_fill(0, count($userCartIds), '?'));
                                    $query = "SELECT title,price,img,id FROM movies WHERE id IN ($placeholder)";
                                    $stmt = $pdo->prepare($query);
                                    $stmt->execute($userCartIds);

                                    $movies = $stmt->fetchAll(PDO::FETCH_ASSOC);
                                    foreach($movies as $movie){
                                        for($count = 0 ; $count < $quantitys[$movie["id"]]; $count++){
                                            echo "<li>" . '<img src="' . htmlspecialchars($movie["img"]) . '" alt="' . htmlspecialchars($movie["title"]) . '" class="filmImagePanier"><span><p class="panierPrice">' . htmlspecialchars($movie["price"]) . "€</p><p class=\"panierTitre\">" . htmlspecialchars($movie["title"]) . "</p></span><a href=\"./backhand/delete_panier.php?id=" . htmlspecialchars($movie["id"]) . "\" class=\"panierDelete\"><img src=\"./assets/cross.png\" alt=\"supprimer\"></a></li>";
                                            $totalPrice += $movie["price"];
                                        }
                                        
                                    }
                                }else{
                                    if(isset($_SESSION["purchaseMessagePositive"]) && $_SESSION["purchaseMessagePositive"]){
                                        $color = isset($_SESSION["emptyFailed"]) ?  "red" : "green";
                                        echo '<span style="color:' . $color . '!important;">' .$_SESSION["purchaseMessagePositive"] . "</span>";
                                        unset($_SESSION["purchaseMessagePositive"]);
                                        if($color = "red"){
                                            unset($_SESSION["emptyFailed"]);
                                        }
                                    }else{
                                        echo "<p>Vous n'avez pas encore de films dans votre panier.</p>";
                                    }
                                    
                                }
                                
                            }catch(PDOException $e){
                                echo "<li>Une erreur est survenue lors du chargement de votre panier.</li>";
                            }
                    ?>                
                </ul>
      
                <span class="spaceBetweenPanier"></span>
            </div>
            
            <div class="panierLeftThree">
                <a href="./backhand/delete_panier_all.php" class="viderPanier">Vider</a>
                <p>SOUS-TOTAL</p>
                <p> <?php echo $totalPrice . " €" ?> </p>
            </div>
        </div>

        <div class="panierRight">

            <div class="panierRightFirst">
                <h2>TOTAL</h2>
                <hr>
                <p class="sousTotalRight">Sous-total <span><?php echo $totalPrice . " €" ?></span></p>
                <a href="./backhand/payment.php" class="paymentButton">PAIEMENT</a>
                <?php   
                        if(isset($_SESSION["purchaseMessageNegative"]) && $_SESSION["purchaseMessageNegative"]){
                            echo '<p style="color: red !important;">' . $_SESSION["purchaseMessageNegative"] . '</p>';
                            unset($_SESSION["purchaseMessageNegative"]);
                        }?>
            </div>     

        </div>
    </main>
</body>
</html>