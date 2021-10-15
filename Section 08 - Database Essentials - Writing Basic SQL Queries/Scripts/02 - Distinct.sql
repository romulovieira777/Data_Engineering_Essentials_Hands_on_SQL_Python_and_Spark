SELECT
	*
FROM
	orders
LIMIT
	10;


SELECT
	*
FROM
	information_schema.columns 
WHERE
	table_catalog = 'retail_db' 
AND
	table_name = 'orders';


SELECT
	order_customer_id
  , order_date
  , order_status 
FROM
	orders 
LIMIT
	10;


SELECT
	order_customer_id
  , TO_CHAR(order_date, 'yyyy-MM')
  , order_status 
FROM
	orders 
LIMIT
	10;


SELECT
	order_customer_id
  , TO_CHAR(order_date, 'yyyy-MM') AS order_month
  , order_status 
FROM
	orders 
LIMIT
	10;


SELECT
	DISTINCT TO_CHAR(order_date, 'yyyy-MM') AS order_month 
FROM
	orders;


SELECT
	COUNT(1)
FROM
	orders;


SELECT
	COUNT(DISTINCT TO_CHAR(order_date, 'yyyy-MM')) AS distinct_month_count 
FROM
	orders;