-- Using CASE and WHEN
DROP TABLE IF EXISTS
    sales;


CREATE TABLE IF NOT EXISTS sales
(
    sales_person_id INT,
    sales_amount FLOAT,
    commission_pct INT
);


INSERT INTO
    sales
VALUES (
    1
  , 1000
  , 10
), (
    2
  , 1500
  , 8
), (
    3
  , 500
  , NULL
), (
    4
  , 800
  , 5
), (
    5
  , 250
  , NULL
);


SELECT
    *
FROM
    sales;


SELECT
    s.*
  , CASE
        WHEN commission_pct IS NOT NULL THEN ROUND((sales_amount * commission_pct / 100)::NUMERIC, 2)
        ELSE 0
    END AS commission_amount
FROM
    sales s;


SELECT
    DISTINCT order_status
FROM
    orders
ORDER BY
    order_status;


SELECT
    o.*
  , CASE
        WHEN order_status IN ('COMPLETE', 'CLOSED') THEN 'COMPLETED'
    END AS updated_order_status
FROM
    orders o
LIMIT
    10;


SELECT
    o.*
  , CASE
        WHEN order_status IN ('COMPLETE', 'CLOSED') THEN 'COMPLETED'
        ELSE order_status
    END AS updated_order_status
FROM
    orders o
LIMIT
    10;


SELECT
    o.*
  , CASE 
        WHEN order_status IN ('COMPLETE', 'CLOSED') THEN 'COMPLETED'
        WHEN order_status ~ 'PENDING' THEN 'PENDING'
        ELSE 'OTHER'
    END AS updated_order_status
FROM
    orders o
LIMIT
    10;


SELECT
    o.*
  , CASE 
        WHEN order_status IN ('COMPLETE', 'CLOSED') THEN 'COMPLETED'
        WHEN order_status LIKE '%PENDING%' OR order_status IN ('PROCESSING', 'PAYMENT_REVIEW') THEN 'PENDING'
        ELSE 'OTHER'
    END AS updated_order_status
FROM
    orders o
LIMIT
    10;


SELECT
    DISTINCT order_status
  , CASE 
        WHEN order_status IN ('COMPLETE', 'CLOSED') THEN 'COMPLETED'
        WHEN order_status LIKE '%PENDING%' OR order_status IN ('PROCESSING', 'PAYMENT_REVIEW') THEN 'PENDING'
        ELSE 'OTHER'
    END AS updated_order_status
FROM
    orders
ORDER BY
    updated_order_status
LIMIT
    10;
