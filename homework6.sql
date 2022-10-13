/*1. Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека,
 который больше всех общался с выбранным пользователем (написал ему сообщений).
---Например задан пользователь 1*/

SELECT
	count(*) AS cnt,
	from_user_id,
	to_user_id
FROM messages
WHERE to_user_id = 1
GROUP BY from_user_id
LIMIT 1;

/* 2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет*/
SELECT
	count(media_id) AS 'likes',
	(SELECT count(user_id) FROM profiles WHERE (birthday + INTERVAL 10 YEAR) > NOW()) AS 'users'
FROM likes
WHERE user_id IN (
SELECT user_id FROM profiles WHERE (birthday + INTERVAL 10 YEAR) > NOW()
);

/*3. Определить кто больше поставил лайков (всего): мужчины или женщины*/

-- 1 вариант - количество мужчин и женщин через объединение union
SELECT 
	count(user_id) AS 'womans' FROM likes WHERE user_id IN (
		SELECT user_id FROM profiles WHERE gender='f')
UNION 
SELECT 
	count(user_id) AS 'mans' FROM likes WHERE user_id IN (
		SELECT user_id FROM profiles WHERE gender='m')
;

-- 2 вариант - подсчет общего количества мужчин и женщин в профиле
SELECT
	gender,
	count(*)
FROM profiles
GROUP BY gender;


	
	





	
	
