-- Case Conversion and Length
SELECT
    upper('hEllo wOrlD')    AS upper_result
  , lower('hEllo wOrlD')    AS lower_result
  , initcap('hEllo wOrlD')  AS initcap_result;


SELECT
    length('hEllo wOrlD') AS result;


SELECT
    *
FROM
    orders LIMIT 10;


SELECT
    order_id
  , order_date
  , order_customer_id
  , lower(order_status)     AS order_status
  , length(order_status)    AS order_status_length
FROM
    orders
LIMIT
    10;
