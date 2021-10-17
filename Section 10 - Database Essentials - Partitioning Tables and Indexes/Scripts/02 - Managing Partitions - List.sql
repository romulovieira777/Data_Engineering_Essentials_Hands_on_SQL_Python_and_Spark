-- Managing Partitions - List
CREATE TABLE
    users_part_default
PARTITION OF
    users_part DEFAULT;


INSERT INTO users
(
    user_first_name
  , user_last_name
  , user_email_id
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


SELECT
    *
FROM
    users_part_default;


CREATE TABLE
    users_part_a 
PARTITION OF
    users_part  
FOR VALUES IN ('A');


UPDATE
    users_part
SET
    user_role = 'A'
WHERE
    user_email_id = 'scott@tiger.com';


SELECT
    *
FROM
    users_part;


SELECT
    *
FROM
    users_part_a;


SELECT
    *
FROM
    users_part_default;


CREATE TABLE
    users_part_u 
PARTITION OF
    users_part  
FOR VALUES IN ('U');


ALTER TABLE
    users_part
DETACH PARTITION
    users_part_default;


CREATE TABLE
    users_part_u 
PARTITION OF
    users_part  
FOR VALUES IN ('U');


SELECT
    *
FROM
    users_part_default;


SELECT
    *
FROM
    users_part_a;


SELECT
    *
FROM
    users_part_u;


DROP TABLE
    users_part_default;


CREATE TABLE
    users_part_default
PARTITION OF
    users_part DEFAULT;