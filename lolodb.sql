CREATE DATABASE IF NOT EXISTS lolodb;
USE lolodb;


CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) DEFAULT 'User',
    email VARCHAR(191) NOT NULL UNIQUE, 
    password VARCHAR(255) NOT NULL,
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    avatar ENUM('avatar1.jpg', 'avatar2.jpg', 'avatar3.jpg','avatar4.jpg','avatar5.jpg','avatar6.jpg','avatar.png') DEFAULT 'avatar.png' 
);

CREATE TABLE IF NOT EXISTS movies ( 
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    img VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    price DECIMAL(4,2),
    date_sortie DATE
);

CREATE TABLE IF NOT EXISTS genres (
    id INT AUTO_INCREMENT PRIMARY KEY,
    genre VARCHAR(50) NOT NULL UNIQUE
);
 

CREATE TABLE IF NOT EXISTS movie_genre (
    id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    genre_id INT,

    UNIQUE(movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES movies(id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES genres(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS director (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);


CREATE TABLE IF NOT EXISTS movie_director (
    id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    director_id INT,

    UNIQUE(movie_id, director_id),
    FOREIGN KEY(movie_id) REFERENCES movies(id) ON DELETE CASCADE,
    FOREIGN KEY(director_id) REFERENCES director(id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS actors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);


CREATE TABLE IF NOT EXISTS movie_actor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    actor_id INT,

    UNIQUE(movie_id, actor_id),
    FOREIGN KEY(movie_id) REFERENCES movies(id) ON DELETE CASCADE,
    FOREIGN KEY(actor_id) REFERENCES actors(id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS cart_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    user_id INT,
    quantity INT DEFAULT 1, 
    
    UNIQUE(movie_id, user_id),
    FOREIGN KEY(movie_id) REFERENCES movies(id) ON DELETE CASCADE,
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS tokens(
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL UNIQUE,
    token VARCHAR(191) NOT NULL UNIQUE,
    expires DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS purchases(
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    movie_id VARCHAR(191) NOT NULL,
    quantity INT DEFAULT 0,

    UNIQUE(user_id, movie_id),
    FOREIGN KEY(movie_id) REFERENCES movies(id) ON DELETE CASCADE,
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
);