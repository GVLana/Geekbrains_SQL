

USE kinopoisk;

/*представление "Новые поступления"*/

DROP VIEW IF EXISTS new_arrivals;

CREATE VIEW new_arrivals AS
SELECT t.name AS title, t.description AS about, t.release_year AS release_year, l.name AS languages, c.name AS country 
FROM titles AS t
LEFT JOIN languages AS l 
ON t.language_id  = l.language_id 
LEFT JOIN countries AS c 
ON t.country_id  = c.country_id; 
WHERE DATEDIFF(day, t.created_at, GETDATE()) < 30;

SELECT * FROM new_arrivals;


/*процедура заполнения рейтинга фильмов в зависимости от количества лайков*/

DROP TABLE IF EXISTS raiting_logs;

CREATE TABLE raiting_logs(
	title_id BIGINT UNSIGNED NOT NULL,
	like_type TINYINT(1) UNSIGNED NOT NULL
	) ENGINE ARCHIVE;


DROP PROCEDURE IF EXISTS append_raiting_logs;

DELIMITER //
CREATE PROCEDURE append_raiting_logs(
	ti BIGINT,
	lt TINYINT(1))
BEGIN
	INSERT INTO raiting_logs (title_id, like_type) VALUES (ti, lt);
END//
DELIMITER ;

DROP TRIGGER IF EXISTS append_raiting_logs_from_likes;

DELIMITER //
CREATE TRIGGER append_raiting_logs_from_likes
AFTER INSERT ON likes
FOR EACH ROW
BEGIN
	CALL append_raiting_logs(NEW.title_id, NEW.like_type);
END//
DELIMITER ;


/* создание Предсталвения рейтинг по количеству лайков*/

DROP VIEW IF EXISTS raiting;

CREATE VIEW raiting AS
SELECT t.name AS title, SUM(rl.like_type) AS raiting FROM titles AS t
LEFT JOIN raiting_logs AS rl
ON t.title_id = rl.title_id 
GROUP BY t.title_id 
ORDER BY raiting DESC LIMIT 200;

SELECT * FROM raiting;

DROP FUNCTION IF EXISTS grade_of_title;

DELIMITER //
CREATE FUNCTION grade_of_title (for_title_id BIGINT UNSIGNED)
RETURNS FLOAT
READS SQL DATA
BEGIN 
	DECLARE cnt_r INT;
	DECLARE cnt_total INT;
	SET cnt_r = (SELECT SUM(like_type) FROM raiting_logs WHERE title_id = for_title_id);
	SET cnt_total = (SELECT SUM(like_type) FROM raiting_logs);
	RETURN (cnt_r/cnt_total)*100;
	
END//
DELIMITER ;

DROP VIEW IF EXISTS grade;

CREATE VIEW grade AS
SELECT name, 
CASE
	WHEN grade_of_title(title_id) >= 80 THEN 'хорошо'
	WHEN grade_of_title(title_id) < 80 AND grade_of_title(title_id) >= 50 THEN 'средне'
	ELSE 'плохо'
END AS garde
FROM titles

SELECT * FROM grade;

/* заполнение Статуса членства*/

DROP PROCEDURE IF EXISTS append_membership;

DELIMITER //
CREATE PROCEDURE append_membership(
	id BIGINT,
	s ENUM('active', 'inactive')) 
BEGIN
	INSERT INTO membership (user_id, status) VALUES (id, 'active');
END//
DELIMITER ;

DROP TRIGGER IF EXISTS append_membership_from_payments;

DELIMITER //
CREATE TRIGGER append_membership_from_payments
AFTER INSERT ON payments
FOR EACH ROW
BEGIN
	CALL append_membership((SELECT user_id FROM payments WHERE created_at = NOW()), 'active');
END//
DELIMITER ;


DROP VIEW IF EXISTS membership_status;

CREATE VIEW membership_status AS
SELECT CONCAT(u.firstname, ' ', u.lastname) AS user, 
(CASE WHEN m.status IS NULL THEN 'inactive' ELSE m.status END)
AS status FROM users AS u
LEFT JOIN membership AS m 
ON u.id = m.user_id; 

SELECT * FROM membership_status;



	
