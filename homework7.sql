/*1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине*/
/*INSERT INTO orders (user_id)  #заполнила таблицу orders
VALUES
('55'),
('56'),
('57'),
('58'),
('59'),
('60');*/

SELECT
	count(*) AS cnt,
	user_id
	FROM orders
	GROUP BY user_id
	HAVING cnt >= 1
	ORDER BY cnt;
	
/*2. Выведите список товаров products и разделов catalogs, который соответствует товару*/
SELECT 
	products.name AS products,
	catalogs.name AS catalogs 
	FROM
	catalogs
	JOIN
	products
	ORDER BY catalogs.name;
	