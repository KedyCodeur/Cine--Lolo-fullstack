USE lolodb;

-- 1. ADIM: TABLOLARI SIFIRLA (Hata almamak için temizlik)
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE movie_actor;
TRUNCATE TABLE movie_director;
TRUNCATE TABLE movie_genre;
TRUNCATE TABLE movies;
TRUNCATE TABLE actors;
TRUNCATE TABLE director;
TRUNCATE TABLE genres;
SET FOREIGN_KEY_CHECKS = 1;

-- 2. ADIM: KATEGORİLER (GENRES)
INSERT INTO genres (id, genre) VALUES 
(1, 'Action'), 
(2, 'Drame'), 
(3, 'Comédie');

-- 3. ADIM: YÖNETMENLER (DIRECTORS)
INSERT INTO director (id, name) VALUES 
(1, 'Christopher Nolan'), (2, 'Steven Spielberg'), (3, 'James Cameron'), 
(4, 'Frank Darabont'), (5, 'Martin Scorsese'), (6, 'Quentin Tarantino'),
(7, 'Francis Ford Coppola'), (8, 'Todd Phillips'), (9, 'Greta Gerwig'),
(10, 'Bong Joon-ho'), (11, 'George Miller'), (12, 'Ridley Scott');

-- 4. ADIM: FİLMLER (MOVIES) - 30 ADET
INSERT INTO movies (id, title, img, description, price, date_sortie) VALUES
-- --- ACTION (1-10) ---
(1, 'The Dark Knight', 'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg', 'Batman affronte le Joker dans une lutte psychologique intense pour sauver Gotham.', 12.99, '2008-07-18'),
(2, 'Inception', 'https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_.jpg', 'Un voleur spécialisé dans l''extraction de secrets par les rêves accepte une mission ultime.', 11.99, '2010-07-16'),
(3, 'John Wick', 'https://m.media-amazon.com/images/M/MV5BMTU2NjA1ODgzMF5BMl5BanBnXkFtZTgwMTM2MTI4MjE@._V1_.jpg', 'Un ancien tueur à gages sort de sa retraite pour venger la mort de son chien.', 9.99, '2014-10-24'),
(4, 'Mad Max: Fury Road', 'https://m.media-amazon.com/images/M/MV5BN2EwM2I5OWMtMGNlNi00NWUzLWI3MTktZTcyNjBkNzY0ZjE3XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg', 'Dans un monde post-apocalyptique, Max s''allie à Furiosa pour échapper à un tyran.', 10.99, '2015-05-15'),
(5, 'Gladiator', 'https://m.media-amazon.com/images/M/MV5BMDliMmNhNDEtODUyOS00MjNlLTgxODEtN2U3NzcxMGVkZTA1L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg', 'Un général romain trahi revient à Rome en tant que gladiateur pour se venger.', 9.99, '2000-05-05'),
(6, 'The Matrix', 'https://m.media-amazon.com/images/M/MV5BNzQzOTk3OTAtNDQ0Zi00ZTVkLWI0MTEtMDllZjNkYzNjNTc4L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg', 'Un programmeur découvre que sa réalité n''est qu''une simulation contrôlée par des machines.', 8.99, '1999-03-31'),
(7, 'Kill Bill: Vol. 1', 'https://m.media-amazon.com/images/M/MV5BNzM3NDFhYTAtYmU5Mi00NGRmLTljYjgtMDkyODQ4MjkwOWYxXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg', 'Une mariée sort du coma et jure de tuer tous ceux qui l''ont trahie.', 10.50, '2003-10-10'),
(8, 'Top Gun: Maverick', 'https://m.media-amazon.com/images/M/MV5BZWYzOGEwNTgtNWU3NS00ZGQ0LThiNDUtY2U2ZWNkN2IyY2MzXkEyXkFqcGdeQXVyMjkwOTAyMDU@._V1_.jpg', 'Après 30 ans de service, Maverick forme de nouveaux pilotes pour une mission périlleuse.', 14.99, '2022-05-27'),
(9, 'Die Hard', 'https://m.media-amazon.com/images/M/MV5BZjRlNDUxZjAtOGQ4OC00OTNlLTgxNmQtYjU3ZGIxOTFmM2EwXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg', 'Un policier new-yorkais se retrouve seul face à des terroristes dans un gratte-ciel.', 7.99, '1988-07-15'),
(10, 'Terminator 2', 'https://m.media-amazon.com/images/M/MV5BMGU2NzRmZjUtOGUxYS00ZjdjLWEwZWItY2NlM2JhNjkxNTFmXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg', 'Un cyborg reprogrammé doit protéger un enfant contre un modèle plus avancé.', 8.99, '1991-07-03'),

-- --- DRAME (11-20) ---
(11, 'The Shawshank Redemption', 'https://m.media-amazon.com/images/M/MV5BNDE3ODcxNzMtY2YzZC00NmNlLWJiNDMtZDViZWM2MzIxZDYwXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg', 'L''amitié de deux prisonniers sur plusieurs décennies dans une prison brutale.', 9.50, '1994-09-22'),
(12, 'The Godfather', 'https://m.media-amazon.com/images/M/MV5BMWMwMGQzZTItY2JlNC00OWZiLWIyMDctNDk2ZDQ2YjRjMWQ0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg', 'Le patriarche d''une dynastie du crime organisé transfère le contrôle à son fils réticent.', 13.99, '1972-03-24'),
(13, 'Oppenheimer', 'https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNjc2M2UxN2Y5N2VkXkEyXkFqcGdeQXVyMTUzMTg2ODkz._V1_.jpg', 'L''histoire de Robert Oppenheimer et la création de la première bombe atomique.', 15.50, '2023-07-21'),
(14, 'Joker', 'https://m.media-amazon.com/images/M/MV5BNGVjNWI4ZGUtNzE0MS00YTJkLTkwY2ItNzk1YmFiZTYxMTYzXkEyXkFqcGdeQXVyMzI2NzE1NjU@._V1_.jpg', 'La descente d''un comédien raté vers la folie et le crime à Gotham City.', 11.00, '2019-10-04'),
(15, 'Parasite', 'https://m.media-amazon.com/images/M/MV5BYWZjMjk3ZTItODQ2ZC00NTY5LWE0ZDYtZTI3MjcwN2Q5NTVkXkEyXkFqcGdeQXVyODk4OTc3MTY@._V1_.jpg', 'Une famille pauvre s''infiltre sournoisement dans la vie d''une famille riche.', 12.00, '2019-05-30'),
(16, 'Titanic', 'https://m.media-amazon.com/images/M/MV5BMDdmZGU3NDQtY2E5My00ZTliLWIzOTUtOTU4YjdmZ2QyNzI3XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_.jpg', 'Une romance tragique à bord du RMS Titanic lors de son voyage inaugural.', 9.99, '1997-12-19'),
(17, 'The Green Mile', 'https://m.media-amazon.com/images/M/MV5BMTUxMzQyNjA5MF5BMl5BanBnXkFtZTYwOTU2NTY3._V1_.jpg', 'Un gardien de prison découvre qu''un condamné à mort possède un don mystique.', 8.50, '1999-12-10'),
(18, 'Forrest Gump', 'https://m.media-amazon.com/images/M/MV5BNWIwODRlZTUtY2U3ZS00Y2I1LTgxY2ItZDU5ZDRlZTFlZTIyXkEyXkFqcGdeQXVyMTMzNyE5MTM@._V1_.jpg', 'La vie extraordinaire d''un homme simple qui assiste aux grands événements de l''histoire.', 9.00, '1994-07-06'),
(19, 'Schindler''s List', 'https://m.media-amazon.com/images/M/MV5BNDE4OTMxMTctNmRhYy00NWE2LTg3YzItYTk3M2UwOTU5Njg4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg', 'Un industriel allemand sauve plus d''un millier de Juifs pendant l''Holocauste.', 10.99, '1993-12-15'),
(20, 'Cinema Paradiso', 'https://m.media-amazon.com/images/M/MV5BM2FhYjEyYmYtMDI1Yy00YTdlLWI2NWQtYmEzNzAxOGY1NjY2XkEyXkFqcGdeQXVyNTA3MTU2MjE@._V1_.jpg', 'L''amitié émouvante entre un projectionniste et un jeune garçon passionné de cinéma.', 8.99, '1988-11-17'),

-- --- COMÉDIE (21-30) ---
(21, 'The Wolf of Wall Street', 'https://m.media-amazon.com/images/M/MV5BMjIxMjgxNTk0MF5BMl5BanBnXkFtZTgwNjIyOTg2MDE@._V1_.jpg', 'La vie d''excès et de fraude d''un courtier en bourse à New York.', 12.50, '2013-12-25'),
(22, 'Barbie', 'https://m.media-amazon.com/images/M/MV5BNjU3N2QxNzYtMjk1NC00MTc2LTk1MGQtYmUxNmIyNjMwMGY1XkEyXkFqcGdeQXVyMTUzMTg2ODkz._V1_.jpg', 'Barbie quitte son monde parfait pour découvrir la réalité du monde des humains.', 13.99, '2023-07-21'),
(23, 'Hangover', 'https://m.media-amazon.com/images/M/MV5BNGQwZjg5MTUtY2ViMi00NzExLWEzYTItZWU0YjE1ZGVmYzU1XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_.jpg', 'Trois amis se réveillent après un enterrement de vie de garçon sans souvenir de la nuit.', 8.99, '2009-06-05'),
(24, 'The Truman Show', 'https://m.media-amazon.com/images/M/MV5BMDIzODcyY2EtMmY2MC00ZWVlLTgwMzAtMjQwOWUyNmJjNTYyXkEyXkFqcGdeQXVyNDk3NzU2MTQ@._V1_.jpg', 'Un homme découvre que sa vie entière est une émission de téléréalité filmée à son insu.', 10.00, '1998-06-05'),
(25, 'Deadpool', 'https://m.media-amazon.com/images/M/MV5BYzE5MjY1ZDgtMTkyNC00MTMyLThhMjAtOTM5NWFmN2U4ZTgwXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg', 'Un ancien mercenaire doté d''un pouvoir de guérison traque l''homme qui a détruit sa vie.', 11.50, '2016-02-12'),
(26, 'Superbad', 'https://m.media-amazon.com/images/M/MV5BMTc0NjIyMjA2OF5BMl5BanBnXkFtZTcwMzIxNDE1MQ@@._V1_.jpg', 'Deux lycéens tentent d''acheter de l''alcool pour une fête afin de séduire des filles.', 7.50, '2007-08-17'),
(27, 'Back to the Future', 'https://m.media-amazon.com/images/M/MV5BZmU0M2Y1OGUtZjIxNi00ZjBkLTg1MjgtOWIyNThiZWIwYjRiXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_.jpg', 'Un adolescent voyage accidentellement dans le passé grâce à une DeLorean.', 9.99, '1985-07-03'),
(28, 'Home Alone', 'https://m.media-amazon.com/images/M/MV5BMzFkM2YwOTQtYzk2Mi00N2VmLTg3M2EtYmYwOWRiNjgzZWM0XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg', 'Un garçon de 8 ans doit défendre sa maison contre deux cambrioleurs à Noël.', 6.99, '1990-11-16'),
(29, 'Snatch', 'https://m.media-amazon.com/images/M/MV5BMTA2NDYxOGYtYjU1Mi00Y2QzLTgxMTQtMWI1MGI0ZGQ5MmU4XkEyXkFqcGdeQXVyNDk3NzU2MTQ@._V1_.jpg', 'Des promoteurs de boxe, des parieurs russes veulents récupérer un diamant volé.', 10.99, '2000-08-23'),
(30, 'Ratatouille', 'https://m.media-amazon.com/images/M/MV5BMTY1OTg0OTkwOV5BMl5BanBnXkFtZTcwODEyMzgzMQ@@._V1_.jpg', 'Un rat passionné de cuisine s''associe à un jeune cuisinier à Paris.', 11.00, '2007-06-29');

-- 5. ADIM: AKTÖRLER (ACTORS)
INSERT INTO actors (id, name) VALUES 
(1, 'Christian Bale'), (2, 'Leonardo DiCaprio'), (3, 'Keanu Reeves'), 
(4, 'Tom Hardy'), (5, 'Russell Crowe'), (6, 'Morgan Freeman'), 
(7, 'Al Pacino'), (8, 'Tom Hanks'), (9, 'Margot Robbie'), (10, 'Joaquin Phoenix');

-- 6. ADIM: FİLM-KATEGORİ BAĞLANTILARI (MOVIE_GENRE)
-- Action (1-10)
INSERT INTO movie_genre (movie_id, genre_id)
SELECT id, 1 FROM movies WHERE id <= 10;

-- Drame (11-20)
INSERT INTO movie_genre (movie_id, genre_id)
SELECT id, 2 FROM movies WHERE id BETWEEN 11 AND 20;

-- Comédie (21-30)
INSERT INTO movie_genre (movie_id, genre_id)
SELECT id, 3 FROM movies WHERE id BETWEEN 21 AND 30;

-- 7. ADIM: FİLM-YÖNETMEN BAĞLANTILARI (MOVIE_DIRECTOR)
INSERT INTO movie_director (movie_id, director_id) VALUES 
(1,1), (2,1), (17,1), (10,2), (13,2), (19,2), (6,3), (16,3), (11,4), 
(12,7), (14,8), (22,9), (15,10), (4,11), (5,12), (3,3), (8,3), (21,6);

-- 8. ADIM: FİLM-AKTÖR BAĞLANTILARI (MOVIE_ACTOR)
INSERT INTO movie_actor (movie_id, actor_id) VALUES 
(1,1), (2,2), (21,2), (3,3), (4,4), (5,5), (11,6), (12,7), (18,8), (22,9), (14,10);


USE lolodb;

-- Önce ara tabloları temizleyelim ki mükerrer kayıt olmasın
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE movie_actor;
TRUNCATE TABLE movie_director;
SET FOREIGN_KEY_CHECKS = 1;

-- --------------------------------------------------------
-- 1. YÖNETMENLERİ FİLMLERLE EŞLEŞTİR (Aynı yönetmen, çok film)
-- --------------------------------------------------------
INSERT INTO movie_director (movie_id, director_id) VALUES 
-- Christopher Nolan (ID: 1)
(1, 1),  -- The Dark Knight
(2, 1),  -- Inception
(13, 1), -- Oppenheimer
-- Steven Spielberg (ID: 2)
(10, 2), -- Indiana Jones
(19, 2), -- Schindler's List
-- Martin Scorsese (ID: 6)
(21, 6), -- The Wolf of Wall Street
(12, 6), -- The Godfather (Normalde Coppola ama tabloyu zenginleştirmek için Scorsese'ye de bağlayabiliriz veya 7'ye bağla)
-- Todd Phillips (ID: 8)
(14, 8), -- Joker
(23, 8), -- Hangover
-- Quentin Tarantino (ID: 7)
(7, 7),  -- Kill Bill
(29, 7); -- Snatch (Guy Ritchie yerine Tarantino tarzı diye eşledim)

-- --------------------------------------------------------
-- 2. AKTÖRLERİ FİLMLERLE EŞLEŞTİR (Bir filmde birden fazla aktör)
-- --------------------------------------------------------

-- Önce eksik olabilecek kült aktörleri ekleyelim
INSERT IGNORE INTO actors (id, name) VALUES 
(11, 'Cillian Murphy'), 
(12, 'Robert Downey Jr.'), 
(13, 'Brad Pitt'), 
(14, 'Jonah Hill'),
(15, 'Heath Ledger');

INSERT INTO movie_actor (movie_id, actor_id) VALUES 
-- The Dark Knight: Christian Bale + Heath Ledger
(1, 1), 
(1, 15), 

-- Inception: DiCaprio + Tom Hardy + Cillian Murphy
(2, 2), 
(2, 4), 
(2, 11),

-- Oppenheimer: Cillian Murphy + Robert Downey Jr.
(13, 11),
(13, 12),

-- The Wolf of Wall Street: DiCaprio + Jonah Hill
(21, 2),
(21, 14),

-- Django / Snatch tarzı (Brad Pitt eklemesi)
(29, 13), 

-- Joker: Joaquin Phoenix
(14, 10),

-- Interstellar (Eğer listede olsaydı Matthew McConaughey + Anne Hathaway olurdu)
-- Mevcut listeden devam:
(3, 3), -- John Wick: Keanu Reeves

-- Barbie: Margot Robbie + Ryan Gosling (Gosling'i 16 olarak ekleyebilirsin)
(22, 9);

-- --------------------------------------------------------
-- 3. KONTROL SORGUSU (Her şey doğru mu?)
-- --------------------------------------------------------
-- Bu sorguyu çalıştırarak hangi filmde kimler var görebilirsin:
/*
SELECT m.title, d.name AS director, GROUP_CONCAT(a.name SEPARATOR ', ') AS actors
FROM movies m
JOIN movie_director md ON m.id = md.movie_id
JOIN director d ON md.director_id = d.id
JOIN movie_actor ma ON m.id = ma.movie_id
JOIN actors a ON ma.actor_id = a.id
GROUP BY m.id;
*/