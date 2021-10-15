ALTER TABLE
	users
ADD COLUMN
	last_updated_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP;


COMMENT ON TABLE
	users
IS
	'Stores all user details';


COMMENT ON COLUMN
	users.user_id
IS
	'Surrogate Key';


COMMENT ON COLUMN
	users.user_first_name
IS
	'User First Name';


COMMENT ON COLUMN
	users.user_role
IS
	'U for user A for admin';


SELECT
	*
FROM
	information_schema.tables 
WHERE
	table_name = 'users';


SELECT
	*
FROM
	information_schema.columns 
WHERE
	table_name = 'users'
ORDER BY
	ordinal_position;