SELECT
	user_id
  , user_password 
FROM
	users;


DELETE FROM
	users
WHERE
	user_password IS NULL OR user_id = 4;


SELECT
	user_id
  , user_password 
FROM
	users;