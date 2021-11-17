SELECT
	user_id
  , user_role
FROM
	users
WHERE
	user_id = 1;


UPDATE
	users
SET
	user_role = 'A'
WHERE
	user_id = 1;


SELECT
	user_id
  , user_role
FROM
	users
WHERE
	user_id = 1;