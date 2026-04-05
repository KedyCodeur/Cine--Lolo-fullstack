

USE lolodb;


-- ca c fait par chat gpt pour économiser du temp  est c'était deja permis

-- All the data (from director, to actor or other) don't need to be true or specific
-- you can reuse data from internet


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

USE lolodb;

UPDATE movies SET description = CASE id
    -- ACTION (1-10)
    WHEN 1 THEN 'Dans ce chef-d''œuvre de Christopher Nolan, Batman doit affronter son ennemi le plus imprévisible : le Joker. Ce génie du mal plonge Gotham City dans une anarchie totale, forçant le Chevalier Noir à remettre en question ses propres principes moraux. Entre sacrifices héroïques et dilemmes psychologiques, la lutte pour l''âme de la ville atteint un point de non-retour.'
    WHEN 2 THEN 'Dom Cobb est un extracteur hors pair qui vole des secrets précieux dans les rêves des gens pendant qu''ils sont le plus vulnérables. Pour sa dernière mission, on lui demande de ne pas voler une idée, mais d''en implanter une : l''inception. Accompagné d''une équipe d''experts, il va devoir naviguer à travers des couches de rêves de plus en plus instables et dangereuses.'
    WHEN 3 THEN 'John Wick, un ancien tueur à gages légendaire, tente de mener une vie paisible après la mort de sa femme. Cependant, lorsque le fils d''un parrain de la mafia commet l''erreur fatale de voler sa voiture et de tuer son chien, Wick sort de sa retraite pour une vendetta sanglante. Rien ne pourra arrêter cette machine à tuer dans sa quête de justice impitoyable à travers New York.'
    WHEN 4 THEN 'Hanté par son passé, Mad Max erre seul dans un désert post-apocalyptique où l''humanité a perdu tout sens moral. Il se retrouve malgré lui embarqué avec l''impératrice Furiosa, qui tente de sauver un groupe de femmes des griffes du tyran Immortan Joe. S''ensuit une course-poursuite titanesque et visuellement époustouflante à travers des terres désolées et impitoyables.'
    WHEN 5 THEN 'Le général romain Maximus est le favori de l''empereur Marc Aurèle, mais il subit la trahison brutale de Commode, le fils de l''empereur. Après avoir échappé de peu à la mort et vu sa famille massacrée, il est réduit en esclavage et devient gladiateur. Sa force et son courage dans l''arène vont lui permettre de défier l''Empire pour venger les siens devant le peuple romain.'
    WHEN 6 THEN 'Thomas Anderson, un programmeur qui pirate sous le pseudonyme de Neo, découvre que sa réalité n''est qu''une prison numérique créée par des machines. Libéré par le mystérieux Morpheus, il apprend qu''il est peut-être "l''Élu" capable de manipuler le code de la Matrice. Une guerre épique commence pour libérer l''humanité de son sommeil artificiel et reprendre le contrôle du monde réel.'
    WHEN 7 THEN 'Le jour de son mariage, une tueuse à gages connue sous le nom de "La Mariée" est trahie par son propre clan et laissée pour morte. Après quatre ans de coma, elle se réveille avec une seule idée en tête : l''extermination totale de ceux qui lui ont tout pris. Munie d''un sabre forgé par Hattori Hanzo, elle entame un voyage sanglant qui la mènera d''Okinawa à Tokyo pour confronter son passé.'
    WHEN 8 THEN 'Plus de trente ans après avoir été l''un des meilleurs pilotes de chasse de la Marine, Pete "Maverick" Mitchell continue de repousser les limites en tant que pilote d''essai. Il est rappelé pour former un groupe de jeunes diplômés d''élite pour une mission suicide quasi impossible. Parmi eux se trouve le fils de son défunt ami Goose, forçant Maverick à affronter ses peurs les plus profondes.'
    WHEN 9 THEN 'John McClane, policier de New York, arrive à Los Angeles pour passer les fêtes de Noël avec sa famille dans le gratte-ciel Nakatomi Plaza. La soirée tourne au cauchemar lorsqu''un groupe de terroristes prend le bâtiment en otage pour voler des millions de dollars. Seul, pieds nus et armé de son courage, McClane va mener une guérilla urbaine contre les assaillants pour sauver sa femme.'
    WHEN 10 THEN 'Dix ans après l''échec du premier Terminator, un nouveau modèle plus avancé, le T-1000, est envoyé du futur pour éliminer le jeune John Connor. Pour le protéger, la résistance envoie un T-800 reprogrammé, identique à celui qui avait tenté de tuer sa mère. Une course contre la montre s''engage pour empêcher le "Jugement Dernier" et la destruction totale de la civilisation humaine.'

    -- DRAME (11-20)
    WHEN 11 THEN 'Andy Dufresne est condamné à perpétuité pour un double meurtre qu''il clame ne pas avoir commis et est envoyé à la prison de Shawshank. Il y découvre l''horreur du système carcéral mais se lie d''amitié avec Red, un détenu d''expérience qui connaît tous les rouages du milieu. Ensemble, ils vont cultiver l''espoir là où il semble interdit, prouvant que l''esprit humain peut rester libre même derrière des barreaux.'
    WHEN 12 THEN 'À la fin des années 1940, à New York, Don Vito Corleone est à la tête d''une des plus puissantes familles de la mafia. Lorsque le Don refuse de s''impliquer dans le trafic de drogue, une guerre sanglante éclate avec les autres familles rivales. Son fils Michael, qui voulait rester loin des activités criminelles, se voit contraint de prendre les rênes de l''empire pour protéger l''honneur et la survie des siens.'
    WHEN 13 THEN 'Ce film retrace l''ascension et la chute de J. Robert Oppenheimer, le brillant physicien surnommé le "père de la bombe atomique". En pleine Seconde Guerre mondiale, il dirige le projet Manhattan dans une course effrénée contre les nazis pour maîtriser la puissance nucléaire. Mais après le succès de Los Alamos, Oppenheimer est hanté par les conséquences dévastatrices de son invention et les persécutions politiques.'
    WHEN 14 THEN 'Arthur Fleck est un homme brisé qui vit en marge d''une société de Gotham City en pleine décomposition. Entre son travail de clown pathétique et ses troubles mentaux ignorés, il subit humiliation sur humiliation au quotidien. Cette spirale de rejet et de violence va finir par briser ses derniers liens avec la réalité, transformant un homme triste en un symbole anarchique et terrifiant : le Joker.'
    WHEN 15 THEN 'La famille Kim vit dans la misère, survivant de petits boulots dans un sous-sol insalubre au cœur de Séoul. Par un concours de circonstances, le fils réussit à s''introduire chez la riche famille Park comme tuteur d''anglais. Petit à petit, les Kim manipulent les Park pour se faire embaucher un par un, mais cette ascension sociale frauduleuse va révéler des secrets sombres et mener à une tragédie inévitable.'
    WHEN 16 THEN 'En avril 1912, le Titanic, le paquebot le plus luxueux jamais construit, entame son voyage inaugural vers New York. À son bord, Rose, une jeune femme de la haute société étouffée par les conventions, rencontre Jack, un artiste vagabond plein de vie. Leur romance passionnée brise les barrières sociales, mais le destin frappe tragiquement lorsque le navire percute un iceberg dans les eaux glaciales de l''Atlantique.'
    WHEN 17 THEN 'Paul Edgecomb est le gardien-chef du couloir de la mort dans un pénitencier de Louisiane durant la Grande Dépression. Son quotidien bascule avec l''arrivée de John Coffey, un colosse noir accusé du meurtre de deux fillettes, qui semble posséder une âme d''enfant. Paul découvre rapidement que John détient un don surnaturel de guérison, remettant en question ses certitudes sur la culpabilité, la justice et la nature du mal.'
    WHEN 18 THEN 'Forrest Gump est un homme simple dont le destin va croiser les plus grands événements de l''histoire américaine des années 50 aux années 80. Malgré son faible quotient intellectuel, sa bonté d''âme et son optimisme inébranlable le mènent du terrain de football de l''Alabama aux rizières du Vietnam. Tout au long de son incroyable voyage, il ne garde qu''un seul but : retrouver Jenny, son amour de jeunesse.'
    WHEN 19 THEN 'Oskar Schindler est un industriel allemand membre du parti nazi qui cherche avant tout à faire fortune grâce à la guerre. En ouvrant une usine de vaisselle émaillée, il emploie des travailleurs juifs pour leur faible coût, mais la cruauté des camps de concentration change radicalement sa vision. Il décide alors de dépenser toute sa fortune pour racheter ses ouvriers et les sauver d''une mort certaine dans les chambres à gaz.'
    WHEN 20 THEN 'Salvatore, devenu un cinéaste célèbre à Rome, reçoit un appel lui annonçant la mort de son ami Alfredo. Il retourne alors dans son village natal en Sicile, où il se remémore son enfance passée au Cinema Paradiso auprès du vieux projectionniste qui lui a transmis l''amour du septième art. Ce voyage nostalgique est une déclaration d''amour au cinéma et aux souvenirs d''une époque révolue qui a forgé sa vie.'

    -- COMÉDIE (21-30)
    WHEN 21 THEN 'Inspiré d''une histoire vraie, le film suit l''ascension fulgurante de Jordan Belfort, un courtier en bourse ambitieux qui fonde sa propre firme à Wall Street. Grâce à des méthodes de vente agressives et frauduleuses, il accumule une fortune colossale en un temps record. Sa vie devient une succession de fêtes débauchées, de drogues et d''excès en tout genre, jusqu''à ce que le FBI commence à s''intéresser de très près à son empire.'
    WHEN 22 THEN 'À Barbieland, tout est rose, parfait et répétitif, jusqu''au jour où Barbie commence à avoir des pensées sur la mort. Accompagnée d''un Ken en quête de reconnaissance, elle décide de partir pour le monde réel afin de découvrir l''origine de son dysfonctionnement. Ce voyage va la confronter aux réalités du patriarcat, de l''imperfection humaine et de la découverte de soi, changeant sa vision de son propre monde pour toujours.'
    WHEN 23 THEN 'Pour célébrer l''enterrement de vie de garçon de leur ami Doug, trois amis se rendent à Las Vegas pour une nuit qu''ils n''oublieront jamais. Le problème, c''est qu''au réveil, ils ne se souviennent de rien, Doug a disparu, et leur suite est dévastée avec un tigre dans la salle de bain. Ils vont devoir remonter le fil de leur nuit de folie pour retrouver le marié avant que la cérémonie ne commence à Los Angeles.'
    WHEN 24 THEN 'Truman Burbank mène une vie tout à fait ordinaire dans une ville côtière parfaite où tout le monde est amical. Ce qu''il ignore, c''est qu''il est la star d''une émission de téléréalité diffusée 24h/24 dans le monde entier depuis sa naissance. Son entourage est composé d''acteurs et son monde est un immense studio de cinéma. Sa quête de vérité va le pousser à braver ses peurs pour s''échapper de cette prison dorée.'
    WHEN 25 THEN 'Wade Wilson est un ancien des forces spéciales devenu mercenaire dont la vie bascule lorsqu''il découvre qu''il est atteint d''un cancer incurable. Il accepte de subir une expérience secrète qui lui confère un pouvoir de guérison accélérée mais le laisse défiguré. Sous le masque de Deadpool, il utilise ses nouvelles capacités et son humour noir pour traquer l''homme qui a détruit son apparence et retrouver la femme qu''il aime.'
    WHEN 26 THEN 'Evan et Seth sont deux lycéens marginaux et meilleurs amis qui s''apprêtent à quitter le lycée pour des universités différentes. Pour marquer le coup et enfin séduire les filles de leurs rêves, ils se portent volontaires pour fournir l''alcool d''une grande fête. Accompagnés de leur ami Fogell et de sa fausse carte d''identité au nom de "McLovin", ils s''embarquent dans une nuit de chaos total impliquant des policiers déjantés et des imprévus hilarants.'
    WHEN 27 THEN 'Marty McFly, un adolescent des années 80, est accidentellement envoyé en 1955 à bord d''une DeLorean modifiée en machine à voyager dans le temps par son ami le Doc Brown. Pour pouvoir revenir dans le futur, il doit impérativement faire en sorte que ses parents, alors lycéens, tombent amoureux, sans quoi il cessera d''exister. C''est une course contre la montre pleine d''humour et d''aventure pour réparer le cours de l''histoire.'
    WHEN 28 THEN 'La famille McCallister part précipitamment en vacances à Paris pour Noël, mais dans la précipitation, ils oublient le jeune Kevin, 8 ans, seul à la maison. D''abord ravi de sa liberté retrouvée, Kevin doit rapidement faire preuve d''ingéniosité pour défendre sa demeure contre deux cambrioleurs maladroits qui ont jeté leur dévolu sur son quartier. Il transforme alors sa maison en un véritable champ de mines rempli de pièges créatifs.'
    WHEN 29 THEN 'Au cœur du monde criminel londonien, un diamant volé de 86 carats déclenche une série d''événements chaotiques impliquant des promoteurs de boxe, des parieurs russes et des gitans imprévisibles. Turkish et son partenaire se retrouvent mêlés à des matchs de boxe truqués organisés par le redoutable "Tête de Brique". Les destins de personnages hauts en couleur s''entrecroisent dans une comédie noire rythmée par des dialogues percutants et des situations absurdes.'
    WHEN 30 THEN 'Rémy est un jeune rat qui possède un odorat et un goût exceptionnels, rêvant de devenir un grand chef cuisinier à Paris. Malgré les dangers, il s''installe dans les cuisines du restaurant de son idole, Auguste Gusteau, et s''allie secrètement avec Linguini, un jeune commis maladroit. En manipulant les mouvements de Linguini sous sa toque, Rémy va prouver au monde entier que, comme le disait Gusteau, "tout le monde peut cuisiner", même un rat.'
END 
WHERE id BETWEEN 1 AND 30;


USE lolodb;

-- 1. ADIM: YENİ FİLMLER (MOVIES) - 31'DEN 90'A KADAR (60 ADET)
INSERT INTO movies (id, title, img, description, price, date_sortie) VALUES
-- --- ACTION (31-50) ---
(31, 'Spider-Man: Across the Spider-Verse', 'https://m.media-amazon.com/images/M/MV5BMzI0NmVkMjEtYmY4MS00ZDMxLTlkZmEtMzU4MDQxYTMzMjU2XkEyXkFqcGdeQXVyMzQ0MzA0NTM@._V1_.jpg', 'Miles Morales est propulsé à travers le Multivers, où il rencontre une équipe de Spider-Héros chargés de protéger son existence même.', 14.50, '2023-06-02'),
(32, 'Heat', 'https://m.media-amazon.com/images/M/MV5BYjZjNTFlMTctOWNiOC00MjZmLTliMDctYmI3ZDUxNGRjMDQ2XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg', 'Un détective de la police de Los Angeles traque un voleur professionnel et sa bande à travers la ville après un braquage sanglant.', 8.99, '1995-12-15'),
(33, 'Dune: Part Two', 'https://m.media-amazon.com/images/M/MV5BN2QyZGU4ZDctOWMzMy00NTc5LThlOGQtODhmNDI1NmY5YzAwXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_.jpg', 'Paul Atreides s''unit à Chani et aux Fremen pour se venger des conspirateurs qui ont détruit sa famille.', 15.99, '2024-03-01'),
(34, 'Logan', 'https://m.media-amazon.com/images/M/MV5BYzc5MTU4N2EtYTkyMi00NjdhLTg3Nzc0MmI3OTI0MTFlMWZmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg', 'Dans un futur proche, un Logan fatigué s''occupe d''un Professeur X souffrant, caché à la frontière mexicaine.', 10.99, '2017-03-03'),
(35, 'The Northman', 'https://m.media-amazon.com/images/M/MV5BMzVjMmY2NTctZGYyZS00Y2ZkLTk3MTUtOTVlMDhlZjg0ZGE3XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg', 'Un jeune prince viking part en quête de vengeance pour sauver sa mère et tuer l''oncle qui a assassiné son père.', 11.50, '2022-04-22'),
(36, 'Vikram Vedha', 'https://m.media-amazon.com/images/M/MV5BYmJhZmJlYTItZmZlNy00MGY0LWEzOTItOWI2YWJlNDFjZDI2XkEyXkFqcGdeQXVyMTEzNzg0Mjkx._V1_.jpg', 'Un policier intègre traque un criminel endurci qui lui raconte des histoires changeant sa vision du bien et du mal.', 9.00, '2017-07-21'),
(37, 'Extraction', 'https://m.media-amazon.com/images/M/MV5BMDJiNzUwYzEtNmQ2Yy00N2FmLTg3ZGEtNTM5ZmU2NzVjZTMwXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg', 'Un mercenaire intrépide est envoyé au Bangladesh pour sauver le fils enlevé d''un baron de la drogue indien.', 10.00, '2020-04-24'),
(38, 'The Batman', 'https://m.media-amazon.com/images/M/MV5BM2MyNTAwZGMtNTAxMS00NjgzLWEzYzgtMzVmZDRhYmQzZWMwXkEyXkFqcGdeQXVyNDc2NzU1MTA@._V1_.jpg', 'Lors de sa deuxième année de lutte contre le crime, Batman enquête sur la corruption qui ronge Gotham City.', 13.99, '2022-03-04'),
(39, 'Ip Man', 'https://m.media-amazon.com/images/M/MV5BNDM1YTM4Y2EtMTI1YS00YWI3LWI3ZDYtOWY0YjQyZGEwYjA1XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_.jpg', 'Pendant l''invasion japonaise de la Chine, un maître de Wing Chun est forcé de se battre pour l''honneur de son peuple.', 8.50, '2008-12-12'),
(40, 'Skyfall', 'https://m.media-amazon.com/images/M/MV5BMWZiNjE2OWItMTkwNy00ZWQzLWI0NTgtMWE0NjE2YTA2N2E0XkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg', 'La loyauté de Bond envers M est testée alors que son passé revient la hanter et menace le MI6.', 11.00, '2012-10-26'),
(41, 'Oldboy', 'https://m.media-amazon.com/images/M/MV5BMTI3NTQyMzU5M15BMl5BanBnXkFtZTcwMTM2MjgyMQ@@._V1_.jpg', 'Après avoir été séquestré pendant 15 ans sans raison, un homme est soudainement libéré et cherche vengeance.', 9.50, '2003-11-21'),
(42, 'Predator', 'https://m.media-amazon.com/images/M/MV5BY2QwYmFmZTEtNzY2Mi00ZWMyLWE4NzctYjM1ODRjZTk2MWQ1XkEyXkFqcGdeQXVyNzQzNzQxNzI@._V1_.jpg', 'Une équipe de forces spéciales dans la jungle est traquée par une créature extraterrestre invisible et mortelle.', 7.99, '1987-06-12'),
(43, 'The Raid', 'https://m.media-amazon.com/images/M/MV5BMjA3NjU5MjY4NF5BMl5BanBnXkFtZTcwOTcxMDY3Ng@@._V1_.jpg', 'Une équipe d''élite de la police se retrouve piégée dans un immeuble contrôlé par un baron de la drogue impitoyable.', 9.00, '2011-09-08'),
(44, 'Casino Royale', 'https://m.media-amazon.com/images/M/MV5BMDI5ZWJhOWItYTlhOC00YWNhLWI4YzItNWVlOGU2Mw@@._V1_.jpg', 'James Bond doit vaincre un banquier du terrorisme dans une partie de poker à haut risque au Casino Royale.', 10.50, '2006-11-17'),
(45, 'Bourne Identity', 'https://m.media-amazon.com/images/M/MV5BM2JmYjcxNjctYmU2OS00ZWEzLWEzNWYtZGY2Njc2MjAyNTA4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg', 'Un homme amnésique repêché en mer tente de découvrir son identité tout en étant poursuivi par des tueurs.', 8.99, '2002-06-14'),
(46, '300', 'https://m.media-amazon.com/images/M/MV5BMTcwNTY5MzY3Nl5BMl5BanBnXkFtZTcwMDU2MzA1MQ@@._V1_.jpg', 'Le roi Léonidas mène 300 Spartiates dans une bataille désespérée contre l''immense armée perse de Xerxès.', 9.99, '2006-12-09'),
(47, 'Everything Everywhere All at Once', 'https://m.media-amazon.com/images/M/MV5BYTdiOTIyZTctOTNmMD00YWU2LWI2NjEtNWY5N2U3Y2RhNjVmXkEyXkFqcGdeQXVyNzkzNTYxMzg@._V1_.jpg', 'Une immigrée chinoise épuisée est entraînée dans une aventure folle où elle seule peut sauver le monde.', 13.50, '2022-03-25'),
(48, 'Bullet Train', 'https://m.media-amazon.com/images/M/MV5BMDU2ZDVhNjc0NjAxMS00NzMyLWEyY2UtNjlkY2ZlY2UwMWU1XkEyXkFqcGdeQXVyNDIyNjA2MTk@._V1_.jpg', 'Cinq tueurs à gages se retrouvent dans un train à grande vitesse et découvrent que leurs missions sont liées.', 12.00, '2022-08-05'),
(49, 'Nobody', 'https://m.media-amazon.com/images/M/MV5BMjM5YTRlZmUtZGVmYi00ZjE2LWIyNzctNWExMDllYjU1ZDUxXkEyXkFqcGdeQXVyODIyOTEyMzY@._V1_.jpg', 'Un père de famille effacé révèle son passé violent après que sa maison a été cambriolée.', 10.99, '2021-03-26'),
(50, 'Tenet', 'https://m.media-amazon.com/images/M/MV5BYjg0ZTM0ZWQtZDAzMy00ZTMyLWEzZTYtMTQzYjVkYmFjZGU2XkEyXkFqcGdeQXVyMTA3MDkzNDU@._V1_.jpg', 'Un agent secret doit manipuler le flux du temps pour empêcher une troisième guerre mondiale imminente.', 14.00, '2020-08-26'),

-- --- DRAME (51-70) ---
(51, 'Interstellar', 'https://m.media-amazon.com/images/M/MV5BZjdkOTU3MDktN2IxOS00OGEyLWFmMjktY2FiMmZkNWIyODZiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg', 'Une équipe d''astronautes voyage à travers un trou de ver pour assurer la survie de l''humanité.', 12.99, '2014-11-07'),
(52, 'Fight Club', 'https://m.media-amazon.com/images/M/MV5BNDIzNDU0YzEtYzE5Ni00ZjlkLTk5ZjgtNjM3NWE4YzA3Nzk3XkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_.jpg', 'Un employé de bureau insomniaque et un fabriquant de savon charismatique créent un club de combat souterrain.', 9.50, '1999-10-15'),
(53, 'Pulp Fiction', 'https://m.media-amazon.com/images/M/MV5BNGNhMDIzZTUtNTBlZi00MTRlLWFjM2ItYzViMjE3YzI5MjA4XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg', 'Les vies de deux tueurs à gages, d''un boxeur et d''un couple de braqueurs s''entremêlent dans un Los Angeles violent.', 10.99, '1994-10-14'),
(54, 'The Prestige', 'https://m.media-amazon.com/images/M/MV5BMjA4NDI0MTIxNF5BMl5BanBnXkFtZTYwNTM5NjI5._V1_.jpg', 'Deux illusionnistes rivaux dans le Londres du XIXe siècle se livrent une guerre acharnée pour créer le tour ultime.', 11.00, '2006-10-20'),
(55, 'Goodfellas', 'https://m.media-amazon.com/images/M/MV5BY2NkZjEzMDgtN2RjYy00YzM1LWFmZmItODUzZGFiNWIwNGU1XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg', 'L''histoire d''Henry Hill et sa vie au sein de la mafia, de son ascension à sa chute finale.', 10.00, '1990-09-19'),
(56, 'Se7en', 'https://m.media-amazon.com/images/M/MV5BOTUwODM5MTctZGMyNy00OTUzLWEzOTItYTIyZDhlOTQ5OTgyXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg', 'Deux inspecteurs traquent un tueur en série qui utilise les sept péchés capitaux comme mode opératoire.', 9.99, '1995-09-22'),
(57, 'Whiplash', 'https://m.media-amazon.com/images/M/MV5BOTA5NDZlZGUtMjAxOS00YzA4LTkwYTMtNjU5YmU1NzNjYzAxXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg', 'Un jeune batteur de jazz prometteur est poussé à ses limites par un instructeur impitoyable et exigeant.', 11.50, '2014-10-10'),
(58, 'Green Book', 'https://m.media-amazon.com/images/M/MV5BMjA1MDQ0Njc2N15BMl5BanBnXkFtZTgwOTE3OTYzNzM@._V1_.jpg', 'Un videur italo-américain devient le chauffeur d''un pianiste noir classique lors d''une tournée dans le Sud des USA.', 10.50, '2018-11-16'),
(59, 'The Departed', 'https://m.media-amazon.com/images/M/MV5BMTI1MTY2OTIxNV5BMl5BanBnXkFtZTYwNjQ4NjY3._V1_.jpg', 'Un flic infiltré dans la mafia et une taupe de la mafia infiltrée chez les flics tentent de se démasquer mutuellement.', 11.99, '2006-10-06'),
(60, '12 Years a Slave', 'https://m.media-amazon.com/images/M/MV5BMjExMTEzODkyN15BMl5BanBnXkFtZTcwNTU4NTc4OQ@@._V1_.jpg', 'L''histoire vraie de Solomon Northup, un homme noir libre enlevé et vendu comme esclave en Louisiane.', 9.00, '2013-11-08'),
(61, 'The Revenant', 'https://m.media-amazon.com/images/M/MV5BMDE5OWU5ZDItNWVjZi00YmNmLTliN2ItYjRjNjJiODEyMTM1XkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_.jpg', 'Un trappeur laissé pour mort après une attaque de grizzly lutte pour survivre et se venger de ceux qui l''ont trahi.', 12.50, '2015-12-25'),
(62, 'Marriage Story', 'https://m.media-amazon.com/images/M/MV5BZGVmY2FhNDctY2I4MS00NzhhLTkmMTEtZmE3YjgzMWYwN2JlXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg', 'Un portrait poignant du divorce d''un metteur en scène et d''une actrice entre New York et Los Angeles.', 9.50, '2019-11-06'),
(63, 'American History X', 'https://m.media-amazon.com/images/M/MV5BZTJhN2QwYmUtOWM5MS00ZDRiLWFhNjktN2E1N2ZkNTgzNTU1XkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_.jpg', 'Un ancien néo-nazi tente d''empêcher son jeune frère de suivre le même chemin de haine après sa sortie de prison.', 10.00, '1998-10-30'),
(64, 'La La Land', 'https://m.media-amazon.com/images/M/MV5BMzUzNDM2NzM2MV5BMl5BanBnXkFtZTgwNTM3NTg4OTE@._V1_.jpg', 'À Los Angeles, une actrice débutante et un pianiste de jazz passionné tombent amoureux tout en poursuivant leurs rêves.', 11.00, '2016-12-09'),
(65, 'The Social Network', 'https://m.media-amazon.com/images/M/MV5BOGUyZDUxZjEtMmIzMC00MTE1LWFjOTEtMjA2NjgxMGYwNTVkXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg', 'La création controversée de Facebook par Mark Zuckerberg et les batailles juridiques qui ont suivi.', 10.50, '2010-10-01'),
(66, 'A Star is Born', 'https://m.media-amazon.com/images/M/MV5BNmE5ZmE3OGItNTdlNC00YmMxLWEzNjctYzAwOGQ5ODg0OTI5XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg', 'Un musicien chevronné aide une jeune chanteuse à trouver la gloire alors que sa propre carrière décline.', 11.50, '2018-10-05'),
(67, 'Room', 'https://m.media-amazon.com/images/M/MV5BMjE4NzgzNzEwMl5BMl5BanBnXkFtZTgwMTMzMDE0NjE@._V1_.jpg', 'Une mère et son fils retenus prisonniers dans une petite chambre parviennent enfin à s''échapper et découvrir le monde.', 9.00, '2015-10-16'),
(68, 'The Whale', 'https://m.media-amazon.com/images/M/MV5BZDQ4Njg4YTItZDA2ZC00OTAyLWI0N2EtYjYxNmVlYTMyYWQ5XkEyXkFqcGdeQXVyMTUzMTg2ODkz._V1_.jpg', 'Un professeur d''anglais reclus souffrant d''obésité morbide tente de renouer avec sa fille adolescente.', 12.00, '2022-12-09'),
(69, 'Aftersun', 'https://m.media-amazon.com/images/M/MV5BNGJlODkzYzItMmQ3Yy00YjYwLTlmYmQtYTE3OTFjYzc1MWRjXkEyXkFqcGdeQXVyMTAyMjQ3NzQ1._V1_.jpg', 'Sophie se remémore les vacances d''été partagées avec son père vingt ans plus tôt, cherchant à comprendre l''homme qu''il était.', 13.00, '2022-10-21'),
(70, 'Braveheart', 'https://m.media-amazon.com/images/M/MV5BMzkzMmU0YTYtOWM3My00Y2I5LWIwNzYtYDYzMDgzNWJlZDA1XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg', 'William Wallace mène les Écossais dans une rébellion contre la tyrannie du roi Édouard Ier d''Angleterre.', 10.00, '1995-05-24'),

-- --- COMÉDIE (71-90) ---
(71, 'The Nice Guys', 'https://m.media-amazon.com/images/M/MV5BMjA5NTEwMjk0NV5BMl5BanBnXkFtZTgwOTY2NjA1ODE@._V1_.jpg', 'Dans les années 70 à Los Angeles, un détective privé et un homme de main enquêtent sur la disparition d''une jeune fille.', 10.50, '2016-05-20'),
(72, 'Knives Out', 'https://m.media-amazon.com/images/M/MV5BMGUwZjliMTAtNzAxZi00MWNiLWE2NzgtZGUxMGQxZjhhNDRiXkEyXkFqcGdeQXVyNjU1NzU3MzE@._V1_.jpg', 'Un détective enquête sur la mort mystérieuse du patriarche d''une famille excentrique et combative.', 12.00, '2019-11-27'),
(73, 'Game Night', 'https://m.media-amazon.com/images/M/MV5BMjI3ODkzNDk5MF5BMl5BanBnXkFtZTgwNTEyNjY2NDM@._V1_.jpg', 'Une soirée jeux entre amis tourne mal quand l''un d''eux est enlevé pour de vrai dans le cadre d''un mystère.', 9.00, '2018-02-23'),
(74, 'Mean Girls', 'https://m.media-amazon.com/images/M/MV5BMjE1MDNlMDEtZDM5MS00OTNhLThjNjEtNTI0NjA2NDkxZGIzXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg', 'Cady, une adolescente ayant grandi en Afrique, découvre la hiérarchie sociale impitoyable d''un lycée américain.', 8.50, '2004-04-30'),
(75, 'Zombieland', 'https://m.media-amazon.com/images/M/MV5BMTU5MDg0NTQ1N15BMl5BanBnXkFtZTcwMjA4Mjg3Mg@@._V1_.jpg', 'Un étudiant timide tente de rejoindre sa famille pendant une apocalypse zombie, rejoint par trois étrangers.', 9.99, '2009-10-02'),
(76, 'Hot Fuzz', 'https://m.media-amazon.com/images/M/MV5BMzg4MDk1NzExN15BMl5BanBnXkFtZTgwNzIyNjg3MDE@._V1_.jpg', 'Un policier londonien trop performant est muté dans un village tranquille qui cache de sombres secrets.', 10.00, '2007-02-14'),
(77, 'Shaun of the Dead', 'https://m.media-amazon.com/images/M/MV5BMTg5Mzg2OTgwN15BMl5BanBnXkFtZTcwMzg3ODE2OQ@@._V1_.jpg', 'Un homme sans ambition décide de reprendre sa vie en main en plein milieu d''une invasion de zombies à Londres.', 9.00, '2004-04-09'),
(78, 'Ted', 'https://m.media-amazon.com/images/M/MV5BMTQ1OTU0NjEwM15BMl5BanBnXkFtZTcwOTkzMjk3Nw@@._V1_.jpg', 'Le vœu d''un enfant donne vie à son ours en peluche, qui reste son compagnon grincheux à l''âge adulte.', 10.50, '2012-06-29'),
(79, 'The Grand Budapest Hotel', 'https://m.media-amazon.com/images/M/MV5BMzM5NjUxOTEyMl5BMl5BanBnXkFtZTgwNjYzMzU3MDI@._V1_.jpg', 'Les aventures d''un concierge légendaire et de son jeune protégé dans un célèbre hôtel européen entre les guerres.', 11.99, '2014-03-28'),
(80, 'Palm Springs', 'https://m.media-amazon.com/images/M/MV5BY2Q3ZjYyN2ItOTU1MS00YjhiLThkMGItY2U4YTRmMGY4Y2E3XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg', 'Deux invités à un mariage se retrouvent coincés dans une boucle temporelle infinie lors d''une fête à Palm Springs.', 11.00, '2020-07-10'),
(81, 'The Big Lebowski', 'https://m.media-amazon.com/images/M/MV5BMTQ0NjUzMDMyOF5BMl5BanBnXkFtZTgwMzcxNjA2MTE@._V1_.jpg', 'Un chômeur amateur de bowling est pris pour un millionnaire portant le même nom et se retrouve mêlé à un kidnapping.', 10.00, '1998-03-06'),
(82, 'Ferris Bueller''s Day Off', 'https://m.media-amazon.com/images/M/MV5BMWRmMTI3MTEtYTUyMi00MGMzLTljZDEtYTZhNDQwOTY0NmU5XkEyXkFqcGdeQXVyNDk3NzU2MTQ@._V1_.jpg', 'Un lycéen astucieux décide de sécher les cours pour passer une journée inoubliable dans les rues de Chicago.', 8.99, '1986-06-11'),
(83, 'Booksmart', 'https://m.media-amazon.com/images/M/MV5BMjEzMjM3MzEzMV5BMl5BanBnXkFtZTgwOTQ5ODMzNzM@._V1_.jpg', 'Deux lycéennes modèles réalisent qu''elles auraient dû s''amuser davantage et tentent de se rattraper en une nuit.', 11.00, '2019-05-24'),
(84, 'Pineapple Express', 'https://m.media-amazon.com/images/M/MV5BMTY1MTA4OTI2NF5BMl5BanBnXkFtZTcwNzg4MDE2MQ@@._V1_.jpg', 'Un huissier et son dealer de drogue fuient des tueurs à gages après avoir été témoins d''un meurtre.', 9.50, '2008-08-06'),
(85, 'Dumb and Dumber', 'https://m.media-amazon.com/images/M/MV5BZDQwMjNiMTQtY2UwYy00NjhiLTk0ZDMtZGJlZWM1M2FlNzExXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg', 'Deux amis bien intentionnés mais incroyablement stupides traversent le pays pour rendre une mallette perdue.', 7.99, '1994-12-16'),
(86, '21 Jump Street', 'https://m.media-amazon.com/images/M/MV5BMTc3NzQ3OTIzNV5BMl5BanBnXkFtZTcwMDI5NTQyNw@@._V1_.jpg', 'Deux policiers incompétents infiltrent un lycée sous couverture pour démanteler un réseau de drogue.', 10.50, '2012-03-16'),
(87, 'Eurotrip', 'https://m.media-amazon.com/images/M/MV5BMTMxMDY0Nzc4N15BMl5BanBnXkFtZTcwMjA1MjcyMQ@@._V1_.jpg', 'Un lycéen américain traverse l''Europe avec ses amis pour rencontrer une correspondante allemande.', 8.50, '2004-02-20'),
(88, 'American Pie', 'https://m.media-amazon.com/images/M/MV5BMTU0NjA4MDM5N15BMl5BanBnXkFtZTcwMTQ2Mzg2MQ@@._V1_.jpg', 'Quatre amis font le pacte de perdre leur virginité avant le bal de fin d''année du lycée.', 9.00, '1999-07-09'),
(89, 'The Dictator', 'https://m.media-amazon.com/images/M/MV5BNmE2NWExM2UtYzU3MS00M2I0LWI0Y2QtYjcwY2VlYmI2M2FhXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg', 'L''histoire d''un dictateur qui risque sa vie pour s''assurer que la démocratie ne vienne jamais dans son pays.', 10.00, '2012-05-16'),
(90, 'Shrek', 'https://m.media-amazon.com/images/M/MV5BOGZhM2FhNTItODAzNi00YjA0LWEyN2UtNjJlYWQzYzU1MDg5L2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_.jpg', 'Un ogre solitaire voit sa tranquillité troublée par des créatures féeriques et part sauver une princesse.', 11.50, '2001-05-18');

-- 2. ADIM: KATEGORİ BAĞLANTILARI (MOVIE_GENRE)
-- Action (31-50)
INSERT INTO movie_genre (movie_id, genre_id)
SELECT id, 1 FROM movies WHERE id BETWEEN 31 AND 50;

-- Drame (51-70)
INSERT INTO movie_genre (movie_id, genre_id)
SELECT id, 2 FROM movies WHERE id BETWEEN 51 AND 70;

-- Comédie (71-90)
INSERT INTO movie_genre (movie_id, genre_id)
SELECT id, 3 FROM movies WHERE id BETWEEN 71 AND 90;

-- 3. ADIM: EKSİK YÖNETMENLERİ EKLE (EĞER YOKSALAR)
INSERT IGNORE INTO director (id, name) VALUES 
(13, 'Denis Villeneuve'), (14, 'Michael Mann'), (15, 'James Mangold'), 
(16, 'Robert Eggers'), (17, 'Matt Reeves'), (18, 'Sam Mendes'), 
(19, 'Park Chan-wook'), (20, 'Gareth Evans'), (21, 'The Daniels'), 
(22, 'David Fincher'), (23, 'Damien Chazelle'), (24, 'Steve McQueen'), 
(25, 'Alejandro G. Iñárritu'), (26, 'Noah Baumbach'), (27, 'Tony Kaye'), 
(28, 'David O. Russell'), (29, 'Edgar Wright'), (30, 'Wes Anderson'),
(31, 'Shane Black'), (32, 'Rian Johnson'), (33, 'Greta Gerwig');

-- 4. ADIM: YÖNETMEN BAĞLANTILARI (Örnek eşleştirmeler)
INSERT INTO movie_director (movie_id, director_id) VALUES 
(33, 13), (51, 1), (32, 14), (34, 15), (35, 16), (38, 17), (40, 18), 
(41, 19), (43, 20), (47, 21), (52, 22), (56, 22), (54, 1), (57, 23), 
(64, 23), (60, 24), (61, 25), (62, 26), (63, 27), (71, 31), (72, 32), 
(76, 29), (77, 29), (79, 30), (50, 1), (59, 5); -- The Departed -> Scorsese (ID: 5)