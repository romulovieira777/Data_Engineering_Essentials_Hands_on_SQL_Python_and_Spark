/*
Exercise 2 - Dormant Customers¶
Get the customer details who have not placed any order for the month of 2014 January.

Tables - orders and customers
Data should be sorted in ascending order by customer_id
Output should contain all the fields from customers
*/
SELECT
	c.*	
FROM
	customers AS c
INNER JOIN
	orders AS o
ON
	c.customer_id = o.order_customer_id
WHERE
	TO_CHAR(o.order_date, 'yyyy-MM') <> '2014-01'
ORDER BY
	c.customer_id