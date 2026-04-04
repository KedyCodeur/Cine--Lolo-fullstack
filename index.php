<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ciné Lolo</title>
        
        <meta name="author" content="KedyCodeur">
        <meta name="description" content="Page d'accueil de Ciné Lolo">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/index.css">
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

        
        if(isset($_SESSION["messageRegister"])){
            
                $_SESSION["messageRegister"] = "";
        }
        if(isset($_SESSION["messageLogin"])){
            
                $_SESSION["messageLogin"] = "";
        }

        if(isset($_COOKIE["token"])){
             
            try{
                $tokenHashed = hash("sha256",$_COOKIE["token"]);

                $query = "SELECT user_id,expires FROM tokens WHERE token = ?";
                $stmt = $pdo->prepare($query);
                $stmt->execute([$tokenHashed]);
               
                $infos = $stmt->fetch(PDO::FETCH_ASSOC);

                $expires = $infos["expires"] ?? "";
                $user_id = $infos["user_id"] ?? "";
          
                if($expires && $user_id){
                     
                    if(time() <= strtotime($expires)){
                       $_SESSION["user_id"]=$user_id;
                    
                    try{
                        $query = "SELECT username,avatar FROM users WHERE id = ?";
                        $statement = $pdo->prepare($query);
                        $statement->execute([$user_id]);
                        $userInfo = $statement->fetch(PDO::FETCH_ASSOC);

                        if($userInfo){
                            $_SESSION["username"] = $userInfo["username"];
                            $_SESSION["avatar"] = $userInfo["avatar"];
                        }

                    }
                    catch(PDOException $a){
                        $_SESSION["username"] ="";
                        $_SESSION["avatar"] = "";
                    }

                    }

                }


            }catch(PDOException $a){
                //pas besoin de faire qqchs parce que au pire il devra se connecter encore une fois 
                
            }
        }

        
    ?>

    <main class="marginHeader">
        <section id="Hero" class="heroSection">
            <div class="heroPart p1">
                <ul>
                    <li><img src="./assets/heroSection/alone.jpg" alt="Home Sweet Home Alone"></li>
                    <li><img src="./assets/heroSection/batman.jpg" alt="Batman Ninja"></li>
                    <li><img src="./assets/heroSection/Deadpool.jpg" alt="Deadpool 1"></li>
                    <li><img src="./assets/heroSection/jujutsu.jpg" alt="Jujutsu Kaisen 0"></li>
                    <li><img src="./assets/heroSection/hulk.jpg" alt="The Incredible Hulk"></li>
                    <li><img src="./assets/heroSection/spider.jpg" alt="Spider-man into the spiderverse"></li>
                    <li><img src="./assets/heroSection/scream.jpg" alt="The Scream 7"></li>
                    <li><img src="./assets/heroSection/lucifer.jpg" alt="Lucifer"></li>


                    <li><img src="./assets/heroSection/alone.jpg" alt="Home Sweet Home Alone"></li>
                    <li><img src="./assets/heroSection/batman.jpg" alt="Batman Ninja"></li>
                    <li><img src="./assets/heroSection/Deadpool.jpg" alt="Deadpool 1"></li>
                    <li><img src="./assets/heroSection/jujutsu.jpg" alt="Jujutsu Kaisen 0"></li>
                    <li><img src="./assets/heroSection/hulk.jpg" alt="The Incredible Hulk"></li>
                    <li><img src="./assets/heroSection/spider.jpg" alt="Spider-man into the spiderverse"></li>
                    <li><img src="./assets/heroSection/scream.jpg" alt="The Scream 7"></li>
                    <li><img src="./assets/heroSection/lucifer.jpg" alt="Lucifer"></li>
                </ul>
            </div>

            <div class="heroPart p2">
                <ul>
                    <li><img src="./assets/heroSection/alone2.jpg" alt="The Sweet home Alone 2"></li>
                    <li><img src="./assets/heroSection/psycho_killer.jpg" alt="Psycho Killer 2024"></li>
                    <li><img src="./assets/heroSection/pyscho_killer_2026.jpg" alt="Psycho Killer 2026"></li>
                    <li><img src="./assets/heroSection/strangers.jpg" alt="The Strangers: Chapter 3"></li>
                    <li><img src="./assets/heroSection/hacker.jpg" alt="The Hacker"></li>
                    <li><img src="./assets/heroSection/behind.jpg" alt="Behind the Curtain: Stranger Things: The First Shadow"></li>
                    <li><img src="./assets/heroSection/Abattoir.jpg" alt="Abattoir"></li>
                    <li><img src="./assets/heroSection/venom.jpg" alt="Venom 2"></li>
                    
                    

                    <li><img src="./assets/heroSection/alone2.jpg" alt="The Sweet home Alone 2"></li>
                    <li><img src="./assets/heroSection/psycho_killer.jpg" alt="Psycho Killer 2024"></li>
                    <li><img src="./assets/heroSection/pyscho_killer_2026.jpg" alt="Psycho Killer 2026"></li>
                    <li><img src="./assets/heroSection/strangers.jpg" alt="The Strangers: Chapter 3"></li>
                    <li><img src="./assets/heroSection/hacker.jpg" alt="The Hacker"></li>
                    <li><img src="./assets/heroSection/behind.jpg" alt="Behind the Curtain: Stranger Things: The First Shadow"></li>
                    <li><img src="./assets/heroSection/Abattoir.jpg" alt="Abattoir"></li>
                    <li><img src="./assets/heroSection/venom.jpg" alt="Venom 2"></li>

                    

                </ul>
            </div>


            <div class="heroPart p3">
                <ul>
                    <li><img src="./assets/heroSection/zombies.jpg" alt="We Are Zombies"></li>
                    <li><img src="./assets/heroSection/zombieland.jpg" alt="Zombieland: Double Tap"></li>
                    <li><img src="./assets/heroSection/doctor.jpg" alt="JFK: What the Doctors Saw"></li>
                    <li><img src="./assets/heroSection/strange.jpg" alt="Doctor Strange in the Multiverse of Madness"></li>
                    <li><img src="./assets/heroSection/sleep.jpg" alt="Doctor Sleep"></li>
                    <li><img src="./assets/heroSection/cars2.jpg" alt="Cars 2"></li>
                    <li><img src="./assets/heroSection/hitler.jpg" alt="The Meaning of Hitler"></li>
                    <li><img src="./assets/heroSection/seflhelp.jpg" alt="Self-Help"></li>
                    
                    

                    <li><img src="./assets/heroSection/zombies.jpg" alt="We Are Zombies"></li>
                    <li><img src="./assets/heroSection/zombieland.jpg" alt="Zombieland: Double Tap"></li>
                    <li><img src="./assets/heroSection/doctor.jpg" alt="JFK: What the Doctors Saw"></li>
                    <li><img src="./assets/heroSection/strange.jpg" alt="Doctor Strange in the Multiverse of Madness"></li>
                    <li><img src="./assets/heroSection/sleep.jpg" alt="Doctor Sleep"></li>
                    <li><img src="./assets/heroSection/cars2.jpg" alt="Cars 2"></li>
                    <li><img src="./assets/heroSection/hitler.jpg" alt="The Meaning of Hitler"></li>
                    <li><img src="./assets/heroSection/seflhelp.jpg" alt="Self-Help"></li>

                    

                </ul>
            </div>
            <div class="heroContent">
                <h2>Regardez maintenant. Partout. À tout moment.</h2>
                <a href="./films.index" class="heroButton">Explorer</a>
            </div>
        </section>

        <section id="presentation" class="presentationTexts">
            <div class="presentationCart">
                <h3>L'Équipage derrière l'Écran</h3>
                <p>Ciné Lolo n'est pas qu'une plateforme, c'est une célébration du Septième Art. Passionnés par la narration visuelle, nous avons créé cet espace pour les cinéphiles qui exigent plus qu'un simple film : une immersion totale. Notre mission ? Vous offrir l'accès aux chefs-d'œuvre qui marquent l'histoire, un pixel à la fois.</p>
            </div>

            <div class="presentationCart">
                <h3>Votre Cinémathèque Personnelle</h3>
                <p>Achetez vos films préférés et constituez-vous une collection numérique éternelle. Accédez à vos titres à tout moment, sans abonnement, sans limite. Votre cinéma, vos règles.</p>
            </div>

            <div class="presentationCart">
                <h3>Directement du Cinéma</h3>
                <p>Ne manquez plus aucune sortie. Retrouvez les films fraîchement sortis des salles obscures directement dans votre salon. Plus besoin d'attendre : les plus grands blockbusters sont déjà là, sur Lolo.</p>
            </div>
        </section>

        <section id="newMovies">
            <h3>Récemment Ajoutés</h3>
            <div class="filmsContainerIndex">

                <?php 
                    require "./backhand/dbconnection.php";
                    try{
                        $query = "SELECT id, img, title, price, added FROM movies ORDER BY added DESC LIMIT 6";
                        $stmt = $pdo->prepare($query);
                        $stmt->execute();
                        $movies = $stmt->fetchAll(PDO::FETCH_ASSOC);

                        if($movies){
                            foreach($movies as $movie){
                                echo "<div class=\"filmCart\">
                                        <img src=\"" . htmlspecialchars($movie['img']) . "\" alt=\"" . htmlspecialchars($movie['title']) . "\" onerror=\"this.onerror=null;this.src='./assets/placeholder.png';\">
                                        <div class=\"filmCartText\">
                                            <a class=\"filmTitle\" href=\"./movie.php?id=" . htmlspecialchars($movie['id']) . "\">" . htmlspecialchars($movie['title']) . "</a>
                                            <p class=\"filmPrice\">" . htmlspecialchars($movie['price']) . "€</p>
                                            <a href=\"./backhand/cart_add.php?id=" . htmlspecialchars($movie['id']) . "\" class=\"filmCartButton\">Ajouter au panier</a>
                                        </div>
                                    </div>";                         
                            }
                        }else{
                            echo "<p class = \"erreurVideFilms \">Erreur lors du chargement des films.</p>";
                        }
                    
                    
                    }
                    catch(PDOException $e){
                        echo "<p class = \"erreurVideFilms \">Erreur lors du chargement des films.</p>";
                    }
                ?>

            </div>

        </section>


    </main>



</body>
</html>