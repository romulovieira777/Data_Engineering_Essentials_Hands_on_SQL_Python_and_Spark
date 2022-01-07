INSERT INTO users 
(
    user_first_name
  , user_last_name
  , user_email_id
) VALUES (
    'Scott'
  , 'Tiger'
  , 'scott@tiger.com'
);


SELECT
    *
FROM
    users;


INSERT INTO users 
(
    user_first_name
  , user_last_name
  , user_email_id
) VALUES (
    'Donald'
  , 'Duck'
  , 'donald@duck.com'
);


SELECT
    *
FROM
    users;


INSERT INTO users 
(
    user_first_name
  , user_last_name
  , user_email_id
  , user_role
  , is_active
) VALUES (
    'Mickey'
  , 'Mouse'
  , 'mickey@mouse.com'
  , 'U'
  , True
);


SELECT
    *
FROM
    users;


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
), (
    'Tobe'
  , 'Lyness'
  , 'tlyness1@paginegialle.it'
  , 'oEofndp'
  , 'U'
  , True
), (
    'Addie'
  , 'Mesias'
  , 'amesias2@twitpic.com'
  , 'ih7Y69u56'
  , 'U'
  , True
);


SELECT
    *
FROM
    users;