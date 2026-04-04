<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ciné Lolo</title>
        
        <meta name="author" content="KedyCodeur">
        <meta name="description" content="Les Films du Lolo">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/all_movie.css">
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
        
        $movies =[];
        $pageCount = 0;
        if(!isset($_GET["page"])){
            $_GET["page"] = 1;
        }
        $mainTitleH3 = "FILMS";
        if(empty($_GET["searchInput"])){
            try{
                $input ="";
                $query = "SELECT COUNT(id) FROM movies";
                $stmt = $pdo->prepare($query);
                $stmt->execute();
                $count = $stmt->fetchColumn();
                
                if($count){
                    $pageCount = ceil($count / 12);
                }            
            }
            catch(PDOException $a){
                header("Location: ./error404.php");
            }
        }else{
            try{
                $query = "SELECT COUNT(DISTINCT movies.id) FROM movies LEFT JOIN movie_director ON movies.id = movie_director.movie_id LEFT JOIN director ON movie_director.director_id = director.id WHERE movies.title LIKE ? OR director.name LIKE ?";
                $input = trim($_GET["searchInput"]);
                $searchMe = "%" . trim($input) . "%";
                $stmt = $pdo->prepare($query);
                $stmt->execute([$searchMe,$searchMe]);
                
                $count = $stmt->fetchColumn();     
                $mainTitleH3 = "RÉSULTATS";
                if($count){
                    $pageCount = ceil($count / 12);
                }       
            }
            catch(PDOException $a){
                header("Location: ./error404.php");
            }

 
        }

        
        
        
        
        $movieParPage = 12;
        
        $page = isset($_GET["page"]) ? (int)$_GET["page"] : 1;

    
        if ($page > $pageCount){
            $page = $pageCount;
        }
        if ($page < 1){
             $page = 1;
        }
        
        $pageActuel = $page - 1; 
        $start = $pageActuel * $movieParPage;
        
        
        if (!isset($_GET["searchInput"]) || $_GET["searchInput"] == "" || $_GET["searchInput"] == "null") {

            
            try{
                $query = "SELECT img,title,id,price FROM movies LIMIT ? , ? ";
                $stmt = $pdo->prepare($query);
                $stmt->bindValue(1, (int)$start, PDO::PARAM_INT);
                $stmt->bindValue(2, (int)$movieParPage, PDO::PARAM_INT);
                $stmt->execute();
                $movies = $stmt->fetchAll(PDO::FETCH_ASSOC);
            }
            catch(PDOException $a){
                header("Location: ./error404.php");
            }
        }else{

            try {
                $input = trim($_GET["searchInput"]);
                $searchThis = "%" . $input . "%";
                
                $query = "SELECT DISTINCT 
                            movies.img, 
                            movies.title, 
                            movies.id, 
                            movies.price 
                        FROM movies 
                        LEFT JOIN movie_director ON movies.id = movie_director.movie_id 
                        LEFT JOIN director ON movie_director.director_id = director.id 
                        WHERE movies.title LIKE ? OR director.name LIKE ?
                        LIMIT ? OFFSET ?";
                            
                $stmt = $pdo->prepare($query);
                $stmt->bindValue(1, $searchThis, PDO::PARAM_STR); 
                $stmt->bindValue(2, $searchThis, PDO::PARAM_STR); 
                $stmt->bindValue(3, (int)$movieParPage, PDO::PARAM_INT);
                $stmt->bindValue(4, (int)$start, PDO::PARAM_INT);
                $stmt->execute();
                
                $movies = $stmt->fetchAll(PDO::FETCH_ASSOC);
            } catch(PDOException $a) {
                header("Location: ./error404.php");
            }

        }

    ?>
    
    <main class="marginHeader">

        <section id="Movies">
            <h3><?php echo $mainTitleH3 ?></h3>
            <div class="filmsContainerIndex">
                <?php 
                    $succes = false;
                    if($movies){
                        $succes = true;
                        foreach($movies as $movie){
                            echo '<div class="filmCart">';
                            echo '<img src="' . htmlspecialchars($movie["img"]) . '" alt="' . htmlspecialchars($movie["title"]) . '" onerror="this.onerror=null;this.src=\'./assets/placeholder.png\';">';
                            echo '<div class="filmCartText">';
                            echo '<a class="filmTitle" href="./movie.php?id=' . htmlspecialchars($movie['id']) . '">' . htmlspecialchars($movie['title']) . '</a>';
                            echo '<p class="filmPrice">' . htmlspecialchars($movie['price']) . ' €</p>';
                            echo '<a href="./backhand/cart_add.php?id=' . htmlspecialchars($movie['id']) . '" class="filmCartButton">Ajouter au panier</a>';
                            echo '</div>';
                            echo '</div>';
                        }
                    }
                ?>
               
            </div>

            <?php 
                if(!$succes){
                    echo '<div class="erreur">';
                    echo "<p>Nous n'avons pas trouvé de film correspondant à <span class=\"nameInput\">\"" . htmlspecialchars($input) . "\"</span>.</p>";
                    echo "<a href=\"./all_movie.php\" class=\"return\">Tous Les Films</a>";
                    echo ' </div>';
                }

                    ?>
            <ul class="paging">
                <?php 
                    $lastPage = false;
                    if($page - 2 >= 1){

                        echo "<li><a href=\"./all_movie.php?searchInput=" . htmlspecialchars($input) . "&page=" . ($page - 2) . "\" class=\"pageNumber\">" . ($page - 2) . "</a></li>";
                    
                        }

                    if($page - 1 >= 1){

                        echo "<li><a href=\"./all_movie.php?searchInput=" . htmlspecialchars($input) . "&page=" . ($page - 1) . "\" class=\"pageNumber\">" . ($page - 1) . "</a></li>";
                    
                        }

                    echo "<li><a href=\"#\" class=\"pageNumber\" style=\"background:var(--orangey)\">$page </a></li>";
                        
                    if($page + 1 <= $pageCount){

                        echo "<li><a href=\"./all_movie.php?searchInput=" . htmlspecialchars($input) . "&page=" . ($page + 1) . "\" class=\"pageNumber\">" . ($page + 1) . "</a></li>";
                    
                        }

                    if($page + 2 <= $pageCount){

                        echo "<li><a href=\"./all_movie.php?searchInput=" . htmlspecialchars($input) . "&page=" . ($page + 2) . "\" class=\"pageNumber\">" . ($page + 2) . "</a></li>";
                        
                        }

                    if($page + 3 <= $pageCount){

                        echo "<li><span class=\"pageNumber\">...</span></li>";
                    
                        }
                       
                ?> 
            </ul>
        </section>
        
    </main>
    <?php require "./htmlElements/footer.php" ?>
</body>
</html>