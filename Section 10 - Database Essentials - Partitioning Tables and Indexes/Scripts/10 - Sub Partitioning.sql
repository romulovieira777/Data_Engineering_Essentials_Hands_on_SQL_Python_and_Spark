-- Sub Partitioning
DROP TABLE IF EXISTS
    users_qtly;


CREATE TABLE users_qtly (
    user_id SERIAL
  , user_first_name VARCHAR(30) NOT NULL
  , user_last_name VARCHAR(30) NOT NULL
  , user_email_id VARCHAR(50) NOT NULL
  , user_email_validated BOOLEAN DEFAULT FALSE
  , user_password VARCHAR(200)
  , user_role VARCHAR(1) NOT NULL DEFAULT 'U' --U and A
  , is_active BOOLEAN DEFAULT FALSE
  , created_dt DATE DEFAULT CURRENT_DATE
  , created_year INT
  , created_mnth INT
  , last_updated_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  , PRIMARY KEY (created_year, created_mnth, user_id)
) PARTITION BY LIST(created_year);


CREATE TABLE
    users_qtly_2016
PARTITION OF
    users_qtly
FOR VALUES IN (2016)
PARTITION BY LIST
    (created_mnth);


CREATE TABLE
    users_qtly_2016q1
PARTITION OF
    users_qtly_2016
FOR VALUES IN (1, 2, 3);


CREATE TABLE
    users_qtly_2016q2
PARTITION OF
    users_qtly_2016
FOR VALUES IN (4, 5, 6);


DROP TABLE IF EXISTS
    users_qtly;


CREATE TABLE users_qtly (
    user_id SERIAL
  , user_first_name VARCHAR(30) NOT NULL
  , user_last_name VARCHAR(30) NOT NULL
  , user_email_id VARCHAR(50) NOT NULL
  , user_email_validated BOOLEAN DEFAULT FALSE
  , user_password VARCHAR(200)
  , user_role VARCHAR(1) NOT NULL DEFAULT 'U' --U and A
  , is_active BOOLEAN DEFAULT FALSE
  , created_dt DATE DEFAULT CURRENT_DATE
  , created_year INT
  , created_mnth INT
  , last_updated_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  , PRIMARY KEY (created_year, created_mnth, user_id)
) PARTITION BY LIST(created_year);


CREATE TABLE
    users_qtly_2016
PARTITION OF
    users_qtly
FOR VALUES IN (2016)
PARTITION BY RANGE
    (created_mnth);


CREATE TABLE
    users_qtly_2016q1
PARTITION OF
    users_qtly_2016
FOR VALUES FROM (1) TO (3);


CREATE TABLE
    users_qtly_2016q2
PARTITION OF
    users_qtly_2016
FOR VALUES FROM (4) TO (6);