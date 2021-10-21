-- CTAS - Create Table as Select
DROP TABLE IF EXISTS
    customers_backup;


CREATE TABLE
    customers_backup
AS
SELECT
    *
FROM
    customers;


DROP TABLE IF EXISTS
    orders_backup;


CREATE TABLE
    orders_backup
AS
SELECT
    order_id
  , TO_CHAR(order_date, 'yyyy')::INT AS Order_Year
  , TO_CHAR(order_date, 'MM')::INT   AS order_month
  , TO_CHAR(order_date, 'dd')::INT   AS order_day_of_month
  , TO_CHAR(order_date, 'DDD')::INT  AS order_day_of_year
  , order_customer_id
  , order_status
FROM
    orders;


SELECT
    *
FROM
    orders_backup
LIMIT
    10;


DROP TABLE IF EXISTS
    order_items_empty;


CREATE TABLE
    order_items_empty
AS
SELECT
    *
FROM
    order_items
WHERE
    1 = 2;


SELECT
    COUNT(1)
FROM
    order_items_empty;


DROP TABLE IF EXISTS
    customers_backup;


DROP TABLE IF EXISTS
    orders_backup;


DROP TABLE IF EXISTS
    order_items_empty;