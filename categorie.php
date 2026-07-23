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
        
        if(!empty($erreur)){ 
            header("Location: ./error404.php");
            exit();
        }
        
        $movies =[];
        $pageCount = 0;
        if(!isset($_GET["page"])){
            $_GET["page"] = 1;
        }
        if(!isset($_GET["categorie"])){
           header("Location: ./error404.php");
            exit();
        }

        $categorie = $_GET["categorie"];
        
        switch(true){
            case $categorie == "action":
                $mainTitleH3 = "Action";
                break;
            case $categorie == "drame":
                $mainTitleH3 = "Drame";
                break;
            case $categorie == "comédie":
                $mainTitleH3 = "Comédie";
                break;
        }
       
        try{
            $query = "SELECT id FROM genres WHERE LOWER(genre) = LOWER(?)";
            $stmt = $pdo->prepare($query);
            $stmt->execute([$categorie]);
            $genre_id = $stmt->fetchColumn();
            
            
            if(!$genre_id){
                header("Location: ./error404.php");
                exit();
            }
                
            $query = "SELECT movie_id FROM movie_genre WHERE genre_id = ?";
            $stmt = $pdo->prepare($query);
            $stmt->execute([$genre_id]);
            $movie_ids = $stmt->fetchAll(PDO::FETCH_COLUMN);
            
            if(!$movie_ids){
                header("Location: ./error404.php");
                 exit();
            }

            $pageCount = ceil(count($movie_ids) / 12);
           
        }catch(PDOException $a){
            header("Location: ./error404.php");
             exit();
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
        
        
        try{
            
            $args = array_merge($movie_ids,[(int)$start,(int)$movieParPage]);
            $placeholder = implode(",",array_fill(0,count($movie_ids),"?"));
            $query = "SELECT img,title,id,price FROM movies WHERE id IN ($placeholder) LIMIT $start, $movieParPage";
            $stmt = $pdo->prepare($query);
            $stmt->execute($movie_ids);
            $movies = $stmt->fetchAll(PDO::FETCH_ASSOC);
            }
        catch(PDOException $a){
            header("Location: ./error404.php");
            exit();
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
if($page - 2 >= 1)
    echo "<li><a href=\"./categorie.php?categorie=" . htmlspecialchars($categorie) . "&page=" . ($page - 2) . "\" class=\"pageNumber\">" . ($page - 2) . "</a></li>";

if($page - 1 >= 1)
    echo "<li><a href=\"./categorie.php?categorie=" . htmlspecialchars($categorie) . "&page=" . ($page - 1) . "\" class=\"pageNumber\">" . ($page - 1) . "</a></li>";

echo "<li><a href=\"#\" class=\"pageNumber\" style=\"background:var(--orangey)\">$page</a></li>";

if($page + 1 <= $pageCount)
    echo "<li><a href=\"./categorie.php?categorie=" . htmlspecialchars($categorie) . "&page=" . ($page + 1) . "\" class=\"pageNumber\">" . ($page + 1) . "</a></li>";

if($page + 2 <= $pageCount)
    echo "<li><a href=\"./categorie.php?categorie=" . htmlspecialchars($categorie) . "&page=" . ($page + 2) . "\" class=\"pageNumber\">" . ($page + 2) . "</a></li>";

if($page + 3 <= $pageCount)
    echo "<li><span class=\"pageNumber\">...</span></li>";
                       
                ?> 
            </ul>
        </section>
        
    </main>
    <?php require "./htmlElements/footer.php" ?>
</body>
</html>