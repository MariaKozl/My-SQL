/*Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение*/

/*1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем*/
UPDATE users 
	SET created_at = NOW() AND updated_at = NOW()
;

/*2. Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них долгое
 время помещались значения в формате "20.10.2017 8:10". Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения*/
ALTER TABLE users ADD created_at_dt DATETIME, ADD updated_at_dt DATETIME; #создадим новые поля с типом DATETIME

UPDATE users 
	SET created_at_dt = STR_TO_DATE(created_at, '%d.%m.%Y %H:%i'),
		updated_at_dt = STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i')
;

ALTER TABLE users
	DROP created_at, #удалим предыдущие поля created_at и updated_at c типом VARCHAR
	DROP updated_at,
	RENAME COLUMN created_at_dt TO created_at, #переименуем новые поля
	RENAME COLUMN updated_at_dt TO updated_at
;

/*В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар закончился и выше нуля,
 если на складе имеются запасы. Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. 
 Однако, нулевые запасы должны выводиться в конце, после всех записей.*/
INSERT INTO 
	storehouses_products (storehouse_id, product_id, value) 
VALUES 
	(1, 1, 2),
	(2, 2, 0),
	(3, 3, 5),
	(4, 4, 0),
	(5, 5, 4),
	(6, 6, 3)
;

SELECT 
	value
FROM
	storehouses_products
ORDER BY IF(value > 0, 0, 1), value;






	
