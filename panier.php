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
    ?>

    <main class="marginHeader panierMain" >

        <div class="panierLeft">

            <div class="panierLeftFirst">
                <h1>Mon Panier</h1>
                <hr>
            </div>

            <div class="panierLeftSecond">
                <ul>
                    <li><img  src="https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_SX300.jpg" alt="" class="filmImagePanier"><span><p class="panierPrice">14.99 €</p> <p class="panierTitre">Inception</p></span><a href="" class="panierDelete"><img src="./assets/cross.png" alt=""></a></li>
                </ul>

            </div>
            
            <div class="panierLeftThree">
                <p>SOUS-TOTAL</p>
                <p>PRİCE</p>
            </div>
        </div>

        <div class="panierRight">

            <div class="panierRightFirst">
                <h2>TOTAL</h1>
                <hr class="panierLine">
                <p>sous-total <span>PRİCE</span></p>
                <a href="">PAIEMENT</a>
                <p>NOUS ACCEPTONS : </p>
                <div class="cartes">
                    <img src="" alt="">
                    <img src="" alt="">
                    <img src="" alt="">
                    <img src="" alt="">
                    <img src="" alt="">

                </div>
            </div>     

        </div>
    </main>
</body>
</html>