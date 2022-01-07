INSERT INTO users 
(
    user_first_name
  , user_last_name
  , user_email_id
  , user_password
  , user_role
  , is_active
) VALUES (
    'Gordan'
  , 'Bradock'
  , 'gbradock0@barnesandnoble.com'
  , 'h9LAz7p7ub'
  , 'U'
  , True
);


SELECT
    *
FROM
    users;