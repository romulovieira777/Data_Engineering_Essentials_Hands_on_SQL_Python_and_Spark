-- Managing Partitions - Hash
CREATE TABLE
    users_hash_part_default
PARTITION OF
    users_hash_part DEFAULT;


CREATE TABLE
    users_hash_part_0_of_8
PARTITION OF
    users_hash_part
FOR VALUES WITH
    (modulus 8, remainder 0);


CREATE TABLE
    users_hash_part_1_of_8
PARTITION OF
    users_hash_part
FOR VALUES WITH
    (modulus 8, remainder 1);


CREATE TABLE
    users_hash_part_2_of_8
PARTITION OF
    users_hash_part
FOR VALUES WITH
    (modulus 8, remainder 2);


CREATE TABLE
    users_hash_part_3_of_8
PARTITION OF
    users_hash_part
FOR VALUES WITH
    (modulus 8, remainder 3);


CREATE TABLE
    users_hash_part_4_of_8
PARTITION OF
    users_hash_part
FOR VALUES WITH
    (modulus 8, remainder 4);


CREATE TABLE
    users_hash_part_5_of_8
PARTITION OF
    users_hash_part
FOR VALUES WITH
    (modulus 8, remainder 5);


CREATE TABLE
    users_hash_part_6_of_8
PARTITION OF
    users_hash_part
FOR VALUES WITH
    (modulus 8, remainder 6);


CREATE TABLE
    users_hash_part_7_of_8
PARTITION OF
    users_hash_part
FOR VALUES WITH
    (modulus 8, remainder 7);


INSERT INTO users_hash_part
(
    user_first_name
  , user_last_name
  , user_email_id
  , created_dt
) VALUES (
    'Scott'
  , 'Tiger'
  , 'scott@tiger.com'
  , '2018-10-01'
), (
    'Donald'
  , 'Duck'
  , 'donald@duck.com'
  , '2019-02-10'
), (
    'Mickey'
  , 'Mouse'
  , 'mickey@mouse.com'
  , '2017-06-22'
);


SELECT
    *
FROM
    users_hash_part;


SELECT
    *
FROM
    users_hash_part_0_of_8;

    
SELECT
    *
FROM
    users_hash_part_1_of_8;

    
SELECT
    *
FROM
    users_hash_part_2_of_8;

    
SELECT
    *
FROM
    users_hash_part_3_of_8;

    
SELECT
    *
FROM
    users_hash_part_4_of_8;

    
SELECT
    *
FROM
    users_hash_part_5_of_8;

    
SELECT
    *
FROM
    users_hash_part_6_of_8;

    
SELECT
    *
FROM
    users_hash_part_7_of_8;