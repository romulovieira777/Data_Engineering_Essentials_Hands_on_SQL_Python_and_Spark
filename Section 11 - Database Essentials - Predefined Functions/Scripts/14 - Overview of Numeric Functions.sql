-- Overview of Numeric Functions
SELECT
    ABS(-10.5)
  , ABS(10);


SELECT
    AVG(order_item_subtotal) AS Order_Revenue_Avg
FROM
    order_items
WHERE
    order_item_order_id = 2;


SELECT
    order_item_order_id
  , SUM(order_item_subtotal) AS Order_Revenue_Sum
FROM
    order_items
GROUP BY
    order_item_order_id
ORDER BY
    order_item_order_id
LIMIT
    10;


SELECT
    ROUND(10.58) rnd
  , FLOOR(10.58) flr
  , CEIL(10.58) cl;


SELECT
    ROUND(10.48, 1) rnd
  , FLOOR(10.48) flr
  , CEIL(10.48) cl;


SELECT
    ROUND(AVG(order_item_subtotal)::NUMERIC, 2) AS Order_Revenue_Avg 
FROM
    order_items
WHERE
    order_item_order_id = 2;


SELECT
    order_item_order_id
  , ROUND(SUM(order_item_subtotal)::NUMERIC, 2) AS order_revenue_avg 
FROM
    order_items
GROUP BY
    order_item_order_id
LIMIT
     10;


SELECT
    GREATEST(10, 11, 10.5);


SELECT
    order_item_order_id
  , ROUND(SUM(order_item_subtotal)::NUMERIC, 2) AS order_revenue_sum
  , MIN(order_item_subtotal) 					AS order_item_subtotal_min
  , MAX(order_item_subtotal) 					AS order_item_subtotal_max 
FROM
    order_items
GROUP BY
    order_item_order_id
LIMIT
    10;


SELECT RANDOM();


SELECT
    (RANDOM() * 100)::INT + 1;


SELECT
    POW(2, 2)::INT
  , SQRT(4);