SELECT
	o.order_id
  , o.order_date
  , o.order_status
  , oi.order_item_order_id
  , oi.order_item_subtotal
FROM
	orders o
LEFT OUTER JOIN
	order_items oi
ON
	o.order_id = oi.order_item_order_id
ORDER BY
	o.order_id
LIMIT
	10;


SELECT
	COUNT(1)
FROM
	orders o
LEFT OUTER JOIN
	order_items oi
ON
	o.order_id = oi.order_item_order_id;


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
  , oi.order_item_order_id
  , oi.order_item_subtotal
FROM
	orders o
LEFT OUTER JOIN
	order_items oi
ON
	o.order_id = oi.order_item_order_id
WHERE
	oi.order_item_order_id IS NULL
ORDER BY
	o.order_id
LIMIT
	10;


SELECT
	COUNT(1)
FROM
	orders o
LEFT OUTER JOIN
	order_items oi
ON
	o.order_id = oi.order_item_order_id
WHERE
	oi.order_item_order_id IS NULL;


SELECT
	COUNT(1)
FROM
	orders o
LEFT OUTER JOIN
	order_items oi
ON
	o.order_id = oi.order_item_order_id
WHERE
	oi.order_item_order_id IS NULL
AND
	o.order_status IN ('COMPLETE', 'CLOSED');


SELECT
	o.order_id
  , o.order_date
  , o.order_status
  , oi.order_item_order_id
  , oi.order_item_subtotal
FROM
	orders o
RIGHT OUTER JOIN
	order_items oi
ON
	o.order_id = oi.order_item_order_id
LIMIT
	10;


SELECT
	COUNT(1)
FROM
	orders o
RIGHT OUTER JOIN
	order_items oi
ON
	o.order_id = oi.order_item_order_id;


SELECT o.order_id,
    o.order_date,
    o.order_status,
    oi.order_item_order_id,
    oi.order_item_subtotal
FROM
	orders o
RIGHT OUTER JOIN
	order_items oi
ON
	o.order_id = oi.order_item_order_id
WHERE
	o.order_id IS NULL
LIMIT
	10;