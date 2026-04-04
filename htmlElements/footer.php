    
    <footer>
              
        <nav>
            <div class="footer_container">
                <span class="footerDouble">
                    <div class="contact">
                        <h3>Contacte</h3>
                        <address><a href="https://maps.app.goo.gl/3ziYDVZ1ixHRYpip9">40 Rue du Dr Roux, 75015 Paris</a></address>
                        <a href="tel:0650619333">+33 0650619333</a>
                        <a href="mailto:cemsahozdemirel791@gmail.com">cemsahozdemirel791@gmail.com</a>
                    </div>
                    <div class="navigation">
                        <h3>Liens Utiles</h3>
                        <?php 
                        if(!empty($_SESSION["user_id"])){
                            echo '<a href="./profile.php">Profil</a>';
                            echo  '<a href="./panier.php">Panier</a>';
                        }
                        ?>
                        <a href="./all_movie.php">Films</a>
                        <a href="./index.php#newMovies">Nouveautés</a>
                        <a href="error404.php">Mention Legales</a>
                        
                    </div>
                </span>
                    <div class="contact kys">
                        <h3>Contacte</h3>
                        <address><a href="https://maps.app.goo.gl/3ziYDVZ1ixHRYpip9">40 Rue du Dr Roux, 75015 Paris</a></address>
                        <a href="tel:0650619333">+33 0650619333</a>
                        <a href="mailto:cemsahozdemirel791@gmail.com">cemsahozdemirel791@gmail.com</a>
                    </div>
                    <div class="navigation kys">
                        <h3>Liens Utiles</h3>
                        <?php 
                            if(!empty($_SESSION["user_id"])){
                                echo '<a href="./profile.php">Profil</a>';
                                echo  '<a href="./panier.php">Panier</a>';
                            }
                        ?>
                        <a href="./all_movie.php">Films</a>
                        <a href="./index.php#newMovies">Nouveautés</a>
                        <a href="./error404.php">Mention Legales</a>
                        
                    </div>
                <div class="social">
                    <h3>Réseaux Sociaux</h3>
                    <div class="social_img">
                        <a href="./error404.php" class="social_boutton"><img src="./assets/insta.png" alt="le compte d'instagram du Lolo" ></a>
                        <a href="./error404.php" class="social_boutton"><img src="./assets/facebook.png" alt="le compte de facebook du Lolo"></a>
                        <a href="./error404.php" class="social_boutton"><img src="./assets/youtube.png" alt="le compte de youtube du Lolo"></a>
                        <a href="./error404.php" class="social_boutton"><img src="./assets/twitter.svg" alt="le compte de twitter du Lolo"></a>
                    </div>
                </div>
            </div>
            <p>&copy; 2025 KedyCodeur. Tous droits réservés.</p>
         </nav>

         
    </footer>