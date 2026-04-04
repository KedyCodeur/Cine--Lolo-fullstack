<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ciné Lolo</title>
        
        <meta name="author" content="KedyCodeur">
        <meta name="description" content="Les films du directeur">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/director.css">
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

        <h2>Christopher Nolan</h2>
        <hr>
        <ul>

            <?php
                if(isset($_GET["id"]) && $_GET["id"]){
                    try{
                        $director_id = $_GET["id"];
                        $query = "SELECT movie_id FROM movie_director WHERE director_id = ?";

                        $stmt = $pdo->prepare($query);
                        $stmt->execute([$director_id]);
                        $movies_id = $stmt->fetchAll(PDO::FETCH_COLUMN);

                        $placeholder = implode(",",array_fill(0,count($movies_id),"?"));
                        $query = "SELECT img,title,id,price,description FROM movies WHERE id IN ($placeholder)";
                        $stmt = $pdo->prepare($query);
                        $stmt->execute($movies_id);
                                        
                        $movieInfos = $stmt->fetchAll(PDO::FETCH_ASSOC);
                                        


                        if($movieInfos){
                            
                            foreach($movieInfos as $movie){
                                $img = $movie["img"];
                                $title = $movie["title"];
                                $id = $movie["id"];
                                $price = $movie["price"];
                                $description = $movie["description"];
                                echo "<li class=\"filmItem\"><img src=\"" . htmlspecialchars($img) . "\" alt=\"" . htmlspecialchars($title) . "\" class=\"filmImageDirector\" onerror=\"this.onerror=null;this.src='./assets/placeholder.png';\"><span><a href=\"./movie.php?id=" . htmlspecialchars($id) . "\" class=\"filmTitle\">" . htmlspecialchars($title) . "</a><p class=\"description\">" . htmlspecialchars($description) . "</p><p class=\"filmPrice\">" . htmlspecialchars($price) . "€</p></span></li>";
                            }
                        }
                        else{
                            header("Location: ./error404.php");
                        }
                
                    }
                    catch(PDOException $a){
                        header("Location: ./error404.php");
                    }
                                    
                }else{
                    header("Location: ./error404.php");
                }
            ?>
        </ul>
    </main>

</body>
</html>