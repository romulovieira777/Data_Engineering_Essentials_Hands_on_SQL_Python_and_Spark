SELECT
	COUNT(order_id)
FROM
	orders;


SELECT
	COUNT(DISTINCT order_date)
FROM
	orders;


SELECT
	*
FROM
	order_items 
WHERE
	order_item_order_id = 2;


SELECT
	ROUND(SUM(order_item_subtotal::numeric), 2) AS order_revenue
FROM
	order_items 
WHERE
	order_item_order_id = 2;


SELECT
	COUNT(1) 
FROM
	orders
WHERE
	order_status IN ('COMPLETE', 'CLOSED');


SELECT
	order_date
  , COUNT(1)
FROM
	orders
GROUP BY
	order_date
ORDER BY
	order_date
LIMIT
	10;


SELECT
	order_status
  , COUNT(1) AS status_count
FROM
	orders
GROUP BY
	order_status
ORDER BY
	order_status
LIMIT
	10;


SELECT
	order_item_order_id
  , SUM(order_item_subtotal) AS order_revenue
FROM
	order_items
GROUP BY
	order_item_order_id 
LIMIT
	10;


-- WRONG
SELECT
	order_item_order_id
  , ROUND(SUM(order_item_subtotal), 2) AS order_revenue
FROM
	order_items
GROUP BY
	order_item_order_id 
LIMIT
	10;


SELECT
	order_item_order_id
  , ROUND(SUM(order_item_subtotal)::numeric, 2) AS order_revenue
FROM
	order_items
GROUP BY
	order_item_order_id 
LIMIT
	10;


SELECT
	o.order_date
  , oi.order_item_product_id
  , ROUND(SUM(oi.order_item_subtotal::numeric), 2) AS revenue
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
LIMIT
	10;


-- WRONG
SELECT
	o.order_date
  , oi.order_item_product_id
  , ROUND(SUM(oi.order_item_subtotal::numeric), 2) AS revenue
FROM
orders o
INNER JOIN
	order_items oi
ON
	o.order_id = oi.order_item_order_id
WHERE
	o.order_status IN ('COMPLETE', 'CLOSED')
AND
	revenue >= 500
GROUP BY
	o.order_date
  , oi.order_item_product_id
LIMIT
	10;


-- WRONG
SELECT
	o.order_date
  , oi.order_item_product_id
  , ROUND(SUM(oi.order_item_subtotal::numeric), 2) AS revenue
FROM
	orders o
INNER JOIN
	order_items oi
ON
	o.order_id = oi.order_item_order_id
WHERE
	o.order_status IN ('COMPLETE', 'CLOSED')
AND
	ROUND(SUM(oi.order_item_subtotal::numeric), 2) >= 500
GROUP BY
	o.order_date
  , oi.order_item_product_id
LIMIT
	10;


SELECT
	o.order_date
  , oi.order_item_product_id
  , ROUND(SUM(oi.order_item_subtotal::numeric), 2) AS revenue
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
HAVING
	ROUND(SUM(oi.order_item_subtotal::numeric), 2) >= 500
ORDER BY
	o.order_date
  , revenue DESC
LIMIT
	25;


SELECT
	COUNT(1)
FROM (
    SELECT
		o.order_date
	  , oi.order_item_product_id
	  , ROUND(SUM(oi.order_item_subtotal::numeric), 2) AS revenue
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
) q;


SELECT
	COUNT(1)
FROM (
    SELECT
		o.order_date
	  , oi.order_item_product_id
	  , ROUND(SUM(oi.order_item_subtotal::numeric), 2) AS revenue
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
    HAVING
		ROUND(SUM(oi.order_item_subtotal::numeric), 2) >= 500
) q;