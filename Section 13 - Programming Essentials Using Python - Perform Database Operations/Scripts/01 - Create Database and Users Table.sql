-- Create Database and Users Table
SELECT
	*
FROM
	information_schema.tables
LIMIT
	10;


CREATE TABLE IF NOT EXISTS users
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
, last_updated_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


SELECT
	* 
FROM
	information_schema.tables 
WHERE
	table_name = 'users';


display(result_set);