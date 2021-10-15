SELECT
	*
FROM
	orders
LIMIT
	10;


SELECT
	*
FROM
	orders
ORDER BY
	order_customer_id
LIMIT
	10;


SELECT
	*
FROM
	orders
ORDER BY
	order_customer_id ASC
LIMIT
	10;


SELECT
	*
FROM
	orders
ORDER BY
	order_customer_id
  , order_date
LIMIT
	10;


SELECT
	*
FROM
	orders
ORDER BY
	order_customer_id
  , order_date DESC
LIMIT
	10;


SELECT
	o.order_date
  , oi.order_item_product_id
  , ROUND(SUM(oi.order_item_subtotal::numeric), 2) AS revenue
FROM
	orders o
INNER JOIN
	order_items oi
ON
	o.order_id = oi.order_item_order_id
WHERE
	o.order_status IN ('COMPLETE', 'CLOSED')
GROUP BY
	o.order_date
  , oi.order_item_product_id
ORDER BY
	o.order_date
  , revenue DESC
LIMIT
	25;


SELECT
	o.order_date
  , oi.order_item_product_id
  , ROUND(SUM(oi.order_item_subtotal::numeric), 2) AS revenue
FROM
	orders o
INNER JOIN
	order_items oi
ON
	o.order_id = oi.order_item_order_id
WHERE
	o.order_status IN ('COMPLETE', 'CLOSED')
GROUP BY
	o.order_date
  , oi.order_item_product_id
HAVING
	ROUND(SUM(oi.order_item_subtotal::numeric), 2) >= 1000
ORDER BY
	o.order_date
  , revenue DESC
LIMIT
	10;


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
  , user_country VARCHAR(2)
  , is_active BOOLEAN DEFAULT FALSE
  , create_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  , last_updated_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO users
(
	user_first_name
  , user_last_name
  , user_email_id
  , user_country
) VALUES (
	'Donald'
  , 'Duck'
  , 'donald@duck.com'
  , 'IN'
);


INSERT INTO users
(
	user_first_name
  , user_last_name
  , user_email_id
  , user_role
  , is_active
  , user_countr
) VALUES (
	'Mickey'
  , 'Mouse'
  , 'mickey@mouse.com'
  , 'U'
  , true
  , 'US'
);


INSERT INTO users 
(
	user_first_name
  , user_last_name
  , user_email_id
  , user_password
  , user_role
  , is_active, user_country
) VALUES (
	'Gordan'
  , 'Bradock'
  , 'gbradock0@barnesandnoble.com'
  , 'h9LAz7p7ub'
  , 'U'
  , true
  , 'CA'
), (
	'Tobe'
  , 'Lyness'
  , 'tlyness1@paginegialle.it'
  , 'oEofndp'
  , 'U'
  , true
  , 'FR'
), (
	'Addie'
  , 'Mesias'
  , 'amesias2@twitpic.com'
  , 'ih7Y69u56'
  , 'U'
  , true
  , 'AU'
);


SELECT
	*
FROM
	users
ORDER BY
	user_country;


SELECT
	user_id
  , user_first_name
  , user_last_name
  , user_email_id
  , user_country
FROM
	users
ORDER BY 
    CASE WHEN user_country = 'US' THEN 0
         ELSE 1
    END, user_country;