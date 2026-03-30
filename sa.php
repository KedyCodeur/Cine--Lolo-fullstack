<?php
    session_start();
    $host = "localhost";
    $username = "root";
    $port = "3308";
    $password = "cemsahozdemirel";
    $dbname = "lolodb";
    
    $erreur = "";
    try{
        $dsn = "mysql:host=$host;port=$port;dbname=$dbname";
        $pdo = new PDO($dsn,$username,$password);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $erreur = "";
        echo "gay";
    }catch(PDOException $e){
        $erreur = $e->getMessage();
        echo $erreur;
    }


?>

