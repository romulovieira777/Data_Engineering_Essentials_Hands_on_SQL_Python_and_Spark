-- Overview of Analytic Functions
DROP TABLE IF EXISTS
    daily_revenue;


CREATE TABLE
    daily_revenue
AS
SELECT
    o.order_date
  , ROUND(SUM(oi.order_item_subtotal)::NUMERIC, 2) AS revenue
FROM orders o JOIN order_items oi
ON
    o.order_id = oi.order_item_order_id
WHERE
    o.order_status IN ('COMPLETE', 'CLOSED')
GROUP BY
    o.order_date;


SELECT
    *
FROM
    daily_revenue
ORDER BY
    order_date
LIMIT
    10;


DROP TABLE IF EXISTS
    daily_product_revenue;


CREATE TABLE
    daily_product_revenue
AS
SELECT
    o.order_date
  , oi.order_item_product_id
  , ROUND(SUM(oi.order_item_subtotal)::numeric, 2) AS revenue
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
  , oi.order_item_product_id;


SELECT
    *
FROM
    daily_product_revenue
ORDER BY
    order_date
  , revenue DESC
LIMIT
    10;