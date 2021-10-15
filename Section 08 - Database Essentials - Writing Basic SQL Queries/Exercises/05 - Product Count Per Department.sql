/*
Exercise 5 - Product Count Per Department
Get the products for each department.

Tables - departments, categories, products
Data should be sorted in ascending order by department_id
Output should contain all the fields from department and the product count as product_count
*/
SELECT
	COUNT(p.product_name) AS product_count
  , p.product_name
FROM
	products 	AS p
INNER JOIN
	categories 	AS c
ON
	p.product_category_id = c.category_department_id
INNER JOIN
	departments AS d
ON
	d.department_id = c.category_department_id
GROUP BY
	d.department_id
  , p.product_name
ORDER BY
	d.department_id