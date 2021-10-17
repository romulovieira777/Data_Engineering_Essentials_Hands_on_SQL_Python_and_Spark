-- Hash Partitioning
DROP TABLE IF EXISTS
    users_hash_part;


CREATE TABLE users_hash_part
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
  , PRIMARY KEY (user_id)
) PARTITION BY HASH(user_id);
