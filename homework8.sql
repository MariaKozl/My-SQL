/*1. Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека,
 который больше всех общался с выбранным пользователем (написал ему сообщений).
---Например задан пользователь 1*/
SELECT
	count(*),
	m.from_user_id,
	m.to_user_id
FROM messages AS m 
JOIN users AS u ON u.id = m.from_user_id
WHERE m.to_user_id = 1
GROUP BY m.from_user_id
ORDER BY count(*) DESC
LIMIT 1
;

/* 2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет*/
SELECT
	count(*)
FROM likes AS l
JOIN profiles AS p ON l.id = p.user_id
WHERE birthday + INTERVAL 10 YEAR > NOW()
;

/*3. Определить кто больше поставил лайков (всего): мужчины или женщины*/

SELECT 
	gender,
	count(*)
FROM profiles AS p
RIGHT JOIN likes AS l ON l.id = p.user_id AND p.gender = 'f'
LEFT JOIN likes AS l2 ON l2.id = p.user_id AND p.gender = 'm'
GROUP BY p.gender
;


	
	





	
	
