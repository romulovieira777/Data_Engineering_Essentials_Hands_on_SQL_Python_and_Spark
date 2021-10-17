-- Manipulating Data
TRUNCATE TABLE
    users_part;


INSERT INTO users
(
    user_first_name
  , user_last_name
  , user_email_id
  , user_role
) VALUES (
    'Scott'
  , 'Tiger'
  , 'scott@tiger.com'
  , 'U'
), (
    'Donald'
  , 'Duck'
  , 'donald@duck.com'
  , 'U'
), (
    'Mickey'
  , 'Mouse'
  , 'mickey@mouse.com'
  , 'U'
);

SELECT * FROM
    users_part_u;


INSERT INTO users
(
    user_first_name
  , user_last_name
  , user_email_id
  , user_role
) VALUES (
    'Matt'
  , 'Clarke'
  , 'matt@clarke.com'
  , 'A'
);


SELECT
    *
FROM
    users_part;


UPDATE
    users_part
SET
    user_role = 'A'
WHERE
    user_email_id = 'donald@duck.com';


SELECT
    *
FROM
    users_part_a;


DELETE FROM
    users_part
WHERE
    user_email_id = 'donald@duck.com';


DELETE FROM
    users_part_u
WHERE
    user_email_id = 'mickey@mouse.com';


SELECT
    *
FROM
    users_part;