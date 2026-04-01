<?php 
session_start();
session_destroy();
if (isset($_SERVER['HTTP_COOKIE'])) {

    $keys = explode(';', $_SERVER['HTTP_COOKIE']);


    foreach($keys as $key){
        $parts = explode('=', $key);
        $keyName = trim($parts[0]);

        setcookie($keyName, '', time() - 999, '/');   
    }
    
    
}

header("Location: ../index.php");
?>