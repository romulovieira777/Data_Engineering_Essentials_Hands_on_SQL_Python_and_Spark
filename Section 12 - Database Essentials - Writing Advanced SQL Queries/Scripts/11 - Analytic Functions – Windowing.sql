-- Analytic Functions – Windowing
SELECT
    t.*
  , LEAD(order_date) OVER (ORDER BY order_date DESC) AS prior_date
  , LEAD(revenue) OVER (ORDER BY order_date DESC)    AS prior_revenue
  , LAG(order_date) OVER (ORDER BY order_date)       AS lag_prior_date
  , LAG(revenue) OVER (ORDER BY order_date)          AS lag_prior_revenue
FROM
    daily_revenue AS t
ORDER BY
    order_date DESC
LIMIT
    10;


SELECT
    t.*
  , LEAD(order_date, 7) OVER (ORDER BY order_date DESC) AS prior_date
  , LEAD(revenue, 7) OVER (ORDER BY order_date DESC)    AS prior_revenue
FROM
    daily_revenue t
ORDER BY
    order_date DESC
LIMIT
    10;


SELECT
    t.*
  , LEAD(order_date, 7) OVER (ORDER BY order_date DESC) AS prior_date
  , LEAD(revenue, 7) OVER (ORDER BY order_date DESC)    AS prior_revenue
FROM
    daily_revenue t
ORDER BY
    order_date
LIMIT
    10;


SELECT
    t.*
  , LEAD(order_date, 7) OVER (ORDER BY order_date DESC)   AS prior_date
  , LEAD(revenue, 7, 0.0) OVER (ORDER BY order_date DESC) AS prior_revenue
FROM
    daily_revenue t
ORDER BY
    order_date
LIMIT
    10;


SELECT
    *
FROM
    daily_product_revenue 
ORDER BY
    order_date, revenue DESC
LIMIT
    10;


SELECT
    t.*
  , LEAD(order_item_product_id) OVER (
        PARTITION BY order_date 
        ORDER BY revenue DESC
    ) next_product_id,
    LEAD(revenue) OVER (
        PARTITION BY order_date 
        ORDER BY revenue DESC
    ) next_revenue
FROM
    daily_product_revenue t
ORDER BY
    order_date
  , revenue DESC
LIMIT
    30;


SELECT
    t.*
  , FIRST_VALUE(order_item_product_id) OVER (
        PARTITION BY order_date ORDER BY revenue DESC
    ) first_product_id,
    FIRST_VALUE(revenue) OVER (
        PARTITION BY order_date ORDER BY revenue DESC
    ) first_revenue,
    MAX(revenue) OVER (
        PARTITION BY order_date
    ) max_revenue
FROM
    daily_product_revenue t
ORDER BY
    order_date
  , revenue DESC
LIMIT
    10;


SELECT
    t.*
  , LAST_VALUE(order_item_product_id) OVER (
        PARTITION BY order_date ORDER BY revenue    
        ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
    ) last_product_id,
    MAX(revenue) OVER (
        PARTITION BY order_date
    ) last_revenue
FROM
    daily_product_revenue AS t
ORDER BY
    order_date
  , revenue DESC
LIMIT
    30;