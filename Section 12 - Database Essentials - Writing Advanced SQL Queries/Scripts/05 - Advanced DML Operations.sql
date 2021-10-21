-- Advanced DML Operations
DROP TABLE IF EXISTS
    customer_order_metrics_mthly;


CREATE TABLE customer_order_metrics_mthly
(
    customer_id INT
  , order_month CHAR(7)
  , order_count INT
  , order_revenue FLOAT
);


ALTER TABLE
    customer_order_metrics_mthly
ADD PRIMARY KEY
    (order_month, customer_id);


SELECT
    o.order_customer_id
  , TO_CHAR(o.order_date, 'yyyy-MM') AS order_month
  , COUNT(1) AS order_count
  , ROUND(SUM(order_item_subtotal)::numeric, 2) AS order_revenue
FROM
    orders o 
INNER JOIN
    order_items oi
ON
    o.order_id = oi.order_item_order_id
GROUP BY
    o.order_customer_id
  , TO_CHAR(o.order_date, 'yyyy-MM')
ORDER BY
    order_month
  , order_count DESC
LIMIT
    10;


SELECT
    COUNT(1)
FROM
    orders o 
INNER JOIN
    order_items oi
ON
    o.order_id = oi.order_item_order_id;


INSERT INTO
    customer_order_metrics_mthly
SELECT
    o.order_customer_id
  , TO_CHAR(o.order_date, 'yyyy-MM') AS order_month
  , COUNT(1) order_count
  , NULL
FROM
    orders o 
INNER JOIN
    order_items oi
ON
    o.order_id = oi.order_item_order_id
GROUP BY
    o.order_customer_id
  , TO_CHAR(o.order_date, 'yyyy-MM');


SELECT
    *
FROM
    customer_order_metrics_mthly
ORDER BY
    order_month
  , customer_id
LIMIT
    10;


UPDATE
    customer_order_metrics_mthly comd
SET 
    (order_count, order_revenue) = (
        SELECT
            COUNT(1)
          , ROUND(SUM(order_item_subtotal)::NUMERIC, 2)
        FROM
            orders o 
        INNER JOIN
            order_items oi
        ON
            o.order_id = oi.order_item_order_id
        WHERE
            o.order_customer_id = comd.customer_id
        AND
            TO_CHAR(o.order_date, 'yyyy-MM') = comd.order_month
        AND
            TO_CHAR(o.order_date, 'yyyy-MM') = '2013-08'
        AND
            comd.order_month = '2013-08'
        GROUP BY
            o.order_customer_id
          , TO_CHAR(o.order_date, 'yyyy-MM')
    )
WHERE EXISTS (
    SELECT
		1
	FROM
		orders o
    WHERE
		o.order_customer_id = comd.customer_id
    AND 
		TO_CHAR(o.order_date, 'yyyy-MM') = comd.order_month
    AND
		TO_CHAR(o.order_date, 'yyyy-MM') = '2013-08'
) AND
		comd.order_month = '2013-08';


SELECT
    *
FROM
    customer_order_metrics_mthly
WHERE
    order_month = '2013-08'
ORDER BY
    order_month
  , customer_id
LIMIT
    10;


DROP TABLE IF EXISTS
    customers_backup;


CREATE TABLE
    customers_backup
AS
SELECT
    *
FROM
    customers;


SELECT
    COUNT(1)
FROM
    customers_backup c
LEFT OUTER JOIN
    orders o
ON
    c.customer_id = o.order_customer_id
WHERE
    o.order_customer_id IS NULL;


SELECT
    COUNT(1)
FROM
    customers_backup c
WHERE NOT EXISTS (
    SELECT
        1
    FROM
        orders o
    WHERE
        c.customer_id = o.order_customer_id
);


DELETE FROM
    customers_backup c
WHERE NOT EXISTS (
    SELECT
        1
    FROM
        orders o
    WHERE
        c.customer_id = o.order_customer_id
);


SELECT
    COUNT(1)
FROM
    customers_backup;


DELETE FROM
    customers_backup c
WHERE
    customer_id NOT IN (
        SELECT
            order_customer_id
        FROM
            orders o
);