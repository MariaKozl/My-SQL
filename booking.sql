/*   Booking.com представляет собой систему онлайн-бронирования отелей по всему миру, и
 является мировым лидером в сфере онлайн-туризма, а также сопутсвующих услуг.
 Сервис имеет в своей базе более 1 000 000 отелей по всему миру.
    Первоначалаьно Booking.com представлял собой сервис только для бронирования отелей,
 потом по мере развития подключились и дополнительные услуги - организация трансферов, 
 покупка билетов на самолет, развлечения.*/

/* Создадим базу данных booking*/

DROP DATABASE IF EXISTS booking;
CREATE DATABASE booking;
USE booking;

/* Создадим таблицу "Каталог" базы данных booking. Данная таблица отображает основные 
 разделы главной страницы booking.com. */

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
	id BIGINT UNSIGNED PRIMARY KEY,
	name VARCHAR(255) COMMENT 'Название раздела'
) COMMENT 'Разделы главной страницы booking.com';

INSERT INTO catalogs VALUES
	(1, 'Общие настройки'),
	(2, 'Личный кабинет пользователя'),
	(3, 'Жилье'),
	(4, 'Авиабилеты'),
	(5, 'Аренда машин'),
	(6, 'Варианты досуга'),
	(7, 'Такси от/до аэропорта'),
	(8, 'Поиск'),
	(9, 'Скидки'),
	(10, 'Фото и видео')
 ;

/* Создадим таблицу-справочник "Язык и национальность" базы данных booking. */ 

DROP TABLE IF EXISTS `languages`;
CREATE TABLE `languages` (
	id SERIAL,
    `language` VARCHAR(100),
    nationality VARCHAR(100)
);

INSERT INTO `languages` VALUES
	(1, 'Русский', 'Русский'),
	(2, 'English', 'English'),
	(3, 'Español', 'Spanish'),
	(4, 'Italiano', 'Italian'),
	(5, 'Français', 'French'),
	(6, 'Deutsch', 'German'),
	(7, '中文', 'Chinese'),
	(8, 'český', 'Czech'),
	(9, 'Polski', 'Polish'),
	(10, '日本語', 'Japanese')
 ;

/* Создадим таблицу "Общие настройки" (доступны для любого посетителя сервиса: выбор
  языка, валюты, подключение уведомлений. */

DROP TABLE IF EXISTS general_settings;
CREATE TABLE general_settings (
	catalog_id BIGINT UNSIGNED,
	language_id BIGINT UNSIGNED,
	currency CHAR(3),
	notification VARCHAR(255) COMMENT 'Уведомления',
	
	FOREIGN KEY (catalog_id) REFERENCES catalogs(id),
	FOREIGN KEY (language_id) REFERENCES `languages`(id)
);

INSERT INTO general_settings VALUES
	(1, 1, 'RUB', 'Уведомления включены'),
	(1, 2, 'USD', 'Notifications are enabled'),
	(1, 3, 'EUR', 'Notificaciones'),
	(1, 4, 'EUR', 'Notifiche incluse'),
	(1, 5, 'EUR', 'Notifications incluses'),
	(1, 6, 'EUR', 'Benachrichtigungen enthalten'),
	(1, 7, 'CNY', '通知已启用'),
	(1, 8, 'CZK', 'Oznámení zahrnuty'),
	(1, 8, 'PLN', 'Powiadomienia włączone'),
	(1, 10, 'JPY', '通知が有効になっている')
 ;

/* Создадим таблицу "Пользователи", которая будет хранить информацию из личного кабинета
  зарегистрированного пользователя базы данных booking.*/ 

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	catalog_id BIGINT UNSIGNED,
	firstname VARCHAR(100),
	lastname VARCHAR(100),
	email VARCHAR(200) UNIQUE,
	password VARCHAR(255),
	phone BIGINT UNSIGNED UNIQUE,
	INDEX idx_users_username (firstname, lastname),
	
	FOREIGN KEY (catalog_id) REFERENCES catalogs(id)
	
) COMMENT 'Пользователи';

INSERT INTO users VALUES
	(1, 2, 'Camylle', 'Jerde', 'kfritsch@example.com', '2869c869d36d3a71093ff3430a15d585f713aaf5', 8925283071),
	(2, 2, 'Frederick', 'Funk', 'laila27@example.org', 'b6f8277ceee05f7ca5951a7fabe70eaa9b2f3da2', 8927562706),
	(3, 2, 'Mackenzie', 'Reilly', 'dmorar@example.org', '4597298d82b96634a566fc72af0ec671ac2a2e31', 8930720299),
	(4, 2, 'Rosanna', 'Gulgowski', 'pschimmel@example.com', '7b1b8bc028a94afde1374128b58433f8d7c5ecfb', 8995992803),
	(5, 2, 'Cedrick', 'Smith', 'alia.macejkovic@example.org', 'e8fb0bfd50903cd2ea630f9f98b30d31b9a99075', 8984943437),
	(6, 2, 'Valentina', 'Stoltenberg', 'bernadette74@example.org', 'e8f3f90cf922e07a60c5298e182d65e333e346a0', 8948389689),
	(7, 2, 'Friedrich', 'Mohr', 'herminia92@example.net', '9eb74f33c05988a07dbaaf08139c129f814b81d8', 8946567797),
	(8, 2, 'Merl', 'McCullough', 'christop.hermiston@example.com', '9b99a11ea5dc5bfd56f5ae3ee069062ec0ff2514', 8944910616),
	(9, 2, 'Keely', 'Beatty', 'ike01@example.net', 'bf1dbf77aa8afa4a3530e2fcc850004d78a529e7', 8976444966),
	(10, 2, 'Nia', 'Parisian', 'jmurphy@example.net', '266efaa86061ed7a2a2cd349f6dac7ff93e01722', 8909823696)
 ;

/* Создадим таблицы-справочники "Страны" и "Города" базы данных booking. */

DROP TABLE IF EXISTS countries;
CREATE TABLE countries (
	id SERIAL,
    name VARCHAR(255)
);

INSERT INTO countries VALUES
	(1, 'Россия'),
	(2, 'England'),
	(3, 'Spain'),
	(4, 'Italy'),
	(5, 'France'),
	(6, 'Germany'),
	(7, 'China'),
	(8, 'Czech Republic'),
	(9, 'Poland'),
	(10, 'Japan')
 ;

DROP TABLE IF EXISTS towns;
CREATE TABLE towns (
	id SERIAL,
	country_id BIGINT UNSIGNED,
    name VARCHAR(255),

    FOREIGN KEY (country_id) REFERENCES countries(id)
);

INSERT INTO towns VALUES
	(1, 1, 'Москва'),
	(2, 1, 'Санкт-Петербург'),
	(3, 1, 'Сочи'),
	(4, 1, 'Екатеринбург'),
	(5, 1, 'Казань'),
	(6, 1, 'Новосибирск'),
	(7, 4, 'Rome'),
	(8, 4, 'Venezia'),
	(9, 4, 'Milano'),
	(10, 5, 'Paris')
 ;

/* Создадим таблицу "Персональные данные" базы данных booking. В ней также будет храниться информация
 из личного кабинета пользователя. */

DROP TABLE IF EXISTS personal_details;
CREATE TABLE personal_details (
	user_id BIGINT UNSIGNED NOT NULL PRIMARY KEY,
	gender CHAR(1),
	nationality_id BIGINT UNSIGNED,
	birthday DATE,
	country_id BIGINT UNSIGNED,
	town_id BIGINT UNSIGNED,
	payment_cards VARCHAR(255),
	
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (nationality_id) REFERENCES `languages`(id),
	FOREIGN KEY (country_id) REFERENCES countries(id),
	FOREIGN KEY (town_id) REFERENCES towns(id)
);

INSERT INTO personal_details VALUES
	(1, 'F', 1, '1990-03-05', 1, 1, 'VISA'),
	(2, 'M', 1, '2017-02-03', 1, 1, 'VISA'),
	(3, 'M', 1, '1998-12-11', 1, 2, 'VISA'),
	(4, 'F', 4, '1993-05-24', 4, 7, 'MasterCard'),
	(5, 'M', 5, '1988-01-13', 5, 10, 'MasterCard'),
	(6, 'F', 1, '2002-04-17', 1, 3, 'VISA'),
	(7, 'M', 4, '2000-03-14', 4, 8, 'MasterCard'),
	(8, 'M', 4, '1995-01-12', 4, 9, 'VISA'),
	(9, 'F', 1, '1997-08-02', 1, 6, 'VISA'),
	(10, 'F', 1, '1995-02-10', 1, 3, 'VISA')
 ;

/* Создадим таблицу "Поиск" базы данных booking. */

DROP TABLE IF EXISTS searchs;
CREATE TABLE searchs (
	id SERIAL PRIMARY KEY,
	country_id BIGINT UNSIGNED,
	town_id BIGINT UNSIGNED,
	check_in DATE,
	check_out DATE,
	adults_travellers BIGINT UNSIGNED,
	children_travellers BIGINT UNSIGNED,
	rooms BIGINT UNSIGNED UNSIGNED,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	
	FOREIGN KEY (country_id) REFERENCES countries(id),
	FOREIGN KEY (town_id) REFERENCES towns(id)
);

INSERT INTO searchs VALUES
	(1, 1, 1, '2021-09-26', '2021-09-28', 2, 0, 1, '2021-09-20 14:56:43'),
	(2, 1, 1, '2021-09-29', '2021-10-05', 1, 0, 1, '2021-09-20 14:57:21'),
	(3, 1, 1, '2021-10-04', '2021-10-14', 2, 1, 1, '2021-09-20 15:03:11'),
	(4, 4, 7, '2021-10-05', '2021-10-06', 2, 2, 1, '2021-09-20 15:04:17'),
	(5, 4, 8, '2021-10-11', '2021-10-20', 2, 0, 1, '2021-09-20 15:20:01'),
	(6, 1, 2, '2021-10-18', '2021-10-25', 1, 0, 1, '2021-09-20 15:22:03'),
	(7, 4, 9, '2021-10-24', '2021-10-28', 2, 0, 1, '2021-09-20 15:54:55'),
	(8, 5, 10, '2021-11-01', '2021-11-03', 2, 1, 1, '2021-09-20 16:06:23'),
	(9, 1, 5, '2021-11-15', '2021-11-20', 2, 0, 1, '2021-09-20 16:10:11'),
	(10, 1, 2, '2021-11-12', '2021-11-15', 2, 0, 1, '2021-09-20 16:50:00')
 ;

/* Создадим таблицу-справочник "Жилье" базы данных booking. */ 

DROP TABLE IF EXISTS habitations;
CREATE TABLE habitations (
	id SERIAL,
	name VARCHAR(100) COMMENT 'Наименование жилья'
);

INSERT INTO habitations VALUES
	(1, 'Отель'),
	(2, 'Апартаменты'),
	(3, 'Квартира'),
	(4, 'Курортный отель'),
	(5, 'Вилла'),
	(6, 'Шале'),
	(7, 'Коттедж'),
	(8, 'Глэмпинг'),
	(9, 'Гостевой дом'),
	(10, 'Хостел')
 ;

/* Создадим таблицу "Отели" базы данных booking для хранения информации об отелях. */

DROP TABLE IF EXISTS hotels;
CREATE TABLE hotels (
	id SERIAL,
	habitation_id BIGINT UNSIGNED,
	name VARCHAR(100),
	country_id BIGINT UNSIGNED,
	town_id BIGINT UNSIGNED,
	address VARCHAR(500),
	top FLOAT COMMENT 'Рейтинг отеля',
	breakfast BIT COMMENT 'Завтрак: включен или нет',
	price_for_day DECIMAL (11,2) COMMENT 'Цена за сутки',
	
	FOREIGN KEY (habitation_id) REFERENCES habitations(id),
	FOREIGN KEY (country_id) REFERENCES countries(id),
	FOREIGN KEY (town_id) REFERENCES towns(id)
);

INSERT INTO hotels VALUES
	(1, 1, 'Corrupti', 1, 1, '260 Murazik Land Apt. 054\nPort Cathryn, IL 56582', 5.0, 1, 12094.35),
	(2, 1, 'Blanditiis', 1, 2, '288 Torphy Way Suite 881\nRaoulmouth, IL 19612', 4.2, 1, 5000.80),
	(3, 1, 'Voluptas', 1, 3,'87691 Amya Rest\nEast Molliemouth, GA 49057-5903', 3.3, 1, 2147.44),
	(4, 1, 'Et', 1,  4,'72552 Mayert Freeway\nPort Velma, WV 87488-1710', 4.0, 0, 1366.20),
	(5, 1, 'Ullam', 1, 5, '36920 Dennis Rest Apt. 412\nMargarettside, VT 74795', 3.9, 0, 2566.50),
	(6, 1, 'Assumenda', 1, 6,'38173 Regan Summit Suite 250\nAngiemouth, RI 90978', 3.0, 1, 2807.30),
	(7, 1, 'Rerum', 4, 7,'74442 Kunde Cliffs Suite 227\nSouth Nicholaus, WI 40852-2093', 3.1, 1, 3154.27),
	(8, 1, 'Exercitationem', 4, 8,'182 Elinor Ville Suite 864\nPaucekhaven, SC 83382-3008', 4.9, 1, 3849.90),
	(9, 1, 'Est', 4, 9,'533 Alvis Well\nWest Hugh, AL 05684-7495', 3.5, 0, 1870.86),
	(10, 1, 'Architecto', 5, 10,'48617 Arianna Gateway Apt. 450\nRoweview, NE 71039', 3.8, 0, 3100.54)
 ;

/* Создадим таблицу "Бронирование" для хранения информации о бронированиях пользователя. */

DROP TABLE IF EXISTS reservations;
CREATE TABLE reservations (
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	KEY index_of_user_id(user_id),
	
	FOREIGN KEY (user_id) REFERENCES users(id)
	
) COMMENT = 'Бронирование';

INSERT INTO reservations (id, user_id) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 2),
	(5, 2),
	(6, 3),
	(7, 4),
	(8, 4),
	(9, 5),
	(10, 7)
 ;

/* Создадим таблицу "Расчет бронирования". */

DROP TABLE IF EXISTS payments;
CREATE TABLE payments (
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED,
	reservation_id BIGINT UNSIGNED,
	discount FLOAT UNSIGNED COMMENT 'Величина скидки от 0.0 до 1.0',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (reservation_id) REFERENCES reservations(id)
	
) COMMENT = 'Расчет бронирования';

INSERT INTO payments (id, user_id, reservation_id, discount) VALUES
	(1, 1, 1, 0.0),
	(2, 1, 2, 0.0),
	(3, 1, 3, 0.5),
	(4, 2, 4, 0.0),
	(5, 2, 5, 0.0),
	(6, 3, 6, 0.1),
	(7, 4, 7, 0.2),
	(8, 4, 8, 0.0),
	(9, 5, 9, 0.0),
	(10, 7, 10, 0.0)
 ;
 

/* С помощью базы данных booking реализуем следующие задачи: */

/* 1. Показать все города России, имеющиеся в базе данных. */
SELECT
	name AS 'name_town',
	(SELECT name FROM countries WHERE name='Россия') AS 'name_country'
FROM towns
WHERE country_id=1;

/* 2. Показать количество городов России, имеющихся в базе данных. */
SELECT
	COUNT(*),
	(SELECT name FROM countries WHERE name='Россия') AS 'name_country'
FROM towns
WHERE country_id=1;

/* 3. Выбрать 3 самых активных пользователей (у кого на счету больше всего бронирований). */
SELECT
	COUNT(*) AS 'cnt',
	CONCAT(u.firstname, ' ', u.lastname) AS 'name_users'
FROM users AS u 
JOIN reservations AS r ON u.id = r.user_id
GROUP BY u.id
ORDER BY cnt DESC
LIMIT 3;

/* 4. Выполнить представление списка стран в алфавитном порядке. */
CREATE OR REPLACE VIEW list_countries
AS SELECT id, name FROM countries
ORDER BY name;

SELECT * FROM list_countries;

/* 5. Выполнить представление: в какой стране чаще всего ищут жилье пользователи. */
CREATE OR REPLACE VIEW favourite_country AS
SELECT
	COUNT(*),
	s.country_id,
	c.name
FROM searchs AS s
RIGHT JOIN countries AS c ON s.country_id = c.id
GROUP BY s.country_id
LIMIT 1;

SELECT * FROM favourite_country;

/* 6. Выполнить хранимую процедуру по поиску отелей в заданной стране (на примере России)
  с рейтингом выше 4, отсортировать их по убыванию цены. */
#DROP PROCEDURE IF EXISTS top_hotels_in_Russia;
DELIMITER //
CREATE PROCEDURE top_hotels_in_Russia(search_country_id BIGINT UNSIGNED)
BEGIN 
	SELECT
		h.name,
		h.top,
		h.price_for_day,
		c.name
	FROM hotels AS h
	JOIN countries AS c ON h.country_id = c.id
	WHERE h.top > '4'
	AND h.country_id = search_country_id
	ORDER BY price_for_day DESC;
END//
DELIMITER ;

CALL top_hotels_in_Russia(1); 

/* 7. Триггер, проверяющий в таблице "Поиск" даты заезда "из прошлого". */ 
DELIMITER //
CREATE TRIGGER check_date
BEFORE INSERT 
ON searchs FOR EACH ROW
BEGIN 
	IF NEW.check_in < CURRENT_DATE()THEN 
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Указана неверная дата заезда';
	END IF;
END //
DELIMITER ;





	
 








