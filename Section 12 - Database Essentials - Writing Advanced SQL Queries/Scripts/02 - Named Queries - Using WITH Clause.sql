-- Named Queries - Using WITH Clause
WITH order_details_nq AS (
    SELECT
        *
    FROM
        orders o
    INNER JOIN
        order_items oi
    ON
        o.order_id = oi.order_item_order_id
) SELECT
    *
FROM
    order_details_nq
LIMIT
    10;


-- Wrong
SELECT
    *
FROM
    order_details_nq
LIMIT
    10;


WITH order_details_nq AS (
    SELECT
		*
	FROM
		orders o
    INNER JOIN
		order_items oi
    ON
		o.order_id = oi.order_item_order_id
) SELECT
	order_date
  , order_item_product_id
  , ROUND(SUM(order_item_subtotal)::NUMERIC, 2) AS revenue
FROM
	order_details_nq 
GROUP BY
	order_date
  , order_item_product_id
ORDER BY
	order_date
  , revenue DESC
LIMIT
	10;


CREATE OR REPLACE VIEW
    daily_product_revenue_v
AS
WITH order_details_nq AS (
    SELECT
        *
    FROM
        orders o
    INNER JOIN
        order_items oi
    ON
        o.order_id = oi.order_item_order_id
) SELECT
    order_date
  , order_item_product_id
  , ROUND(SUM(order_item_subtotal)::NUMERIC, 2) AS Revenue
FROM
    order_details_nq 
GROUP BY
    order_date
  , order_item_product_id;


SELECT
    *
FROM
    daily_product_revenue_v
ORDER BY
    order_date
  , revenue DESC
LIMIT
    10;