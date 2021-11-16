SELECT
	*
FROM
	information_schema.tables 
WHERE
	table_catalog = 'itversity_sms_db'
AND
	table_schema = 'public'
LIMIT
	10;


DROP TABLE IF EXISTS
	users CASCADE;


SELECT
	*
FROM
	information_schema.tables 
WHERE
	table_catalog = 'itversity_sms_db'
AND
	table_schema = 'public'
AND
	table_name = 'users'
LIMIT
	10;


CREATE TABLE users 
(
    user_id SERIAL PRIMARY KEY
  , user_first_name VARCHAR(30) NOT NULL
  , user_last_name VARCHAR(30) NOT NULL
  , user_email_id VARCHAR(50) NOT NULL
  , user_email_validated BOOLEAN DEFAULT FALSE
  , user_password VARCHAR(200)
  , user_role VARCHAR(1) NOT NULL DEFAULT 'U' --U and A
  , is_active BOOLEAN DEFAULT FALSE
  , create_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  , last_updated_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


SELECT
	*
FROM
	information_schema.tables 
WHERE
	table_catalog = 'itversity_sms_db'
AND
	table_schema = 'public'
AND
	table_name = 'users'
LIMIT
	10;


SELECT
	*
FROM
	information_schema.columns 
WHERE
	table_name = 'users'
LIMIT
	10;


SELECT
	*
FROM
	users;