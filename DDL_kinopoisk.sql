/*Формирование структуры базы */

/*База данных кинопоиск позволяет хранить инофрмацию о фильмах, в том числе: актерский состав, страна производитель, язык, постер, трейлер, нагарды, продюсер.
 * Также база данных хранит информацию о пользователях. Пользователи просматривают фильмы, ставят лайки. На основе лайков составляется рейтинг фильмов.
 * В базе можно отдельно просматривать новые поступления (фильмы или сериалы, которые поступили в течении ближайших 30-ти дней).
 * Пользование услугами кинопоиска не бесплатно, поэтому в зависимости от статуса оплаты каждого пользователя ведется учет активности его учетной записи.
 * 
 * База состоит из 24 таблиц, а именно: 
 *    1. таблицы, описывающие фильм:  titles, film_awards, film_genre, film_producer, film_staff, film_types, countries, languages, posters, treilers;
 *    2. таблицы, описывающие пользователей: users, profiles, photo, membership;
 * 	  3. таблицы, описывающие активность полтзователей: likes, watched, payments;
 *    4. таблицы вспомогательные, хранящие данные: actors, actresses, producers, awards, genres, types, raiting_logs.
 * 
 * В базе есть 	4 представления:
 *    1. raiting - суммовой рейтинг по фильмам (количество лайков);
 *    2. grade - оценка фильма в зависимости от рейтинга;
 *    3. new_arrivals - новые поступления (менее 30-ти дней с текущей даты);
 *    4. membership_status - активность учетной записи в зависимости от статуса оплаты членского взноса.
 * 
 * Помимо этого база включает в себя процедуры, функции и триггеры:
 *    1. функция grade_of_title - рассчитывает в процентах рейтинг фильма и применяется для последующего представления grade;
 *    2. процедуры append_raiting_logs и sp_title_raiting в связке с триггером likes.append_raiting_logs_from_likes - позволяют пересчитывать рейтинг фильмов при каждом новом лайке;
 *    3. процедура append_membership вместе с триггером payments.append_membership_from_payments - позовляет при поступлении оплаты от пользователя за услуги сервиса обновлять таблицу членства.
*/

CREATE DATABASE kinopoisk;

USE  kinopoisk;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
		id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
		firstname VARCHAR(150) NOT NULL,
		lastname VARCHAR(150) NOT NULL,
		email VARCHAR(150) NOT NULL,
		phone VARCHAR(11) NOT NULL,
		password_hash CHAR(65) DEFAULT NULL,
		created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
		PRIMARY KEY (id),
		UNIQUE KEY email (email),
		CONSTRAINT check_phone CHECK (regexp_like(phone,_utf8mb4'^[0-9]{11}$'))
		) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
	
DROP TABLE IF EXISTS photo;

CREATE TABLE photo(
		photo_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  		user_id BIGINT UNSIGNED NOT NULL,
  		file_size BIGINT DEFAULT NULL,
  		created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  		PRIMARY KEY (photo_id),
  		CONSTRAINT fk_photo_users FOREIGN KEY (user_id) REFERENCES users (id)
  		) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
  	
DROP TABLE IF EXISTS profiles;

CREATE TABLE profiles(
		user_id BIGINT UNSIGNED NOT NULL,
		gender ENUM('f', 'm', 'x') NOT NULL,
		birthday DATE NOT NULL,
		photo_id BIGINT UNSIGNED NOT NULL,
		country_id INT UNSIGNED NOT NULL,
		UNIQUE KEY photo_id (photo_id),
		CONSTRAINT fk_profiles_countries FOREIGN KEY (country_id) REFERENCES countries (country_id),
		CONSTRAINT fk_profiles_users FOREIGN KEY (user_id) REFERENCES users (id)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
		
 
 DROP TABLE IF EXISTS countries;
 
 CREATE TABLE countries(
		country_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
		name VARCHAR(130) NOT NULL,
		PRIMARY KEY (country_id),
		UNIQUE KEY name (name)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
	
DROP TABLE IF EXISTS types;

CREATE TABLE types(
		type_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
		name VARCHAR (130) NOT NULL,	
		PRIMARY KEY (type_id),
		UNIQUE KEY name (name)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
	
DROP TABLE IF EXISTS producers;

CREATE TABLE producers(
		producer_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
		firstname VARCHAR(150) NOT NULL,
		lastname VARCHAR(150) NOT NULL,
		birthday DATE NOT NULL,
		country_id INT UNSIGNED NOT NULL,
		PRIMARY KEY (producer_id),
		CONSTRAINT fk_producers_countries FOREIGN KEY (country_id) REFERENCES countries (country_id)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
	
	
DROP TABLE IF EXISTS actors;

CREATE TABLE actors(
		actor_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
		firstname VARCHAR(150) NOT NULL,
		lastname VARCHAR(150) NOT NULL,
		birthday DATE NOT NULL,
		country_id INT UNSIGNED NOT NULL,
		PRIMARY KEY (actor_id),
		CONSTRAINT fk_actors_countries FOREIGN KEY (country_id) REFERENCES countries (country_id)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
	
	
DROP TABLE IF EXISTS actresses;

CREATE TABLE actresses(
		actress_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
		firstname VARCHAR(150) NOT NULL,
		lastname VARCHAR(150) NOT NULL,
		birthday DATE NOT NULL,
		country_id INT UNSIGNED NOT NULL,
		PRIMARY KEY (actress_id),
		CONSTRAINT fk_actresses_countries FOREIGN KEY (country_id) REFERENCES countries (country_id)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;	
	
  	
DROP TABLE IF EXISTS genres;

CREATE TABLE genres(
		genre_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
		name VARCHAR(150) NOT NULL,
		PRIMARY KEY (genre_id),
		UNIQUE KEY (name)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS awards;

CREATE TABLE awards(
		award_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
		name VARCHAR(150) NOT NULL,
		PRIMARY KEY (award_id),
		UNIQUE KEY (name)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;	

	
DROP TABLE IF EXISTS languages;

CREATE TABLE languages(
		language_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
		name VARCHAR(150) NOT NULL,
		PRIMARY KEY (language_id)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
	
DROP TABLE IF EXISTS titles;

CREATE TABLE titles(
		title_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  		name VARCHAR(150) NOT NULL,
		language_id INT UNSIGNED NOT NULL,
		country_id INT UNSIGNED NOT NULL,
  		raiting INT DEFAULT NULL,
  		description TEXT NOT NULL,
  		release_year DATE NOT NULL,
  		created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  		PRIMARY KEY (title_id),
  		UNIQUE KEY name (name),
  		CONSTRAINT fk_titles_languages FOREIGN KEY (language_id) REFERENCES languages (language_id),
  		CONSTRAINT fk_titles_countries FOREIGN KEY (country_id) REFERENCES countries (country_id)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
  	
DROP TABLE IF EXISTS film_staff;

CREATE TABLE film_staff(
		title_id BIGINT UNSIGNED NOT NULL,
		actor_id BIGINT UNSIGNED NOT NULL,
		actress_id BIGINT UNSIGNED NOT NULL,
		PRIMARY KEY (title_id),
		KEY film_staff_titles_idx (title_id),
  		KEY film_staff_actors_idx (actor_id),
  		KEY film_staff_actresses_idx (actress_id),
  		CONSTRAINT fk_film_staff_titles FOREIGN KEY (title_id) REFERENCES titles (title_id),
  		CONSTRAINT fk_film_staff_actors FOREIGN KEY (actor_id) REFERENCES actors (actor_id),
  		CONSTRAINT fk_film_staff_actresses FOREIGN KEY (actress_id) REFERENCES actresses (actress_id)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
	
DROP TABLE IF EXISTS film_types;

CREATE TABLE film_types(
		title_id BIGINT UNSIGNED NOT NULL,
		type_id INT UNSIGNED NOT NULL,
		PRIMARY KEY (title_id, type_id),
  		KEY film_types_titles_idx (title_id), 
  		KEY film_types_types_idx (type_id),
  		CONSTRAINT fk_film_types_titles FOREIGN KEY (title_id) REFERENCES titles (title_id),
  		CONSTRAINT fk_film_types_types FOREIGN KEY (type_id) REFERENCES types (type_id)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
	
DROP TABLE IF EXISTS film_producer;

CREATE TABLE film_producer(
		title_id BIGINT UNSIGNED NOT NULL,
		producer_id BIGINT UNSIGNED NOT NULL,	
		PRIMARY KEY (title_id, producer_id),
  		KEY film_producer_titles_idx (title_id), 
  		KEY film_producer_producers_idx (producer_id),
  		CONSTRAINT fk_film_producer_titles FOREIGN KEY (title_id) REFERENCES titles (title_id),
  		CONSTRAINT fk_film_producer_producers FOREIGN KEY (producer_id) REFERENCES producers (producer_id)		
		) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
	
	
DROP TABLE IF EXISTS film_genres;

CREATE TABLE film_genres(
		genres_id INT UNSIGNED NOT NULL,
		title_id BIGINT UNSIGNED NOT NULL,
		PRIMARY KEY (title_id, genre_id),
  		KEY film_genres_titles_idx (title_id), 
  		KEY film_genres_types_idx (genre_id),
  		CONSTRAINT fk_film_genres_titles FOREIGN KEY (title_id) REFERENCES titles (title_id),
  		CONSTRAINT fk_film_genres_genres FOREIGN KEY (genre_id) REFERENCES genres (genre_id)		
		) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
	
	
DROP TABLE IF EXISTS film_awards;

CREATE TABLE film_awards(
		award_id INT UNSIGNED NOT NULL,
		title_id BIGINT UNSIGNED NOT NULL,
		PRIMARY KEY (title_id, award_id),
  		KEY film_awards_titles_idx (title_id), 
  		KEY film_awards_awards_idx (award_id),
  		CONSTRAINT fk_film_awards_titles FOREIGN KEY (title_id) REFERENCES titles (title_id),
  		CONSTRAINT fk_film_awards_awards FOREIGN KEY (award_id) REFERENCES awards (award_id)		
		) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
		
DROP TABLE IF EXISTS posters;

CREATE TABLE posters(
		poster_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
		name VARCHAR(150),
		owner_id BIGINT UNSIGNED NOT NULL,
  		file_size BIGINT DEFAULT NULL,
  		PRIMARY KEY (poster_id),
		UNIQUE KEY poster_id (poster_id),
		KEY name (name),
		KEY owner_id (owner_id),
		CONSTRAINT posters_ibfk_1 FOREIGN KEY (owner_id) REFERENCES titles (title_id)
  		) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;	


DROP TABLE IF EXISTS trailers;	
	
CREATE TABLE trailers(
  		trailer_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  		name VARCHAR(255) NOT NULL,
		owner_id BIGINT UNSIGNED NOT NULL,
		file_size BIGINT DEFAULT NULL,
		PRIMARY KEY (trailer_id),
		UNIQUE KEY trailer_id (trailer_id),
		KEY name (name),
		KEY owner_id (owner_id),
		CONSTRAINT trailers_ibfk_1  FOREIGN KEY (owner_id ) REFERENCES titles (title_id)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;	

 
DROP TABLE IF EXISTS watched;

CREATE TABLE watched(
		title_id BIGINT UNSIGNED NOT NULL,
		user_id BIGINT UNSIGNED NOT NULL,
		watch_type TINYINT(1) DEFAULT '0',
		PRIMARY KEY (title_id, user_id),
  		KEY title_idx (title_id),
  		KEY user_idx (user_id),
  		CONSTRAINT titles_watched_fk FOREIGN KEY (title_id) REFERENCES titles (title_id),
  		CONSTRAINT users_watched_fk FOREIGN KEY (user_id) REFERENCES users (id)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS likes;

CREATE TABLE likes(
		title_id BIGINT UNSIGNED NOT NULL,
		user_id BIGINT UNSIGNED NOT NULL,
		like_type TINYINT(1) DEFAULT '0',
		PRIMARY KEY (title_id, user_id),
  		KEY title_idx (title_id),
  		KEY user_idx (user_id),
  		CONSTRAINT titles_likes_fk FOREIGN KEY (title_id) REFERENCES titles (title_id),
  		CONSTRAINT users_likes_fk FOREIGN KEY (user_id) REFERENCES users (id)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

 
DROP TABLE IF EXISTS membership; 

CREATE TABLE membership(
		membership_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
		user_id BIGINT UNSIGNED NOT NULL,
		status ENUM('active', 'inactive') NOT NULL,
		PRIMARY KEY (membership_id),
		CONSTRAINT fk_membership_users FOREIGN KEY (user_id) REFERENCES users (id)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 
 
DROP TABLE IF EXISTS payments; 

CREATE TABLE payments(
		payment_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
		user_id BIGINT UNSIGNED NOT NULL,
		status TINYINT(1) DEFAULT '0',
		PRIMARY KEY (payment_id),
		KEY user_idx (user_id),
		CONSTRAINT fk_payments_users FOREIGN KEY (user_id) REFERENCES users (id)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 
ALTER TABLE film_staff MODIFY COLUMN actor_id BIGINT UNSIGNED NOT NULL;
ALTER TABLE film_staff MODIFY COLUMN actress_id BIGINT UNSIGNED NOT NULL; 
 
 
 /* корректировка таблицы title - вывод рейтинга в Представление*/
 
 ALTER TABLE titles DROP raiting;


 