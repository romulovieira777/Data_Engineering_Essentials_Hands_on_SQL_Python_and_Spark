-- Analytic Functions – Ranking
SELECT
    t.*
  , RANK() OVER (
        PARTITION BY order_date
        ORDER BY revenue DESC
    ) AS rnk
FROM
    daily_product_revenue t
ORDER BY
    order_date
  , revenue DESC
LIMIT
    30;


SELECT
    employee_id
  , department_id
  , salary
FROM
    employees 
ORDER BY
    department_id
  , salary DESC
LIMIT
    10;


SELECT
    employee_id
  , department_id
  , salary
  , RANK() OVER (
        PARTITION BY department_id 
        ORDER BY salary DESC
    ) AS rnk
FROM
    employees
LIMIT
    20;


SELECT
    employee_id
  , department_id
  , salary
  , DENSE_RANK() OVER (
        PARTITION BY department_id 
        ORDER BY salary DESC
    ) AS drnk
FROM
    employees
LIMIT
    20;


SELECT
    employee_id
  , department_id
  , salary
  , RANK() OVER (
        ORDER BY salary DESC
    ) AS rnk,
    dense_rank() OVER (
        ORDER BY salary DESC
    ) AS drnk
FROM
    employees
LIMIT
    20;


SELECT
    employee_id
  , department_id
  , salary
  , RANK() OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
      ) rnk,
    dense_rank() OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
      ) drnk,
    row_number() OVER (
        PARTITION BY department_id
        ORDER BY salary DESC, employee_id
      ) rn
FROM
    employees
ORDER BY
    department_id
  , salary DESC
LIMIT
    50;


SELECT
    t.*
  , RANK() OVER (
        PARTITION BY order_date
        ORDER BY revenue DESC
    ) rnk,
    dense_rank() OVER (
        PARTITION BY order_date
        ORDER BY revenue DESC
    ) drnk,
    row_number() OVER (
        PARTITION BY order_date
        ORDER BY revenue DESC
    ) rn
FROM
    daily_product_revenue AS t
ORDER BY
    order_date
  , revenue DESC
LIMIT
    30;