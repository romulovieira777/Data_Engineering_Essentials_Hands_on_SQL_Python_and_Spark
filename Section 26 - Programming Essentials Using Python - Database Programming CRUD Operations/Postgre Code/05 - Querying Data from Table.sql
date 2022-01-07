SELECT
	*
FROM
	users
LIMIT
	5;


SELECT
	*
FROM
	users 
WHERE
	user_id = 5;


SELECT
	user_id
  , user_email_id
  , user_password
FROM
	users
WHERE
	user_password IS NOT NULL;