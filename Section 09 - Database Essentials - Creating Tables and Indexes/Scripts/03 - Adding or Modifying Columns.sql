-- Adding or Modifying Columns
DROP SEQUENCE IF EXISTS
	users_user_id_seq;


CREATE SEQUENCE
	users_user_id_seq;


ALTER TABLE
	users
ALTER COLUMN
	user_id
SET DEFAULT
	nextval('users_user_id_seq');


SELECT
	table_catalog
  , table_name
  , column_name
  , data_type
  , character_maximum_length
  , column_default
  , is_nullable
  , ordinal_position
FROM
	information_schema.columns 
WHERE
	table_name = 'users'
ORDER BY
	ordinal_position;


ALTER TABLE
	users
ALTER COLUMN
	user_email_validated
SET DEFAULT
	FALSE,
ALTER COLUMN
	is_active
SET DEFAULT
	FALSE;


ALTER TABLE
	users
ALTER COLUMN
	user_role
SET DATA TYPE
	CHAR(1),
ALTER COLUMN
	user_role
SET DEFAULT
	'U';


ALTER TABLE
	users
ADD COLUMN
	last_updated_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP;


DROP TABLE IF EXISTS
	users;


CREATE TABLE users
(
  user_id INT
, user_first_name VARCHAR(30) NOT NULL
, user_last_name VARCHAR(30) NOT NULL
, user_email_id VARCHAR(50) NOT NULL
, user_email_validated BOOLEAN
, user_password VARCHAR(200)
, user_role VARCHAR(1)
, is_active BOOLEAN
, created_dt DATE DEFAULT CURRENT_DATE
);


DROP SEQUENCE IF EXISTS
	users_user_id_seq;


CREATE SEQUENCE
	users_user_id_seq;


ALTER TABLE
	users
ALTER COLUMN
	user_id
SET DEFAULT
	nextval('users_user_id_seq'),
ALTER COLUMN
	user_email_validated
SET DEFAULT
	FALSE,
ALTER COLUMN
	is_active
SET DEFAULT
	FALSE,
ALTER COLUMN
	user_role
SET DATA TYPE
	CHAR(1),
ALTER COLUMN
	user_role
SET DEFAULT
	'U',
ADD COLUMN
	last_updated_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP;


SELECT
	table_catalog
  , table_name
  , column_name
  , data_type
  , character_maximum_length
  , column_default
  , is_nullable
  , ordinal_position
FROM
	information_schema.columns 
WHERE
	table_name = 'users'
ORDER BY
	ordinal_position;


SELECT
	*
FROM
	information_schema.sequences 
WHERE
	sequence_name ~ 'users';