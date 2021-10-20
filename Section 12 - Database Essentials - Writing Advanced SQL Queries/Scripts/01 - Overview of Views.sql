-- Overview of Views
CREATE OR REPLACE VIEW
    orders_v AS
SELECT
    *
FROM
    orders;


-- Wrong
CREATE VIEW
    orders_v
AS
SELECT
    *
FROM
    orders;


SELECT
    *
FROM
    information_schema.tables
WHERE
    table_name ~ 'orders';


UPDATE
    orders_v
SET
    order_status = LOWER(order_status);


SELECT
    *
FROM
    orders
LIMIT
    10;


UPDATE
    orders_v
SET
    order_status = UPPER(order_status);


CREATE OR REPLACE VIEW
    order_details_v
AS
SELECT
    *
FROM
    orders o
INNER JOIN
    order_items oi
ON
    o.order_id = oi.order_item_order_id;


SELECT
    *
FROM
    order_details_v
LIMIT
    10;


SELECT 
    COUNT(1)
FROM
    order_details_v;


SELECT
    order_date
  , order_item_product_id
  , ROUND(SUM(order_item_subtotal)::NUMERIC, 2) AS Revenue
FROM
    order_details_v 
GROUP BY
    order_date
  , order_item_product_id
ORDER BY
    order_date
  , revenue DESC
LIMIT
    10;


SELECT
    *
FROM
    order_details_v
WHERE
    order_id = 2;


-- Wrong
UPDATE
    order_details_v
SET
    order_status = 'pending_payment'
WHERE
    order_id = 2;