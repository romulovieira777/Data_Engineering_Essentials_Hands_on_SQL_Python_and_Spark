/*
Exercise 1 - Customer order count
Get order count per customer for the month of 2014 January.

Tables - orders and customers
Data should be sorted in descending order by count and ascending order by customer id.
Output should contain customer_id, customer_first_name, customer_last_name and customer_order_count.
*/
SELECT
	COUNT(o.order_customer_id) AS customer_order_count
  , order_date
  , c.customer_id
  , c.customer_fname
  , c.customer_lname
FROM
	orders AS o
INNER JOIN
	customers AS c
ON
	o.order_customer_id = c.customer_id
WHERE
	TO_CHAR(o.order_date, 'yyyy-MM-dd') LIKE '2014-01%'
GROUP BY
	o.order_date
  , c.customer_id
  , c.customer_fname
  , c.customer_lname
ORDER BY
	customer_order_count
  , c.customer_id DESC;