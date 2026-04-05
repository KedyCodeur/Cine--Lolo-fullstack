<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ciné Lolo</title>
        
        <meta name="author" content="KedyCodeur">
        <meta name="description" content="Les details du film">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/movie.css">
        <link rel="stylesheet" href="css/footer.css">
        <link rel="icon" type="image/png" href="./assets/icon.png">
        <style>
        @import url('https://fonts.googleapis.com/css2?family=Shizuru&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap');
        </style>

    </head>
    <body>
        <?php
            require "./htmlElements/header.php";
            require "./backhand/dbconnection.php";
         ?>

         <main class="marginHeader">
                <?php 
                    if(isset($_GET["id"]) && $_GET["id"]){

                        $movie_id = $_GET["id"];

                        try{
                            $query = "SELECT title,img,description,price FROM movies WHERE id = ?";
                            $stmt = $pdo->prepare($query);
                            $stmt->execute([$movie_id]);
                            $movie_info = $stmt->fetch(PDO::FETCH_ASSOC);



                            if($movie_info){
                                $img = $movie_info["img"];
                                $title = $movie_info["title"];
                                $price = $movie_info["price"];
                                $desc = $movie_info["description"];
                                
                                echo "<img src=\"" . htmlspecialchars($img) . "\" alt=\"" . htmlspecialchars($title) . "\" onerror=\"this.onerror=null;this.src='./assets/placeholder.png';\">";
                                echo "<div class=\"pageMovieTextContainer\">";
                                echo "<h2>" . htmlspecialchars($title) . "</h2>";
                                echo "<p class=\"descriptionMovie\"><span class=\"infoTitle\" >Résumé:</span>". htmlspecialchars($desc) . "</p>";

                                try{
                                    $query = "SELECT genre_id FROM movie_genre WHERE movie_id = ?";
                                    $stmt = $pdo->prepare($query);
                                    $stmt->execute([$movie_id]);
                                    $genre_ids = $stmt->fetchAll(PDO::FETCH_COLUMN);
                                    
                                    $placeholder = implode(",",array_fill(0,count($genre_ids),"?"));
                                    $query = "SELECT genre FROM genres WHERE id IN ($placeholder)";
                                    $stmt = $pdo->prepare($query);
                                    $stmt->execute($genre_ids);
                                    $genreInfo = $stmt->fetchAll(PDO::FETCH_COLUMN);
                                    
                                    if($genreInfo){
                                        $genres = implode(", ", $genreInfo);
                                        echo "<p class=\"sideInfo\"><span class=\"infoTitle\"> Genres:</span>" . htmlspecialchars($genres) . "</p>";
                                    }else{
                                        echo "<p class=\"sideInfo\"><span class=\"infoTitle\"> Genres:</span> Information indisponible</p>";
                                    }
                                }catch(PDOException $e){
                                    echo "<p class=\"sideInfo\"><span class=\"infoTitle\"> Genres:</span> Information indisponible</p>";
                                }
                                try{
                                    $query = "SELECT actor_id FROM movie_actor WHERE movie_id = ?";
                                    $stmt = $pdo->prepare($query);
                                    $stmt->execute([$movie_id]);
                                    $actor_ids = $stmt->fetchAll(PDO::FETCH_COLUMN);

                                    $placeholder = implode(",",array_fill(0,count($actor_ids),"?"));
                                    $query = "SELECT name FROM actors WHERE id IN ($placeholder)";
                                    $stmt = $pdo->prepare($query);
                                    $stmt->execute($actor_ids);
                                    
                                    $actor_names = $stmt->fetchAll(PDO::FETCH_COLUMN);
                                    
                                    $actors = implode(", ", $actor_names);
                                    echo "<p class=\"sideInfo\"><span class=\"infoTitle\"> Acteurs:</span>" . htmlspecialchars($actors) . "</p>";
                                    
                                }catch(PDOException $e){
                                    echo "<p class=\"sideInfo\"><span class=\"infoTitle\"> Acteurs:</span> Information indisponible</p>";
                                }
                                

                                try{
                                    $query = "SELECT director_id FROM movie_director WHERE movie_id = ?";
                                    $stmt = $pdo->prepare($query);
                                    $stmt->execute([$movie_id]);
                                    $director_ids = $stmt->fetchAll(PDO::FETCH_COLUMN);

                                    $placeholder = implode(",",array_fill(0,count($director_ids),"?"));
                                    $query = "SELECT name,id FROM director WHERE id IN ($placeholder)";
                                    $stmt = $pdo->prepare($query);
                                    $stmt->execute($director_ids);
                                    
                                    $director_infos = $stmt->fetchAll(PDO::FETCH_ASSOC);
                                    echo "<p class=\"sideInfo\"><span class=\"infoTitle\"> Réalisateurs:</span>";
                                    foreach($director_infos as $director){
                                        echo "<a href=\"./director.php?id=" . htmlspecialchars($director["id"]) . "\" class=\"nameDirector\">" . htmlspecialchars($director["name"]) . "</a>";                                   
                                    }
                                    
                                    echo "</p>";
                                }catch(PDOException $e){
                                    echo "<p class=\"sideInfo\"><span class=\"infoTitle\"> Réalisateurs:</span> Information indisponible</p>";
                                }

                                echo "<p class=\"MoviePrice\"> Prix: ". htmlspecialchars($price)."€</p>";
                                echo "<a href=\"./backhand/cart_add.php?id=" . htmlspecialchars($movie_id) ." \" class=\"filmCartButtonMovie\">Ajouter au panier</a>";
                                echo "</div>";
                            }else{
                                header("Location: ./error404.php");
                                exit();
                            }
                        }catch(PDOException $a){
                            header("Location: ./error404.php");
                            exit();
                        }

                    }else{
                        header("Location: ./error404.php");
                        exit();
                    }
                    
                
                
      
                ?>

         </main>
         <?php require "./htmlElements/footer.php" ?>
    </body>
</html>