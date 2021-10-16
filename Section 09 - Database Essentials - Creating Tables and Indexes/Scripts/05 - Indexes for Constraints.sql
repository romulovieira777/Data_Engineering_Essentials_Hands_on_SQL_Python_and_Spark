-- Indexes for Constraints
DROP TABLE IF EXISTS
	users;


DROP SEQUENCE IF EXISTS
	users_user_id_seq;


CREATE TABLE users (
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
  , constraint_type
  , constraint_name
FROM
	information_schema.table_constraints
WHERE
	table_name = 'users';


SELECT
	*
FROM
	pg_catalog.pg_indexes
WHERE
	schemaname = 'public'
AND
	tablename = 'users';


CREATE SEQUENCE
	users_user_id_seq;


ALTER TABLE
	users 
ALTER COLUMN
	user_id
SET DEFAULT
	nextval('users_user_id_seq'),
ADD PRIMARY KEY
	(user_id);


SELECT
	table_catalog
  , table_name
  , constraint_type
  , constraint_name
FROM
	information_schema.table_constraints
WHERE
	table_name = 'users';


SELECT
	*
FROM
	pg_catalog.pg_indexes
WHERE
	schemaname = 'public'
AND
	tablename = 'users';


SELECT
	tc.table_catalog
  , tc.table_name
  , tc.constraint_name
  , pi.indexname
FROM
	information_schema.table_constraints tc 
INNER JOIN
	pg_catalog.pg_indexes pi
ON
	tc.constraint_name = pi.indexname
WHERE
	tc.table_schema = 'public'
AND
	tc.table_name = 'users'
AND
	tc.constraint_type = 'PRIMARY KEY';


ALTER TABLE
	users
ADD UNIQUE
	(user_email_id);


SELECT
	table_catalog
  , table_name
  , constraint_type
  , constraint_name
FROM
	information_schema.table_constraints
WHERE
	table_name = 'users';


SELECT
	*
FROM
	pg_catalog.pg_indexes
WHERE
	schemaname = 'public'
AND
	tablename = 'users';


SELECT
	tc.table_catalog
  , tc.table_name
  , tc.constraint_name
  , pi.indexname
FROM
	information_schema.table_constraints tc 
INNER JOIN
	pg_catalog.pg_indexes pi
ON
	tc.constraint_name = pi.indexname
WHERE
	tc.table_schema = 'public'
AND
	tc.table_name = 'users'
AND
	tc.constraint_type = 'UNIQUE';


SELECT
	tc.table_catalog
  , tc.table_name
  , tc.constraint_name
  , pi.indexname
FROM
	information_schema.table_constraints tc 
INNER JOIN
	pg_catalog.pg_indexes pi
ON
	tc.constraint_name = pi.indexname
WHERE
	tc.table_catalog = 'sms_db'
AND
	tc.constraint_type IN ('PRIMARY KEY', 'UNIQUE');


-- WRONG
DROP INDEX
	users_user_email_id_key;