-- Overview of Sub Queries
SELECT
    *
FROM (
    SELECT
        CURRENT_DATE) AS q;


SELECT
    *
FROM (
    SELECT
        nq.*
      , dense_rank() OVER (
            PARTITION BY order_date
    ORDER BY
        revenue DESC
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
FROM
    order_items oi
WHERE
    oi.order_item_order_id 
NOT IN (
        SELECT
            order_id
        FROM
            orders o
        WHERE
            o.order_id = oi.order_item_order_id
    )
LIMIT
    10;


SELECT
    COUNT(1)
FROM
    order_items oi
WHERE
    oi.order_item_order_id 
IN (
    SELECT
        order_id
    FROM
        orders o
    WHERE
        o.order_id = oi.order_item_order_id
    )
LIMIT
    10;


SELECT
    *
FROM
    order_items oi
WHERE NOT EXISTS (
        SELECT
            1
        FROM
            orders o
        WHERE
            o.order_id = oi.order_item_order_id
    )
LIMIT
    10;


SELECT
    *
FROM
    order_items oi
WHERE EXISTS (
        SELECT
            1
        FROM
            orders o
        WHERE
            o.order_id = oi.order_item_order_id
    )
LIMIT
    10;