-- Managing Partitions - Range
CREATE TABLE
    users_range_part_default
PARTITION OF
    users_range_part DEFAULT;


CREATE TABLE
    users_range_part_2016
PARTITION OF
    users_range_part
FOR VALUES FROM
    ('2016-01-01') TO ('2016-12-31');


-- This is how we can create partitions for the years **2017**, **2018**, **2019** et
CREATE TABLE
    users_range_part_2017
PARTITION OF
    users_range_part
FOR VALUES FROM
    ('2016-01-01') TO ('2017-12-31');


CREATE TABLE
    users_range_part_2017
PARTITION OF
    users_range_part
FOR VALUES FROM
    ('2017-01-01') TO ('2017-12-31');


CREATE TABLE
    users_range_part_2018
PARTITION OF
    users_range_part
FOR VALUES FROM
    ('2018-01-01') TO ('2018-12-31');


CREATE TABLE
    users_range_part_2019
PARTITION OF
    users_range_part
FOR VALUES FROM
    ('2019-01-01') TO ('2019-12-31');


CREATE TABLE
    users_range_part_2020
PARTITION OF
    users_range_part
FOR VALUES FROM
    ('2020-01-01') TO ('2020-12-31');


INSERT INTO users
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
    user_first_name
  , user_last_name
  , user_email_id
  , created_dt
FROM
    users_range_part_default;


SELECT
    user_first_name
  , user_last_name
  , user_email_id
  , created_dt
FROM
    users_range_part_2017;


SELECT
    user_first_name
  , user_last_name
  , user_email_id
  , created_dt
FROM
    users_range_part_2018;


SELECT
    user_first_name
  , user_last_name
  , user_email_id
  , created_dt
FROM
    users_range_part_2019;


SELECT
    user_first_name
  , user_last_name
  , user_email_id
  , created_dt
FROM
    users_range_part_2020;