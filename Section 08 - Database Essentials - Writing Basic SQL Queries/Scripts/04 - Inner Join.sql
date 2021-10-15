SELECT
	o.order_id
  , o.order_date
  , o.order_status
  , oi.order_item_subtotal
FROM
	orders o 
INNER JOIN
	order_items oi
ON
	o.order_id = oi.order_item_order_id
LIMIT
	10;


SELECT
	COUNT(1)
FROM
	orders;


SELECT
	COUNT(1)
FROM
	order_items;


SELECT
	COUNT(1)
FROM
	orders o
INNER JOIN
	order_items oi
ON
	o.order_id = oi.order_item_order_id;


SELECT
	o.order_id
  , o.order_date
  , o.order_status
  , oi.order_item_subtotal
FROM
	orders o
INNER JOIN
	order_items oi
ON
	o.order_id = oi.order_item_order_id
WHERE
	o.order_status IN ('COMPLETE', 'CLOSED')
LIMIT
	10;


SELECT
	COUNT(1)
FROM
	orders o
INNER JOIN
	order_items oi
ON
	o.order_id = oi.order_item_order_id
WHERE
	o.order_status IN ('COMPLETE', 'CLOSED')
LIMIT
	10;


SELECT
	o.order_id,
    o.order_date,
    o.order_status,
    oi.order_item_subtotal
FROM
	orders o
INNER JOIN
	order_items oi
ON
	o.order_id = oi.order_item_order_id
WHERE
	o.order_status IN ('COMPLETE', 'CLOSED')
AND
	TO_CHAR(order_date, 'yyyy-MM') = '2014-01'
LIMIT
	10;


SELECT
	COUNT(1)
FROM
	orders o
INNER JOIN
	order_items oi
ON
	o.order_id = oi.order_item_order_id
WHERE
	o.order_status IN ('COMPLETE', 'CLOSED')
AND
	TO_CHAR(order_date, 'yyyy-MM') = '2014-01'
LIMIT
	10;