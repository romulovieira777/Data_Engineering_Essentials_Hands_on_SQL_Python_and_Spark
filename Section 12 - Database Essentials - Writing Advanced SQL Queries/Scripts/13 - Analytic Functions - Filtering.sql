-- Analytic Functions - Filtering
SELECT
    o.order_date
  , ROUND(SUM(oi.order_item_subtotal)::NUMERIC, 2) AS revenue
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
ORDER BY
    o.order_date
LIMIT
    10;


SELECT
    o.order_date
  , ROUND(SUM(oi.order_item_subtotal)::NUMERIC, 2) AS revenue
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
HAVING
    ROUND(SUM(oi.order_item_subtotal)::NUMERIC, 2) >= 50000
ORDER BY
    order_date
LIMIT
    10;



-- Wrong
SELECT
    o.order_date
  , ROUND(SUM(oi.order_item_subtotal)::NUMERIC, 2) AS revenue
FROM
    orders o
INNER JOIN
    order_items oi
ON
    o.order_id = oi.order_item_order_id
WHERE
    o.order_status IN ('COMPLETE', 'CLOSED')
AND
    revenue >= 50000
GROUP BY
    o.order_date
ORDER BY
    order_date
LIMIT
    10;


-- Wrong
SELECT
    o.order_date
  , ROUND(SUM(oi.order_item_subtotal)::NUMERIC, 2) AS revenue
FROM
    orders o
INNER JOIN
    order_items oi
ON
    o.order_id = oi.order_item_order_id
WHERE
    o.order_status IN ('COMPLETE', 'CLOSED')
AND
    ROUND(SUM(oi.order_item_subtotal)::NUMERIC, 2) >= 50000
GROUP BY
    o.order_date
ORDER BY
    order_date
LIMIT
    10;


SELECT
    o.order_date
  , ROUND(SUM(oi.order_item_subtotal)::NUMERIC, 2) AS revenue
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
ORDER BY
    order_date
  , revenue DESC
LIMIT
    10;


SELECT
    o.order_date
  , ROUND(SUM(oi.order_item_subtotal)::NUMERIC, 2) AS revenue
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
HAVING 
    ROUND(SUM(oi.order_item_subtotal)::NUMERIC, 2) >= 50000
ORDER BY
    order_date
LIMIT
    10;


-- Wrong
SELECT
    t.*
  , dense_rank() OVER (
  PARTITION BY order_date
  ORDER BY revenue DESC
) AS drnk
FROM
    daily_product_revenue t
WHERE
    drnk <= 5;


SELECT
    *
FROM (
    SELECT current_date) AS q;


SELECT
    *
FROM (
  SELECT
    order_date
  , COUNT(1) AS order_count
  FROM
    orders
  GROUP BY
    order_date
) AS q
ORDER BY
    order_date
LIMIT
    10;


SELECT
    *
FROM (
  SELECT
    order_date
  , COUNT(1) AS order_count
  FROM
    orders
  GROUP BY
    order_date
) q
WHERE
    q.order_count > 150
ORDER BY
    order_date
LIMIT
    10;


-- Wrong
SELECT
	t.*
  , dense_rank() OVER (
  PARTITION BY order_date
  ORDER BY revenue DESC
) AS drnk
FROM
    daily_product_revenue t
WHERE
    drnk <= 5;


SELECT
    *
FROM (
  SELECT t.*,
    dense_rank() OVER (
      PARTITION BY order_date
      ORDER BY revenue DESC
    ) AS drnk
  FROM daily_product_revenue t
) q
WHERE
    q.drnk <= 5
ORDER BY
    q.order_date
  , q.revenue DESC
LIMIT
    10;