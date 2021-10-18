-- Usage Scenarios
DROP TABLE IF EXISTS
    users_mthly;


CREATE TABLE users_mthly (
    user_id SERIAL
  , user_first_name VARCHAR(30) NOT NULL
  , user_last_name VARCHAR(30) NOT NULL
  , user_email_id VARCHAR(50) NOT NULL
  , user_email_validated BOOLEAN DEFAULT FALSE
  , user_password VARCHAR(200)
  , user_role VARCHAR(1) NOT NULL DEFAULT 'U' --U and A
  , is_active BOOLEAN DEFAULT FALSE
  , created_dt DATE DEFAULT CURRENT_DATE
  , created_mnth INT
  , last_updated_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  , PRIMARY KEY (created_mnth, user_id)
) PARTITION BY LIST(created_mnth);


CREATE TABLE
    users_mthly_201601
PARTITION OF
    users_mthly
FOR VALUES IN (201601);


CREATE TABLE
    users_mthly_201602
PARTITION OF
    users_mthly
FOR VALUES IN (201602);


DROP TABLE IF EXISTS
    users_mthly;


CREATE TABLE users_mthly (
    user_id SERIAL
  , user_first_name VARCHAR(30) NOT NULL
  , user_last_name VARCHAR(30) NOT NULL
  , user_email_id VARCHAR(50) NOT NULL
  , user_email_validated BOOLEAN DEFAULT FALSE
  , user_password VARCHAR(200)
  , user_role VARCHAR(1) NOT NULL DEFAULT 'U' --U and A
  , is_active BOOLEAN DEFAULT FALSE
  , created_dt DATE DEFAULT CURRENT_DATE
  , last_updated_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  , PRIMARY KEY (created_dt, user_id)
) PARTITION BY RANGE(created_dt);


CREATE TABLE
    users_mthly_201601
PARTITION OF
    users_mthly
FOR VALUES FROM ('2016-01-01') TO ('2016-01-31');


CREATE TABLE
    users_mthly_201602
PARTITION OF
    users_mthly
FOR VALUES FROM ('2016-02-01') TO ('2016-02-29');
