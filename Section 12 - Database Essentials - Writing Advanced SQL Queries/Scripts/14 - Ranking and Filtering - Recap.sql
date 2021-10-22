-- Ranking and Filtering - Recap
SELECT
    o.order_date
  , oi.order_item_product_id
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
  , oi.order_item_product_id
ORDER BY
    o.order_date
  , revenue DESC
LIMIT
    30;


SELECT
    nq.*
  , dense_rank() OVER (
        PARTITION BY order_date
        ORDER BY revenue DESC
    ) AS drnk
FROM (
    SELECT
        o.order_date
      , oi.order_item_product_id
      , ROUND(SUM(oi.order_item_subtotal)::NUMERIC, 2) AS revenue
    FROM
        orders o 
    INNER JOIN
        order_items oi
    ON
        o.order_id = oi.order_item_order_id
    WHERE o.order_status IN ('COMPLETE', 'CLOSED')
    GROUP BY
        o.order_date
      , oi.order_item_product_id
) nq
ORDER BY
    order_date
  , revenue DESC
LIMIT
    30;


SELECT
    *
FROM (
    SELECT
        nq.*
      , dense_rank() OVER (
            PARTITION BY order_date
            ORDER BY revenue DESC
        ) AS drnk
    FROM (
        SELECT
            o.order_date
          , oi.order_item_product_id
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
          , oi.order_item_product_id
    ) nq
) nq1
WHERE
    drnk <= 5
ORDER BY
    order_date
  , revenue DESC
LIMIT
    20;


SELECT
    *
FROM (
      SELECT
          dpr.*
       , dense_rank() OVER (
    PARTITION BY order_date
    ORDER BY revenue DESC
  ) AS drnk
FROM
    daily_product_revenue AS dpr) q
WHERE
    drnk <= 5
ORDER BY
    order_date
  , revenue DESC
LIMIT
    20;