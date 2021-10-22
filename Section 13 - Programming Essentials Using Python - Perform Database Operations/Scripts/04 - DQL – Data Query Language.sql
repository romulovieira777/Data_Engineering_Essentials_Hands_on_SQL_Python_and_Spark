-- DQL – Data Query Language
TRUNCATE TABLE
	users;


INSERT INTO users
(
	user_first_name
  , user_last_name
  , user_email_id
) VALUES (
	'Gordan'
  , 'Bradock'
  , 'gbradock0@barnesandnoble.com'
);


INSERT INTO users
(
	user_first_name
  , user_last_name
  , user_email_id
) VALUES (
	'Tobe'
  , 'Lyness'
  , 'tlyness1@paginegialle.it'
), (
	'Addie'
  , 'Mesias'
  , 'amesias2@twitpic.com'
), (
	'Corene'
  , 'Kohrsen'
  , 'ckohrsen3@buzzfeed.com'
), (
	'Darill'
  , 'Halsall'
  , 'dhalsall4@intel.com'
);


SELECT
	*
FROM
	users;


SELECT
	*
FROM
	users
WHERE
	user_role = 'A'
AND
	created_dt BETWEEN '2020-01-01' AND '2020-03-31';


SELECT
	user_first_name
  , user_last_name
  , user_email_id
  , user_role
FROM
	users
WHERE
	user_role = 'A'
AND
	created_dt BETWEEN '2020-01-01' AND '2020-03-31';


SELECT
	*
FROM
	users
WHER
	 user_role != 'A'
AND
	created_dt BETWEEN '2020-01-01' AND '2020-03-31';


SELECT
	user_role
  , COUNT(1)
FROM
	users
GROUP BY
	user_role
ORDER BY
	user_role;