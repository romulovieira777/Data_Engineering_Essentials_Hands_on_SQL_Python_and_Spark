-- Handling NULL Values
SELECT
    1 + NULL AS Result


SELECT
    COALESCE(1, 0) AS Result


SELECT
    COALESCE(NULL, NULL, 2, NULL, 3) AS Result


DROP TABLE IF EXISTS
    sales;


CREATE TABLE IF NOT EXISTS sales
(
    sales_person_id INT,
    sales_amount FLOAT,
    commission_pct INT
);


INSERT INTO
	sales
VALUES (
	1
  , 1000
  , 10
), (
	2
  , 1500
  , 8
), (
	3
  , 500
  , NULL
), (
	4
  , 800
  , 5
), (
	5
  , 250
  , NULL
);


SELECT
    *
FROM
    sales;


SELECT
    s.*
  , ROUND((sales_amount * commission_pct / 100)::NUMERIC, 2) AS Incorrect_Commission_Amount
FROM
    sales AS s;


SELECT
    s.*
  , COALESCE(commission_pct, 0) AS Commission_Pct
FROM
    sales AS s;


SELECT
    s.*
  , ROUND((sales_amount * COALESCE(commission_pct, 0) / 100)::NUMERIC, 2) AS Commission_Amount
FROM
    sales AS s;


SELECT
    NULLIF(1, 0);


SELECT
    NULLIF(1, 1);