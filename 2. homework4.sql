/*Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке*/
SELECT DISTINCT firstname
FROM users
ORDER BY firstname;


/*Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false).
 Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)*/
ALTER TABLE profiles
MODIFY COLUMN is_active BOOL DEFAULT true; #чтобы добавить использовала ADD

UPDATE profiles
SET is_active = false
WHERE YEAR(birthday) >= YEAR(CURDATE()-INTERVAL 18 YEAR);


/*Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней)*/
DELETE FROM messages
WHERE created_at < CURRENT_TIMESTAMP();

