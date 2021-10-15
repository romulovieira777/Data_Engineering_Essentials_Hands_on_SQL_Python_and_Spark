SELECT
	o.order_date
  , oi.order_item_product_id
  , p.product_name
  , ROUND(SUM(oi.order_item_subtotal::numeric), 2) AS product_revenue
FROM
	orders o 
INNER JOIN
	order_items oi
ON
	o.order_id = oi.order_item_order_id
INNER JOIN
	products p
ON
	p.product_id = oi.order_item_product_id
WHERE
	o.order_status IN ('COMPLETE', 'CLOSED')
GROUP BY
	o.order_date
  , oi.order_item_product_id
  , p.product_name
LIMIT
	10;


SELECT
	o.order_date
  , oi.order_item_product_id
  , p.product_name
  , ROUND(SUM(oi.order_item_subtotal::numeric), 2) AS product_revenue
FROM
	orders o 
INNER JOIN
	order_items oi
ON
	o.order_id = oi.order_item_order_id
INNER JOIN
	products p
ON
	p.product_id = oi.order_item_product_id
WHERE
	o.order_status IN ('COMPLETE', 'CLOSED')
GROUP BY
	o.order_date
  , oi.order_item_product_id
  , p.product_name
ORDER BY
	o.order_date
  , product_revenue DESC
LIMIT
	10;


SELECT 
	COUNT(1)
FROM (
    SELECT 
		o.order_date
      , oi.order_item_product_id
      , p.product_name
      , ROUND(SUM(oi.order_item_subtotal::numeric), 2) AS product_revenue
    FROM
		orders o 
    INNER JOIN
		order_items oi
    ON
		o.order_id = oi.order_item_order_id
    INNER JOIN
		products p
    ON
		p.product_id = oi.order_item_product_id
    WHERE
		o.order_status IN ('COMPLETE', 'CLOSED')
    GROUP BY
		o.order_date
      , oi.order_item_product_id
      , p.product_name
) q;