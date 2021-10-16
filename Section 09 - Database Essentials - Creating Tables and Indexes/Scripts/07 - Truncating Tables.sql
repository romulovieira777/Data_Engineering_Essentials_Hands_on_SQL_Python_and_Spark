-- Truncating Tables
DROP TABLE IF EXISTS
	user_logins;


DROP TABLE IF EXISTS
	users;


DROP SEQUENCE IF EXISTS
	users_user_id_seq;


CREATE TABLE users
(
    user_id SERIAL PRIMARY KEY
  , user_first_name VARCHAR(30) NOT NULL
  , user_last_name VARCHAR(30) NOT NULL
  , user_email_id VARCHAR(50) NOT NULL
  , user_email_validated BOOLEAN
  , user_password VARCHAR(200)
  , user_role VARCHAR(1)
  , is_active BOOLEAN
  , created_dt DATE DEFAULT CURRENT_DATE
);


CREATE TABLE user_logins
(
    user_login_id SERIAL PRIMARY KEY
 ,  user_id INT
 ,  user_login_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
 ,  user_ip_addr VARCHAR(20)
);


ALTER TABLE
	user_logins
ADD FOREIGN KEY
	(user_id)
REFERENCES
	users(user_id);


-- WRONG
TRUNCATE TABLE
	users;


INSERT INTO users
(
	user_first_name
  , user_last_name
  , user_email_id
) VALUES (
	'Donald'
  , 'Duck'
  , 'donald@duck.com'
);


SELECT
	*
FROM
	users;


INSERT INTO users
(
	user_first_name
  , user_last_name
  , user_email_id
  , user_role
  , is_active
) VALUES (
	'Mickey'
  , 'Mouse'
  , 'mickey@mouse.com'
  , 'U'
  , true
);


INSERT INTO users 
(
	user_first_name
  , user_last_name
  , user_email_id
  , user_password
  , user_role
  , is_active
) VALUES (
	'Gordan'
  , 'Bradock'
  , 'gbradock0@barnesandnoble.com'
  , 'h9LAz7p7ub'
  , 'U'
  , true
), (
	'Tobe'
  , 'Lyness'
  , 'tlyness1@paginegialle.it'
  , 'oEofndp'
  , 'U'
  , true
), (
	'Addie'
  , 'Mesias'
  , 'amesias2@twitpic.com'
  , 'ih7Y69u56'
  , 'U'
  , true
);


INSERT INTO user_logins 
    (user_id)
VALUES
    (1),
    (2),
    (3),
    (1),
    (1),
    (4);


SELECT
	*
FROM
	users;


SELECT
	*
FROM
	user_logins;


TRUNCATE TABLE
	users CASCADE;


SELECT
	*
FROM
	users;


SELECT
	*
FROM
	user_logins;