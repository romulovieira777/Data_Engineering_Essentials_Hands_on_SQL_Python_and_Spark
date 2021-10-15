SELECT
	*
FROM
	orders 
WHERE
	order_status = 'COMPLETE' 
LIMIT
	10;


SELECT
	COUNT(1)
FROM
	orders;


SELECT
	COUNT(1) 
FROM
	orders
WHERE
	order_status = 'COMPLETE';


SELECT
	DISTINCT order_status
FROM
	orders
WHERE
	order_status = 'COMPLETE';


SELECT
	DISTINCT order_status
FROM
	orders;


SELECT
	*
FROM
	orders 
WHERE
	order_status IN ('COMPLETE', 'CLOSED') 
LIMIT
	10;


SELECT
	COUNT(1)
FROM
	orders 
WHERE
	order_status IN ('COMPLETE', 'CLOSED');


SELECT
	COUNT(1)
FROM
	orders 
WHERE
	order_status = 'COMPLETE' 
OR
	order_status = 'CLOSED';


SELECT
	*
FROM
	orders
WHERE
	order_date = '2014-01-01'
LIMIT
	3;

-- WRONG
SELECT
	*
FROM
	orders
WHERE
	order_date LIKE '2014-01%'
LIMIT
	3;


SELECT
	*
FROM
	orders 
WHERE
	order_status IN ('COMPLETE', 'CLOSED')
AND
	TO_CHAR(order_date, 'yyyy-MM-dd') LIKE '2014-01%'
LIMIT
	10;


SELECT
	COUNT(1)
FROM
	orders 
WHERE
	order_status IN ('COMPLETE', 'CLOSED')
AND
	TO_CHAR(order_date, 'yyyy-MM-dd') LIKE '2014-01%';


SELECT
	*
FROM
	orders 
WHERE
	order_status IN ('COMPLETE', 'CLOSED')
AND
	TO_CHAR(order_date, 'yyyy-MM') = '2014-01'
LIMIT
	10;


SELECT
	COUNT(1)
FROM
	orders 
WHERE
	order_status IN ('COMPLETE', 'CLOSED')
AND
	TO_CHAR(order_date, 'yyyy-MM') = '2014-01';


SELECT
	COUNT(1)
FROM
	orders 
WHERE
	order_status IN ('COMPLETE', 'CLOSED')
AND
	TO_CHAR(order_date, 'yyyy-MM-dd') ~ '2014-01';


SELECT
	COUNT(1)
  , MIN(order_date)
  , MAX(order_date)
  , COUNT(DISTINCT order_date) 
FROM
	orders 
WHERE
	order_status IN ('COMPLETE', 'CLOSED')
AND
	order_date BETWEEN '2014-01-01' AND '2014-03-31';


SELECT
	DISTINCT order_date
FROM
	orders
WHERE
	TO_CHAR(order_date, 'yyyy-MM') LIKE '2014-03%'
ORDER BY
	order_date;


DROP TABLE IF EXISTS
	users;


CREATE TABLE users 
(
    user_id SERIAL PRIMARY KEY
  , user_first_name VARCHAR(30) NOT NULL
  , user_last_name VARCHAR(30) NOT NULL
  , user_email_id VARCHAR(50) NOT NULL
  , user_email_validated BOOLEAN DEFAULT FALSE
  , user_password VARCHAR(200)
  , user_role VARCHAR(1) NOT NULL DEFAULT 'U' --U and A
  , is_active BOOLEAN DEFAULT FALSE
  , create_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  , last_updated_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


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
  , true
);


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
  , true
), (
	'Tobe'
  , 'Lyness'
  , 'tlyness1@paginegialle.it'
  , 'oEofndp'
  , 'U'
  , true
), (
	'Addie'
  , 'Mesias'
  , 'amesias2@twitpic.com'
  , 'ih7Y69u56'
  , 'U'
  , true
);


SELECT
	*
FROM
	users;


SELECT
	*
FROM
	users
WHERE
	user_password = NULL;


SELECT
	*
FROM
	users
WHERE
	user_password IS NULL;


SELECT
	*
FROM
	users
WHERE
	user_password IS NOT NULL;