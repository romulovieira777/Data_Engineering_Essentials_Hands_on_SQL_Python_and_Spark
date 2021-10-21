-- Merging or Upserting Data
DROP TABLE IF EXISTS
    customer_order_metrics_dly;


CREATE TABLE customer_order_metrics_dly
(
    customer_id INT
  , order_date DATE
  , order_count INT
  , order_revenue FLOAT
);


ALTER TABLE
    customer_order_metrics_dly
ADD PRIMARY KEY
    (customer_id, order_date);


INSERT INTO
    customer_order_metrics_dly
SELECT
    o.order_customer_id
  , o.order_date
  , COUNT(1) order_count
  , NULL
FROM
    orders o 
INNER JOIN
    order_items oi
ON
    o.order_id = oi.order_item_order_id
WHERE
    o.order_date BETWEEN '2013-08-01' AND '2013-08-31'
GROUP BY
    o.order_customer_id
  , o.order_date;


UPDATE
    customer_order_metrics_dly comd
SET 
    (order_count, order_revenue) = (
        SELECT
            COUNT(1)
          , ROUND(SUM(oi.order_item_subtotal)::NUMERIC, 2)
        FROM
            orders o 
        INNER JOIN
            order_items oi
        ON
            o.order_id = oi.order_item_order_id
        WHERE
            o.order_date BETWEEN '2013-08-01' AND '2013-10-31'
        AND
            o.order_customer_id = comd.customer_id
        AND
            o.order_date = comd.order_date
        GROUP BY
            o.order_customer_id
          , o.order_date
    )
WHERE
    comd.order_date BETWEEN '2013-08-01' AND '2013-10-31';


SELECT
    *
FROM
    customer_order_metrics_dly
ORDER BY
    order_date
  , customer_id
LIMIT
    10;


SELECT
    TO_CHAR(order_date, 'yyyy-MM')
  , COUNT(1)
FROM
    customer_order_metrics_dly
GROUP BY
    to_char(order_date, 'yyyy-MM')
LIMIT
    10;


INSERT INTO
    customer_order_metrics_dly
SELECT
    o.order_customer_id AS customer_id
  , o.order_date
  , COUNT(1) order_count
  , ROUND(SUM(order_item_subtotal)::NUMERIC, 2)
FROM
    orders o 
INNER JOIN
    order_items oi
ON
    o.order_id = oi.order_item_order_id
WHERE
    o.order_date BETWEEN '2013-08-01' AND '2013-10-31'
    AND NOT EXISTS (
        SELECT
            1
        FROM
            customer_order_metrics_dly codm
        WHERE
            o.order_customer_id = codm.customer_id
        AND
            o.order_date = codm.order_date
    )
GROUP BY
    o.order_customer_id
  , o.order_date;


SELECT
    *
FROM
    customer_order_metrics_dly
WHERE
    order_date::varchar ~ '2013-09'
ORDER BY
    order_date, customer_id
LIMIT
    10;


SELECT
    TO_CHAR(order_date, 'yyyy-MM')
  , COUNT(1)
FROM
    customer_order_metrics_dly
GROUP BY
    TO_CHAR(order_date, 'yyyy-MM')
LIMIT
    10;


TRUNCATE TABLE
    customer_order_metrics_dly;


INSERT INTO
    customer_order_metrics_dly
SELECT
    o.order_customer_id
  , o.order_date
  , COUNT(1) order_count
  , NULL
FROM
    orders o 
INNER JOIN
    order_items oi
ON
    o.order_id = oi.order_item_order_id
WHERE
    o.order_date BETWEEN '2013-08-01' AND '2013-08-31'
GROUP BY
    o.order_customer_id
  , o.order_date;


ALTER TABLE
    customer_order_metrics_dly
DROP CONSTRAINT
    customer_order_metrics_dly_pkey;


ALTER TABLE
    customer_order_metrics_dly
ADD PRIMARY KEY
    (customer_id, order_date);


INSERT INTO
    customer_order_metrics_dly
SELECT
    o.order_customer_id
  , o.order_date
  , COUNT(1) order_count
  , ROUND(SUM(order_item_subtotal)::NUMERIC, 2) AS order_revenue
FROM
    orders o 
INNER JOIN
    order_items oi
ON
    o.order_id = oi.order_item_order_id
WHERE
    o.order_date BETWEEN '2013-08-01' AND '2013-10-31'
GROUP BY
    o.order_customer_id
  , o.order_date
ON CONFLICT (customer_id, order_date) DO UPDATE SET
    order_count = EXCLUDED.order_count,
    order_revenue = EXCLUDED.order_revenue;


SELECT
    *
FROM
    customer_order_metrics_dly
WHERE
    order_date::VARCHAR ~ '2013-09'
ORDER BY
    order_date
  , customer_id
LIMIT
    10;


SELECT
    TO_CHAR(order_date, 'yyyy-MM')
  , COUNT(1)
FROM
    customer_order_metrics_dly
GROUP BY
    TO_CHAR(order_date, 'yyyy-MM')
LIMIT
    10;