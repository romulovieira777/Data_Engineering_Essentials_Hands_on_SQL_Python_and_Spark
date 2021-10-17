-- List Partitioning
CREATE TABLE users
(
    user_id SERIAL PRIMARY KEY
  , user_first_name VARCHAR(30) NOT NULL
  , user_last_name VARCHAR(30) NOT NULL
  , user_email_id VARCHAR(50) NOT NULL
  , user_email_validated BOOLEAN DEFAULT FALSE
  , user_password VARCHAR(200)
  , user_role VARCHAR(1) NOT NULL DEFAULT 'U'
  , is_active BOOLEAN DEFAULT FALSE
  , created_dt DATE DEFAULT CURRENT_DATE
  , last_updated_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


DROP TABLE IF EXISTS
    users_part;


CREATE TABLE users_part
(
    user_id SERIAL
  , user_first_name VARCHAR(30) NOT NULL
  , user_last_name VARCHAR(30) NOT NULL
  , user_email_id VARCHAR(50) NOT NULL
  , user_email_validated BOOLEAN DEFAULT FALSE
  , user_password VARCHAR(200)
  , user_role VARCHAR(1) NOT NULL DEFAULT 'U'
  , is_active BOOLEAN DEFAULT FALSE
  , created_dt DATE DEFAULT CURRENT_DATE
  , last_updated_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  , PRIMARY KEY (user_role, user_id)
) PARTITION BY LIST(user_role);


CREATE INDEX
    users_part_email_id_idx 
ON
    users_part(user_email_id);


INSERT INTO users
(
    user_first_name
  , user_last_name
  , user_email_id
) VALUES (
    'Scott'
  , 'Tiger'
  , 'scott@tiger.com'
), (
    'Donald'
  , 'Duck'
  , 'donald@duck.com'
), (
    'Mickey'
  , 'Mouse'
  , 'mickey@mouse.com'
);   