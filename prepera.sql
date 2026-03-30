-- TÜRER, YÖNETMENLER VE OYUNCULAR (TÜM LİSTE)
INSERT IGNORE INTO genres (genre) VALUES ('Adventure'), ('Action'), ('Comedy');

INSERT IGNORE INTO director (id, name) VALUES 
(1, 'Christopher Nolan'), (2, 'James Gunn'), (3, 'Guy Ritchie'), (4, 'Taika Waititi'), (5, 'Greta Gerwig'), (6, 'Jon Watts'), (7, 'The Russo Brothers'), (8, 'George Miller'), (9, 'Chad Stahelski'), (10, 'Joseph Kosinski'), (11, 'Jake Kasdan'), (12, 'Phil Lord'), (13, 'Daniel Kwan'), (14, 'Denis Villeneuve'), (15, 'Steven Spielberg'), (16, 'Martin Scorsese'), (17, 'Ridley Scott');

INSERT IGNORE INTO actors (id, name) VALUES 
(1, 'Robert Downey Jr.'), (2, 'Ryan Reynolds'), (3, 'Margot Robbie'), (4, 'Tom Holland'), (5, 'Chris Hemsworth'), (6, 'Scarlett Johansson'), (7, 'Cillian Murphy'), (8, 'Brad Pitt'), (9, 'Keanu Reeves'), (10, 'Tom Cruise'), (11, 'Dwayne Johnson'), (12, 'Jonah Hill'), (13, 'Ryan Gosling'), (14, 'Zendaya'), (15, 'Harrison Ford'), (16, 'Leonardo DiCaprio'), (17, 'Russell Crowe'), (18, 'Zoe Saldana'), (19, 'Christian Bale'), (20, 'Heath Ledger'), (21, 'Emily Blunt'), (22, 'Florence Pugh'), (23, 'Austin Butler');

INSERT INTO movies (id, title, rating, img, description, price) VALUES
(1, 'Inception', 8.8, 'https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_SX300.jpg', 'A thief who steals corporate secrets through the use of dream-sharing technology.', 14.99),
(2, 'The Dark Knight', 9.0, 'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_SX300.jpg', 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham.', 12.99),
(3, 'Deadpool', 8.0, 'https://m.media-amazon.com/images/M/MV5BYzE5MjY1ZDgtMTkyNC00MTMyLThhMjAtOTM5OTUzN2U0Njk2XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg', 'A wisecracking mercenary gets experimented on and becomes immortal.', 9.99),
(4, 'Guardians of the Galaxy', 8.0, 'https://m.media-amazon.com/images/M/MV5BMTAwMjU5OTgxNjleQTJeQWpwZ15BbWU4MDUxNDYxODEx._V1_SX300.jpg', 'A group of intergalactic criminals must pull together to stop a fanatical warrior.', 11.50),
(5, 'The Avengers', 8.0, 'https://m.media-amazon.com/images/M/MV5BNDYxNjQyMjAtNTdiOS00NGYwLWFmNTAtNThmYjU5ZGI2YTI1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg', 'Earth\'s mightiest heroes must come together and learn to fight as a team.', 13.00),
(6, 'Mad Max: Fury Road', 8.1, 'https://m.media-amazon.com/images/M/MV5BN2EwM2I5OWMtMGNlNi00NWcmLWEwNzItZTMyMzEwMzEzNWU1XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg', 'In a post-apocalyptic wasteland, a woman rebels against a tyrannical ruler.', 10.99),
(7, 'Spider-Man: No Way Home', 8.2, 'https://m.media-amazon.com/images/M/MV5BZWMyYzFjYTYtNTRjYi00ZDU2LWEzNTYtZDRlMzQ0NzcyMTUzXkEyXkFqcGdeQXVyNjY1MTg4Mzc@._V1_SX300.jpg', 'Peter Parker seeks the help of Doctor Strange to forget his identity.', 15.50),
(8, 'Free Guy', 7.1, 'https://m.media-amazon.com/images/M/MV5BOTY2NzFjODctYzdlNi00ZDI4LWEwNjItZmE2ZWZlMGY2MGEwXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_SX300.jpg', 'A bank teller discovers that he is actually a background player in an open-world video game.', 8.99),
(9, 'Thor: Ragnarok', 7.9, 'https://m.media-amazon.com/images/M/MV5BMjMyNDkzMzI1OF5BMl5BanBnXkFtZTgwODcxODg5MjI@._V1_SX300.jpg', 'Imprisoned on the planet Sakaar, Thor must race against time to stop Hela.', 11.00),
(10, 'Barbie', 6.9, 'https://m.media-amazon.com/images/M/MV5BNjU3N2QxNzYtMjk1NC00MTc2LThmY2MtM2MwZTU2ZjdjOWJmXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_SX300.jpg', 'Barbie suffers a crisis that leads her to question her world and her existence.', 12.00),
(11, 'The Gentlemen', 7.8, 'https://m.media-amazon.com/images/M/MV5BMTlkM2I2NzItZTEyZi00YWVjLTg4OTYtYjBlMjVlOWZkZDA2XkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_SX300.jpg', 'A talented American graduate attempts to sell off his marijuana empire.', 9.50),
(12, 'Snatch', 8.2, 'https://m.media-amazon.com/images/M/MV5BMTA2NDYxOGYtYjU1Mi00Y2QzLTgxMTQtMWI1MGI0NjQxMWVmXkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_SX300.jpg', 'Unscrupulous boxing promoters, violent bookmakers and a Russian gangster.', 8.50),
(13, 'Bullet Train', 7.3, 'https://m.media-amazon.com/images/M/MV5BMDU2ZDEyOTItNTkxMy00NTdkLWEwZTMtZWU1YjQ3ZGVlZTA1XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SX300.jpg', 'Five assassins aboard a swiftly-moving bullet train find out their missions have something in common.', 10.00),
(14, 'Everything Everywhere All at Once', 7.8, 'https://m.media-amazon.com/images/M/MV5BYTdiOTIyZTQtNmQ1OS00NjZlLWIyMTMtY2UxY2U3NWU3M2UxXkEyXkFqcGdeQXVyMTAzNjk5MzU4._V1_SX300.jpg', 'A middle-aged Chinese immigrant is swept up in an insane adventure.', 13.50),
(15, 'John Wick', 7.4, 'https://m.media-amazon.com/images/M/MV5BMTU2NjA1ODgzMF5BMl5BanBnXkFtZTgwMTM2MTI4MjE@._V1_SX300.jpg', 'An ex-hit-man comes out of retirement to track down the gangsters.', 9.99),
(16, 'Top Gun: Maverick', 8.3, 'https://m.media-amazon.com/images/M/MV5BZWYzOGEwNTgtNWU3NS00ZTQ0LWJkODUtMmVhMjIwMjA1ZmQwXkEyXkFqcGdeQXVyMjkwOTAyMjc@._V1_SX300.jpg', 'After thirty years, Maverick is still pushing the envelope as a naval aviator.', 14.00),
(17, 'Jumanji: Welcome to the Jungle', 7.0, 'https://m.media-amazon.com/images/M/MV5BMTkyNDQ1MDc5OV5BMl5BanBnXkFtZTgwOTcyNzI2MzI@._V1_SX300.jpg', 'Four teenagers are sucked into a magical video game.', 7.99),
(18, '21 Jump Street', 7.2, 'https://m.media-amazon.com/images/M/MV5BMTc3NzQ3OTIzNF5BMl5BanBnXkFtZTcwMjk5OTcxNw@@._V1_SX300.jpg', 'A pair of underachieving cops are sent back to a local high school.', 6.50),
(19, 'The Nice Guys', 7.4, 'https://m.media-amazon.com/images/M/MV5BMTYwNjAyOTIyMF5BMl5BanBnXkFtZTgwMTMyMTgwMDI@._V1_SX300.jpg', 'A mismatched pair of private eyes investigate a missing girl.', 7.50),
(20, 'The Suicide Squad', 7.2, 'https://m.media-amazon.com/images/M/MV5BMjM1ZjgxYTctOGI3MS00Y2VlLWEyNWYtNzExYWJlZTMzMzYxXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SX300.jpg', 'Supervillains join the secretive Task Force X.', 10.50),
(21, 'Kingsman: The Secret Service', 7.7, 'https://m.media-amazon.com/images/M/MV5BYTM3ZTliNWYtOTU3Zi00N2I0LWEyZmItZTI5ZjY2ZDM0MDI0XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg', 'A promising street kid is recruited into a super-secret spy organization.', 9.00),
(22, 'Ant-Man', 7.3, 'https://m.media-amazon.com/images/M/MV5BMjM2NTQ5Mzc2M15BbWU4MDcxMDI4Njcx._V1_SX300.jpg', 'Armed with a super-suit with the ability to shrink in scale.', 10.00),
(23, 'Edge of Tomorrow', 7.9, 'https://m.media-amazon.com/images/M/MV5BMTc5OTk4MTM3M15BbWU4MDYzNjA1Nzkx._V1_SX300.jpg', 'A soldier fighting aliens gets relives the same day over and over.', 11.00),
(24, 'Dune', 8.0, 'https://m.media-amazon.com/images/M/MV5BN2FjNmExNGEtYjU3Ni00YWU5LWFhN2ItZTgzNWVlZTEzNzQ5XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SX300.jpg', 'A noble family becomes embroiled in a war for the galaxy\'s most valuable asset.', 16.00),
(25, 'Raiders of the Lost Ark', 8.4, 'https://m.media-amazon.com/images/M/MV5BMjA0ODEzMTc1Nl5BMl5BanBnXkFtZTcwODM2MjAxNA@@._V1_SX300.jpg', 'Archeologist Indiana Jones is hired by the U.S. government to find the Ark.', 8.00),
(26, 'The Wolf of Wall Street', 8.2, 'https://m.media-amazon.com/images/M/MV5BMjIxMjgxNTk0MF5BMl5BanBnXkFtZTgwNjIyOTg2MDE@._V1_SX300.jpg', 'Based on the true story of Jordan Belfort, from his rise to a wealthy stock-broker.', 12.50),
(27, 'Gladiator', 8.5, 'https://m.media-amazon.com/images/M/MV5BMDliMmNhNDEtODUyOS00MjNlLTgxODEtN2U3NzYxOGE1ZGMwXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg', 'A former Roman General sets out to exact vengeance against the corrupt emperor.', 9.00);

-- TÜR BAĞLANTILARI
INSERT INTO movie_genre (movie_id, genre_id) VALUES (1,1),(1,2),(2,2),(3,2),(3,3),(4,1),(4,2),(4,3),(5,2),(6,2),(7,1),(7,2),(8,3),(8,1),(9,2),(9,3),(10,3),(11,2),(11,3),(12,2),(12,3),(13,2),(13,3),(14,1),(14,3),(15,2),(16,2),(17,1),(17,3),(18,3),(19,3),(19,2),(20,2),(20,3),(21,2),(22,2),(22,3),(23,2),(23,1),(24,1),(25,1),(25,2),(26,3),(27,2);

-- YÖNETMEN BAĞLANTILARI
INSERT INTO movie_director (movie_id, director_id) VALUES (1,1),(2,1),(3,12),(4,2),(5,7),(6,8),(7,6),(8,11),(9,4),(10,5),(11,3),(12,3),(13,11),(14,13),(15,9),(16,10),(17,11),(18,12),(19,10),(20,2),(21,3),(22,2),(23,10),(24,14),(25,15),(26,16),(27,17);

-- OYUNCU BAĞLANTILARI (ANA VE EKSTRA)
INSERT INTO movie_actor (movie_id, actor_id) VALUES (1,7),(1,16),(2,7),(2,19),(2,20),(3,2),(4,5),(4,18),(5,1),(5,5),(5,6),(7,4),(7,14),(8,2),(9,5),(10,3),(10,13),(11,13),(12,8),(13,8),(15,9),(16,10),(16,23),(17,11),(18,12),(23,21),(24,14),(24,22),(25,15),(26,16),(27,17);