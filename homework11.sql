/* 1. Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, catalogs
и products в таблицу logs помещается время и дата создания записи, название таблицы, идентификатор
 первичного ключа и содержимое поля name. */

DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
	created_at DATETIME NOT NULL,
	table_name VARCHAR(45) NOT NULL,
	id_prkey BIGINT(20) NOT NULL,
	name_value VARCHAR(45) NOT NULL
) ENGINE = ARCHIVE;


DROP TRIGGER IF EXISTS log_users; #Триггер users
delimiter //
CREATE TRIGGER log_users AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, id_prkey, name_value)
	VALUES (NOW(), 'users', NEW.id, NEW.name);
END //
delimiter ;


DROP TRIGGER IF EXISTS log_catalogs; #Триггер catalogs
delimiter //
CREATE TRIGGER log_catalogs AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, id_prkey, name_value)
	VALUES (NOW(), 'catalogs', NEW.id, NEW.name);
END //
delimiter ;


DROP TRIGGER IF EXISTS log_products; #Триггер products
delimiter //
CREATE TRIGGER log_products AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, id_prkey, name_value)
	VALUES (NOW(), 'products', NEW.id, NEW.name);
END //
delimiter ;

#Проверка

SELECT * FROM users;
SELECT * FROM logs;

INSERT INTO users (name, birthday_at)
VALUES ('Leo', '1995-02-10');


SELECT * FROM catalogs;
SELECT * FROM logs;

INSERT INTO catalogs (name)
VALUES ('Клавиатура');


SELECT * FROM products;
SELECT * FROM logs;

INSERT INTO products (name, price)
VALUES ('Lenovo', 45000.00);
