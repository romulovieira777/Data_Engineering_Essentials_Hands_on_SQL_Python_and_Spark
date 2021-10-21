-- Analytic Functions – Aggregations
CREATE TABLE IF NOT EXISTS employees
(
    employee_id SERIAL PRIMARY KEY
  , department_id SERIAL
  , salary NUMERIC(10,2)
);


SELECT
    employee_id
  , department_id
  , salary 
FROM
    employees 
ORDER BY
    employee_id
  , department_id
  , salary
LIMIT
    10;


SELECT
    department_id
  , SUM(salary) AS department_salary_expense
FROM
    employees
GROUP BY
    department_id
ORDER BY
    department_id;


SELECT
    e.employee_id
  , e.department_id
  , e.salary
  , ae.department_salary_expense
  , ae.avg_salary_expense
FROM
    employees e JOIN (
        SELECT
            department_id 
          , SUM(salary) AS department_salary_expense
          , ROUND(AVG(salary)::NUMERIC, 2) AS avg_salary_expense
    FROM
        employees
    GROUP BY
        department_id
) ae
ON
    e.department_id = ae.department_id
ORDER BY
    department_id, salary
LIMIT
    10;


SELECT
    e.employee_id
  , e.department_id
  , e.salary
  , ae.department_salary_expense
  , ae.avg_salary_expense
  , ROUND(e.salary / ae.department_salary_expense * 100, 2) pct_salary
FROM
    employees e JOIN (
        SELECT department_id
      , SUM(salary)                     AS department_salary_expense
      , ROUND(AVG(salary)::NUMERIC, 2)  AS avg_salary_expense
    FROM
        employees
    GROUP BY
        department_id
) ae
ON
    e.department_id = ae.department_id
ORDER BY
    department_id
  , salary
LIMIT
    10;


SELECT
    e.employee_id
  , e.department_id
  , e.salary
  , SUM (e.salary) OVER (
        PARTITION BY e.department_id
    ) AS department_salary_expense
FROM
    employees e
ORDER BY
    e.department_id
LIMIT
    10;


SELECT
    e.employee_id
  , e.department_id
  , e.salary
  , SUM(e.salary) OVER (
        PARTITION BY e.department_id
    ) AS department_salary_expense,
    ROUND(e.salary / SUM(e.salary) OVER (
        PARTITION BY e.department_id
    ) * 100, 2) AS pct_salary
FROM
    employees e
ORDER BY
    e.department_id
  , e.salary
LIMIT
    10;


SELECT
    e.employee_id
  , e.department_id
  , e.salary
  , SUM(e.salary) OVER (
        PARTITION BY e.department_id
    ) AS sum_sal_expense,
    ROUND(AVG(e.salary) OVER (
        PARTITION BY e.department_id
    ), 2) AS avg_sal_expense,
    MIN(e.salary) OVER (
        PARTITION BY e.department_id
    ) AS min_sal_expense,
    MAX(e.salary) OVER (
        PARTITION BY e.department_id
    ) AS max_sal_expense,
    COUNT(e.salary) OVER (
        PARTITION BY e.department_id
    ) AS cnt_sal_expense
FROM
    employees e
ORDER BY
    e.department_id
  , e.salary
LIMIT
    10;


SELECT
    order_date
  , order_item_product_id
  , revenue
  , SUM(revenue) OVER (PARTITION BY order_date) AS sum_revenue
  , MIN(revenue) OVER (PARTITION BY order_date) AS min_revenue
  , MAX(revenue) OVER (PARTITION BY order_date) AS max_revenue
FROM daily_product_revenue
ORDER BY order_date,
    revenue DESC
LIMIT 10;