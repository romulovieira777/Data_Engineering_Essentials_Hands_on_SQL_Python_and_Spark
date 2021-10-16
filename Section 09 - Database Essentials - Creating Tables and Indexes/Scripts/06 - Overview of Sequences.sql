-- Overview of Sequences
DROP SEQUENCE IF EXISTS
	test_seq;


CREATE SEQUENCE
	test_seq
START WITH
	101
MINVALUE
	101
MAXVALUE
	1000
INCREMENT BY
	100;


SELECT
	currval('test_seq');


SELECT
	nextval('test_seq');


SELECT
	currval('test_seq');


SELECT
	nextval('test_seq');


SELECT
	currval('test_seq');
	

SELECT
	nextval('test_seq');
	

SELECT
	currval('test_seq');


ALTER SEQUENCE
	test_seq
INCREMENT BY
	1
RESTART WITH
	101;


SELECT
	nextval('test_seq');


SELECT
	currval('test_seq');


SELECT
	nextval('test_seq');


SELECT
	currval('test_seq');


DROP SEQUENCE
	test_seq;


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


SELECT
	*
FROM
	information_schema.sequences;


SELECT
	nextval('users_user_id_seq');


SELECT
	currval('users_user_id_seq');


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
  

SELECT
	*
FROM
	users;


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
	

SELECT
	currval('users_user_id_seq');


SELECT
	*
FROM
	users;


INSERT INTO users
(
	user_id
  , user_first_name
  , user_last_name
  , user_email_id
) VALUES (
	7
  , 'Scott'
  , 'Tiger'
  , 'scott@tiger.com'
);


SELECT
	currval('users_user_id_seq');


DROP TABLE IF EXISTS
	users;


DROP SEQUENCE IF EXISTS
	users_user_id_seq;


CREATE TABLE users
(
    user_id SERIAL PRIMARY KEY
 ,  user_first_name VARCHAR(30) NOT NULL
 ,  user_last_name VARCHAR(30) NOT NULL
 ,  user_email_id VARCHAR(50) NOT NULL
 ,  user_email_validated BOOLEAN
 ,  user_password VARCHAR(200)
 ,  user_role VARCHAR(1)
 ,  is_active BOOLEAN
 ,  created_dt DATE DEFAULT CURRENT_DATE
);


INSERT INTO users
(
	user_id
  , user_first_name
  , user_last_name
  , user_email_id
) VALUES (
	1
  , 'Donald'
  , 'Duck'
  , 'donald@duck.com'
);


INSERT INTO users
(
	user_id
  , user_first_name
  , user_last_name
  , user_email_id
  , user_role
  , is_active
) VALUES (
	2
  , 'Mickey'
  , 'Mouse'
  , 'mickey@mouse.com'
  , 'U'
  , true
);


INSERT INTO users 
(
	user_id
  , user_first_name
  , user_last_name
  , user_email_id
  , user_password
  , user_role
  , is_active
) VALUES (
	3
  , 'Gordan'
  , 'Bradock'
  , 'gbradock0@barnesandnoble.com'
  , 'h9LAz7p7ub'
  , 'U'
  , true
), (
	4
  , 'Tobe'
  , 'Lyness'
  , 'tlyness1@paginegialle.it'
  , 'oEofndp'
  , 'U'
  , true
), (
	5
  , 'Addie'
  , 'Mesias'
  , 'amesias2@twitpic.com'
  , 'ih7Y69u56'
  , 'U'
  , true
);


SELECT
	*
FROM
	users;


SELECT
	nextval('users_user_id_seq');


SELECT
	currval('users_user_id_seq');


ALTER SEQUENCE
	users_user_id_seq RESTART WITH 5;


SELECT
	currval('users_user_id_seq');


SELECT
	nextval('users_user_id_seq');


SELECT
	currval('users_user_id_seq');


INSERT INTO users
(
	user_first_name
  , user_last_name
  , user_email_id
) VALUES (
	'Scott'
  , 'Tiger'
  , 'scott@tiger.com'
);


SELECT
	currval('users_user_id_seq');


SELECT
	*
FROM
	users;


DROP SEQUENCE
	users_user_id_seq CASCADE;


SELECT
	*
FROM
	users;


CREATE SEQUENCE
	users_user_id_seq 
START WITH
	7
MINVALUE
	1;


ALTER SEQUENCE
	users_user_id_seq
OWNED BY
	users.user_id;


ALTER TABLE
	users 
ALTER COLUMN
	user_id 
SET DEFAULT
	nextval('users_user_id_seq');


INSERT INTO users
(
	user_first_name
  , user_last_name
  , user_email_id
) VALUES (
		'Matt'
      , 'Clarke'
	  , 'matt@clarke.com'
);


SELECT
	currval('users_user_id_seq');