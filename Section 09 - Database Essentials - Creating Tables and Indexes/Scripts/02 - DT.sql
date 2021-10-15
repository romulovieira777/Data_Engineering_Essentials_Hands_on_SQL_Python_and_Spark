CREATE TABLE users_01
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