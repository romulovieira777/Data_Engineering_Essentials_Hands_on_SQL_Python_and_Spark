-- DDL – Data Definition Language
CREATE TABLE users_02
(
  user_id SERIAL PRIMARY KEY
, user_first_name VARCHAR(30) NOT NULL
, user_last_name VARCHAR(30) NOT NULL
, user_email_id VARCHAR(50) NOT NULL
, user_email_validated BOOLEAN DEFAULT FALSE
, user_password VARCHAR(200)
, user_role VARCHAR(1) NOT NULL DEFAULT 'U' --U and A
, is_active BOOLEAN DEFAULT FALSE
, created_dt DATE DEFAULT CURRENT_DATE
);


SELECT
	*
FROM
	information_schema.columns
WHERE
	table_name = 'users'
ORDER BY
	ordinal_position;


ALTER TABLE
	users_02
ADD
	last_updated_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP;


SELECT
	*
FROM
	information_schema.columns
WHERE
	table_name = 'users'
ORDER BY
	ordinal_position;


ALTER TABLE
	users_02 
ADD CHECK
	(user_role IN ('A', 'U'));


ALTER TABLE
	users_02 
ADD UNIQUE
	(user_email_id);