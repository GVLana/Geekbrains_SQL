/* Заполнение данными*/

USE kinopoisk;

INSERT INTO users (firstname, lastname, email, phone)
VALUES ('Anna', 'Pavlova', 'anna@gb.ru', '89112325648'),
		('Nikita', 'Drozdov', 'nikita@gb.ru', '89112625648'),
		('Dima', 'Gavrilov', 'dima@gb.ru', '89112725648'),
		('Alena', 'Ivanova', 'alena@gb.ru', '89112825648'),
		('Marina', 'Sidorova', 'marina@gb.ru', '89112925648'),
		('Pavel', 'Smirnov', 'pavel@gb.ru', '89112335648'),
		('Oleg', 'Tumanov', 'oleg@gb.ru', '89112345648'),
		('Ilya', 'Blokh', 'ilya@gb.ru', '89112355648'),
		('Anton', 'Pavlov', 'anton@gb.ru', '89112365648'),
		('Katya', 'Tutaeva', 'katya@gb.ru', '89112385648');
		

INSERT INTO types (name) 
VALUES ('movie'),
		('episods'),
		('show'),
		('mini series');
	
UPDATE types SET name = 'TV-show' WHERE type_id = 2;
UPDATE types SET name = 'podcast' WHERE type_id = 3;
	
INSERT INTO countries (name)
VALUES ('Italy'),
		('Argentina'),
		('Australia'),
		('Austria'),
		('Belgium'),
		('Botswana'),
		('Brazil'),
		('Canada'),
		('Chile'),
		('China'),
		('Colombia'),
		('Egypt'),
		('Finland'),
		('France'),
		('Germany'),
		('Israel'),
		('Japan'),
		('Mexico'),
		('Russia'),
		('Spain'),
		('Switzerland'),
		('United Kingdom'),
		('United States of America');
	
INSERT INTO actors (firstname, lastname, birthday, country_id)
VALUES ('Leonardo', 'DiCaprio', '1974-11-11', '23'), ('Jhony', 'Depp', '1963-06-09', '23'), ('Al', 'Pacino', '1940-04-25', '1'), ('Gerard', 'Depardieu', '1948-12-27', '14'), 
('Antonio', 'Banderas', '1960-08-10', '20'), ('Don', 'Cheadlr', '1964-11-29', '23'), ('Tom', 'Cruise', '1962-07-03', '23'), ('Dustin', 'Hoffman', '1937-08-08', '23'),
('Constantin', 'Khabenskii', '1972-01-11', '19'), ('Danila', 'Kozlovskii', '1985-05-03', '19');



INSERT INTO actresses (firstname, lastname, birthday, country_id)
VALUES ('Susan', 'Sarandon', '1946-10-04', '23'), ('Glenn', 'Close', '1947-03-19', '23'), ('Julie', 'Andrews', '1935-10-01', '22'), ('Helen', 'Mirren', '1945-07-26', '23'), 
('Viola', 'Davis', '1965-08-11', '23'), ('Cate', 'Blanchett', '1969-05-14', '3'), ('Meryl', 'Streep', '1949-06-22', '23'), ('Ingrid', 'Bergman', '1915-08-29', '23'),
('Svetlana', 'Khodchenkova', '1983-01-21', '19'), ('Marina', 'Aleksandrova', '1982-08-29', '19');


INSERT INTO awards (name) 
VALUES ('Oscar'), ('Ewwmy Awards'), ('Nika'),
		('Golden Globes'), ('MTV Movie Awards'),
		('BAFTA Awards'), ('Razzie Awards'),
		('Cesar');

INSERT INTO genres (name) 
VALUES ('Documentary'), ('Comedy'), ('Thriller'),
		('Action'), ('Drama'), ('Romance'),
		('Fantasy'), ('Historical'), ('Western'),
		('Horror'), ('Animation');

INSERT INTO profiles (user_id, gender, birthday, photo_id, country_id)
VALUES ('1', 'f', '1999-02-02', '1', '19'), ('2', 'm', '1989-02-12', '2', '19'), ('3', 'x', '1987-10-02', '3', '19'), ('4', 'f', '1989-03-14', '4', '19'), 
('5', 'f', '2000-12-02', '5', '19'), ('6', 'm', '1998-05-02', '6', '19'), ('7', 'm', '1997-11-02', '7', '19'), ('8', 'm', '1996-08-02', '8', '19'), 
('9', 'm', '1999-06-11', '9', '19'), ('10', 'f', '1999-01-01', '10', '19');


INSERT INTO languages (name)
VALUES ('russian'), ('english'), ('french'), ('spanish'), ('italian'), ('german');

DELETE FROM types WHERE type_id > 4;

INSERT INTO producers (firstname, lastname, birthday, country_id)
VALUES ('Brain', 'Grazer', '1951-07-12', '23'), ('Steven', 'Spielberg', '1946-12-18', '23'), ('Stanly', 'Kubrik', '1928-07-26', '23'),
('Scott', 'Rudin', '1958-07-14', '23'), ('Taylor', 'Hackford', '1944-12-31', '23'), ('Kathleen', 'Kennedy', '1953-06-05', '23'),
('Irwin', 'Winker', '1931-05-28', '23'), ('David', 'Fincher', '1962-08-28', '23'), ('Martin', 'Scorsese', '1942-11-17', '1'),
('Christopher', 'Nolan', '1970-07-30', '23');

INSERT INTO titles (name, language_id, country_id, description, release_year)
VALUES ('The Prestige', '2', '23', 'opposition of magicians-illusionists', '2006'),
		 ('Shutter Island', '2', '23', 'the bailiff becomes a hostage of the insane clinic', '2009'),
		 ('Fight Club', '2', '23', 'insurance worker changes his life', '1999'),
		 ('The Departed', '2', '23', 'two police academy graduates', '2006');


INSERT INTO trailers (name, owner_id, file_size)
VALUES ('prestige', '1', '256'), ('shutter_island', '2', '352'),('fight_club', '3', '256'),('departed', '4', '458');

INSERT INTO film_awards (award_id, title_id)
VALUES ('6', '1'), ('2', '2'), ('1', '3'), ('1', '4');

INSERT INTO film_genre (genre_id, title_id)
VALUES ('3', '1'), ('3', '2'), ('3', '3'), ('3', '4');


INSERT INTO film_producer(title_id, producer_id)
VALUES('1', '10'), ('2', '9'), ('3', '8'), ('4', '9');


INSERT INTO film_staff (title_id, actor_id, actress_id)
VALUES ('1', '21', '6'), ('2', '21', '6'), ('3', '23', '3'), ('4', '22', '6');


INSERT INTO payments (user_id, status)
VALUES ('1', '1'), ('2', '1'), ('3', '0'), ('4', '1'), ('5', '0'), ('6', '0'), ('7', '1'), ('8', '1'), ('9', '1'), ('10', '1');

INSERT INTO posters (name, owner_id, file_size)
VALUES ('prestige.png', '1', '100'), ('shutter_island.jpg', '2', '150'),('fight_club.jpg', '3', '150'),('departed.png', '4', '160');

DELETE FROM likes;

INSERT INTO likes (title_id, user_id, like_type)
VALUES ('1', '1', '0'), ('1', '3', '1'), ('1', '4', '1'), ('1', '6', '1'), ('2', '1', '0'), ('2', '8', '0'), ('2', '9', '1'), ('2', '10', '1'),
('3', '1', '1'), ('3', '2', '0'), ('3', '7', '0'), ('4', '1', '1'), ('4', '5', '0'), ('4', '2', '0'), ('4', '8', '0'), ('4', '6', '1');



INSERT INTO watched (title_id, user_id, watch_type)
VALUES ('1', '1', '1'), ('1', '3', '1'), ('1', '4', '1'), ('1', '6', '1'), ('2', '1', '1'), ('2', '8', '1'), ('2', '9', '1'), ('2', '10', '1'),
('3', '1', '1'), ('3', '2', '1'), ('3', '7', '1'), ('4', '1', '1'), ('4', '5', '1'), ('4', '2', '1'), ('4', '8', '1'), ('4', '6', '1'),
('1', '2', '0'), ('1', '5', '0'), ('1', '7', '0'), ('1', '8', '0'), ('1', '9', '0'), ('2', '2', '0'), ('2', '3', '0'), ('2', '4', '0'),
('2', '5', '0'), ('2', '6', '0'), ('2', '7', '0'), ('3', '3', '0'), ('3', '4', '0'), ('3', '5', '0'), ('3', '6', '0'), ('3', '8', '0'), ('3', '9', '0'), 
('3', '10', '0'), ('4', '3', '0'), ('4', '4', '0'), ('4', '7', '0'), ('4', '9', '0'), ('4', '10', '0');


INSERT INTO likes (title_id, user_id, like_type)
VALUES ('4', '7', '1');

UPDATE watched SET watch_type = 1 WHERE title_id = 4 AND user_id  = 7;

INSERT INTO likes (title_id, user_id, like_type)
VALUES ('4', '10', '1');


UPDATE watched SET watch_type = 1 WHERE title_id = 4 AND user_id  = 10;

 INSERT INTO raiting_range(name, r_range)
 VALUES ('хорошо', '80'), ('средне', '50'), ('плохо', '20');

DELETE FROM payments;

INSERT INTO payments(user_id, status)
VALUES ('1', '1');




ALTER TABLE payments ADD COLUMN created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;

INSERT INTO payments(user_id, status)
VALUES ('2', '1');

INSERT INTO payments(user_id, status)
VALUES ('4', '1');

INSERT INTO payments(user_id, status)
VALUES ('8', '1');


INSERT INTO photo (user_id, file_size)
VALUES ('1', '256'), ('3', '135'), ('4', '155');





















