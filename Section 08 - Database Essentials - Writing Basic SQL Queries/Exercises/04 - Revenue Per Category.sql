/*
Exercise 4 - Revenue Per Category
Get the revenue generated for each category for the month of 2014 January

Tables - orders, order_items, products and categories
Data should be sorted in ascending order by category_id.
Output should contain all the fields from category along with the revenue as category_revenue.
Consider only COMPLETE and CLOSED orders
*/
SELECT
	category_name
  , ROUND(SUM(oi.order_item_subtotal::numeric), 2) AS customer_revenue
FROM
	order_items AS oi
INNER JOIN
	orders 		AS o
ON
	oi.order_item_order_id = o.order_id
INNER JOIN
	products 	AS p
ON
	p.product_id = oi.order_item_product_id
INNER JOIN
	categories  AS c
ON
	c.category_department_id = p.product_category_id
WHERE
	o.order_status IN ('CLOSED', 'COMPLETE')
AND
	TO_CHAR(order_date, 'yyyy-MM-dd') LIKE '2014-01%'
GROUP BY
	c.category_name
ORDER BY
	customer_revenue