-- Reverse and Concatenating multiple strings
SELECT
    REVERSE('Hello World') AS result;


SELECT
    CONCAT('Hello ', 'World') AS result;


SELECT
    CONCAT('Order Status is ', order_status) AS result
FROM
    orders
LIMIT
    10;


WITH date_separated AS 
(
	SELECT 2013 AS Year, 7 AS Month, 25 AS MyDate UNION
	SELECT 2013 AS Year, 12 AS Month, 2 AS MyDate UNION
	SELECT 2013 AS Year, 7 AS Month, 3 AS MyDate
) SELECT
	*
FROM
	date_separated;


WITH date_separated AS 
(
	SELECT 2013 AS Year, 7 AS Month, 25 AS MyDate UNION
	SELECT 2013 AS Year, 12 AS Month, 2 AS MyDate UNION
	SELECT 2013 AS Year, 7 AS Month, 3 AS MyDate
) SELECT
	CONCAT(Year, '-', LPAD(Month::VARCHAR, 2, '0'), '-', LPAD(MyDate::VARCHAR, 2, '0')) AS Full_Date
FROM
	date_separated;


WITH date_separated AS 
(
	SELECT 2013 AS Year, 7 AS Month, 25 AS MyDate UNION
	SELECT 2013 AS Year, 12 AS Month, 2 AS MyDate UNION
	SELECT 2013 AS Year, 7 AS Month, 3 AS MyDate
) SELECT
	CONCAT_WS('-', Year::VARCHAR, LPAD(Month::VARCHAR, 2, '0'), LPAD(MyDate::VARCHAR, 2, '0')) AS Full_Date
FROM
	date_separated;


SELECT
    *
FROM
    (SELECT 2013 AS year
          , 7    AS month
          , 25   AS myDate) q;


SELECT
    CONCAT(year, '-', LPAD(month::VARCHAR, 2, '0'), '-', LPAD(myDate::VARCHAR, 2, '0')) AS order_date
FROM
    (SELECT 2013 AS year
          , 7    AS month
          , 25   AS myDate) q;


SELECT concat_ws('-', year, LPAD(month::VARCHAR, 2, '0'), LPAD(myDate::VARCHAR, 2, '0')) AS order_date
FROM
    (SELECT 2013 AS year
          , 7    AS month
          , 25   AS myDate) q;