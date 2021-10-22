-- Dml Data Manipulation Language
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


UPDATE
	users
SET
	user_email_validated = true
  , is_active = true;


SELECT
	*
FROM
	users;


UPDATE
	users
SET
	user_role = 'C'
WHERE
	user_id = 1;


UPDATE
	users
SET
	user_role = 'A'
WHERE
	user_id = 1;


SELECT
	*
FROM
	users;


DELETE FROM
	users
WHERE
	user_role = 'U';


SELECT
	*
FROM
	users;