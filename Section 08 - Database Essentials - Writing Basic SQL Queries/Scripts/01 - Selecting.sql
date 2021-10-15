SELECT
	current_database();


SELECT
	*
FROM
	information_schema.tables 
WHERE
	table_catalog = 'retail_db' 
AND
	table_schema = 'public' 
LIMIT
	10;


SELECT
	*
FROM
	orders
LIMIT
	10;


SELECT
	*
FROM
	order_items
LIMIT
	10;


SELECT
	*
FROM
	products
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
	products;