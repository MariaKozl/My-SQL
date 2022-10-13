/*ТРАНЗАКЦИИ, ПЕРЕМЕННЫЕ, ПРЕДСТАВЛЕНИЯ
1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
 Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.
 */
START TRANSACTION;
INSERT INTO sample.users (SELECT * FROM shop.users WHERE shop.users.id = 1);
COMMIT;

/* 2. Создайте представление, которое выводит название name товарной позиции из таблицы products
 и соответствующее название каталога name из таблицы catalogs.*/
CREATE VIEW names AS
SELECT
	pr.name,
	cat.name 
FROM products AS pr
JOIN catalogs AS cat ON pr.catalog_id = cat.id;

/*----------------------------------------------------------------------------------------------------*/


/*ХРАНИМЫЕ ПРОЦЕДУРЫ, ФУНКЦИИ И ТРИГГЕРЫ
  1. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от 
 текущего времени суток. С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", 
 с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер",
 с 00:00 до 6:00 — "Доброй ночи".*/
DROP PROCEDURE IF EXISTS hello;
DELIMITER //
CREATE PROCEDURE hello ()
BEGIN
	IF (CURTIME () BETWEEN '06:00:00' AND '12:00:00') THEN 
		SELECT 'Доброе утро';
	ELSEIF (CURTIME() BETWEEN '12:00:00' AND '18:00:00') THEN 
		SELECT 'Добрый день';
	ELSEIF (CURTIME() BETWEEN '18:00:00' AND '00:00:00') THEN 
		SELECT 'Добрый вечер';
	ELSE
		SELECT 'Доброй ночи';
	END IF;
END//
DELIMITER ;

/*2. В таблице products есть два текстовых поля: name с названием товара и description с его описанием.
 Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное 
 значение NULL неприемлема. Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля
 были заполнены. При попытке присвоить полям NULL-значение необходимо отменить операцию.*/
DROP TRIGGER IF EXISTS name_and_description_notnull;
DELIMITER //
CREATE TRIGGER name_and_description_notnull BEFORE INSERT ON products
FOR EACH ROW
BEGIN 
	IF NEW.name IS NULL AND NEW.description IS NULL THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Операция неприемлема';
	END IF;
END//
DELIMITER ;

