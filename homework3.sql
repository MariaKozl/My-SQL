DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles(
	user_id BIGINT UNSIGNED NOT NULL PRIMARY KEY,
	gender CHAR(1),
	hometown VARCHAR(255),
	birthday DATETIME,
	created_at DATETIME DEFAULT NOW()
	
	FOREIGN KEY (hometown) REFERENCES hometowns(id)
) COMMENT 'добавлен внешний ключ к справочнику городов';

DROP TABLE IF EXISTS hometowns;
CREATE TABLE hometowns(
	id SERIAL,
	name VARCHAR(255) #Названия городов
) COMMENT 'справочник городов';


DROP TABLE IF EXISTS comments;
CREATE TABLE comments(
	id SERIAL,
	from_user_id BIGINT UNSIGNED NOT NULL,
	to_user_id BIGINT UNSIGNED NOT NULL,
	media_id BIGINT UNSIGNED NOT NULL,
	body TEXT,
	comment_like_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	
	FOREIGN KEY (from_user_id) REFERENCES users(id),
	FOREIGN KEY (to_user_id) REFERENCES users(id),
	FOREIGN KEY (media_id) REFERENCES media(id),
	FOREIGN KEY (comment_like_id) REFERENCES likes(id)
) COMMENT 'комментарии';


DROP TABLE IF EXISTS birthday_friends;
CREATE TABLE birthday_friends(
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL PRIMARY KEY,
	birthday DATETIME,
	reminder DATETIME DEFAULT DAY,
	
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (birthday) REFERENCES profiles(birthday)
) COMMENT 'дни рождения друзей';