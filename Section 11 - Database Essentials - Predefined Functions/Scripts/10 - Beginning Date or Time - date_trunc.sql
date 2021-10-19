-- Beginning Date or Time - date_trunc
SELECT
    DATE_TRUNC('YEAR', CURRENT_DATE) AS year_beginning;


SELECT
    DATE_TRUNC('MONTH', CURRENT_DATE) AS month_beginning;


SELECT
    DATE_TRUNC('WEEK', CURRENT_DATE) AS week_beginning;


SELECT
    DATE_TRUNC('DAY', CURRENT_DATE) AS day_beginning;


SELECT
	CURRENT_DATE
  , DATE_TRUNC('DAY', CURRENT_DATE) AS Day_Beginning;


SELECT
    DATE_TRUNC('HOUR', CURRENT_TIMESTAMP) AS hour_beginning;


SELECT
	*
FROM
	orders
WHERE
	order_date BETWEEN DATE_TRUNC('MONTH', '2014-01-10'::DATE) AND '2014-01-10'::DATE
ORDER BY
	order_date
LIMIT
	10;


SELECT
	COUNT(1)
FROM
 	orders
WHERE
	order_date BETWEEN DATE_TRUNC('YEAR', '2014-01-10'::DATE) AND '2014-01-10';


SELECT
	COUNT(1)
  , MIN(order_date)
  , MAX(order_date)
FROM
 	orders
WHERE
	order_date BETWEEN DATE_TRUNC('YEAR', '2014-03-20'::DATE) AND '2014-03-20';