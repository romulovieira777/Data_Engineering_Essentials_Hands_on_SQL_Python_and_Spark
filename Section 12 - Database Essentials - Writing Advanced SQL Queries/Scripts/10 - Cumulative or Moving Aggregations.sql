-- Cumulative or Moving Aggregations
SELECT
    e.employee_id
  , e.department_id
  , e.salary
  , SUM(e.salary) OVER (
        PARTITION BY e.department_id
        ORDER BY e.salary
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS sum_sal_expense
FROM
    employees e
ORDER BY
    e.department_id
  , e.salary DESC
LIMIT
    10;


SELECT
    t.*
  , ROUND(SUM(t.revenue) OVER (
        PARTITION BY to_char(order_date, 'yyyy-MM')
        ORDER BY order_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ), 2) AS cumulative_daily_revenue
FROM
    daily_revenue t
ORDER BY
    TO_CHAR(order_date, 'yyyy-MM')
  , order_date
LIMIT
    10;


SELECT
    t.*
  , ROUND(SUM(t.revenue) OVER (
        ORDER BY order_date
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ), 2) AS moving_3day_revenue
FROM
    daily_revenue t
ORDER BY
    order_date
LIMIT
    20;


SELECT
    t.*
  , ROUND(SUM(t.revenue) OVER (
        ORDER BY order_date
        ROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING
    ), 2) AS moving_3day_revenue
FROM
    daily_revenue t
ORDER BY
    order_date
LIMIT
    20;


SELECT
    t.*
  , ROUND(AVG(t.revenue) OVER (
        ORDER BY order_date
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ), 2) AS moving_3day_revenue
FROM
    daily_revenue t
ORDER BY
    order_date
LIMIT   20;
