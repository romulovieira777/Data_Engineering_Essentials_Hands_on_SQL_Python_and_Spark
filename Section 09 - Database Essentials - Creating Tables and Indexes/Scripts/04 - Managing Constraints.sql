-- Managing Constraints
DROP TABLE IF EXISTS
	users;


DROP SEQUENCE IF EXISTS
	users_user_id_seq;


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


CREATE SEQUENCE
	users_user_id_seq;


ALTER TABLE
	users
ALTER COLUMN
	user_id
SET DEFAULT
	nextval('users_user_id_seq');


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
SET DATA TYPE CHAR(1),
ALTER COLUMN
	user_role
SET DEFAULT
	'U';


ALTER TABLE
	users
ADD COLUMN
	last_updated_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP;


ALTER TABLE
	users
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
    table_catalog
  , table_name
  , constraint_type
  , constraint_name 
FROM
	information_schema.table_constraints 
WHERE
	table_name = 'users';


ALTER TABLE
	users
DROP CONSTRAINT
	users_pkey;


SELECT
	table_catalog
  , table_name
  , constraint_type
  , constraint_name 
FROM
	information_schema.table_constraints 
WHERE
	table_name = 'users';


ALTER TABLE
	users
ADD CONSTRAINT
	users_pk PRIMARY KEY (user_id);


SELECT
	table_catalog
  , table_name
  , constraint_type
  , constraint_name 
FROM
	information_schema.table_constraints 
WHERE
	table_name = 'users';


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


ALTER TABLE
	users
ALTER COLUMN
	user_email_validated
SET NOT
	NULL, 
ALTER COLUMN
	user_role
SET NOT
	NULL, 
ALTER COLUMN
	created_dt
SET NOT
	NULL, 
ALTER COLUMN
	last_updated_ts
SET NOT
	NULL;


ALTER TABLE
	users
ADD CHECK
	(user_role IN ('U', 'A') );


SELECT
	table_catalog
  , table_name
  , constraint_type
  , constraint_name 
FROM
 information_schema.table_constraints 
WHERE
 table_name = 'users';


CREATE TABLE user_logins
(
    user_login_id SERIAL PRIMARY KEY
  , user_id INT
  , user_login_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  , user_ip_addr VARCHAR(20)
);


SELECT
	table_catalog
  , table_name
  , constraint_type
  , constraint_name 
FROM
	information_schema.table_constraints 
WHERE
	table_name = 'user_logins';


ALTER TABLE
	user_logins
ADD FOREIGN KEY
	(user_id)
REFERENCES
	users(user_id);


SELECT
	table_catalog
  , table_name
  , constraint_type
  , constraint_name 
FROM
	information_schema.table_constraints 
WHERE
	table_name = 'user_logins';

-- WRONG
DROP TABLE
	users;


DROP TABLE
	users CASCADE;


SELECT
	table_catalog
  , table_name
  , constraint_type
  , constraint_name 
FROM
	information_schema.table_constraints 
WHERE
	table_name = 'user_logins';


DROP TABLE IF EXISTS
	user_logins;