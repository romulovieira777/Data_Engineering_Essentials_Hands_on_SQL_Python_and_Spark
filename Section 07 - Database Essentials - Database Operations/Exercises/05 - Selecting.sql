/*
Validation - Get count of all published courses by author and make sure output is sorted in descending order by count.
*/
SELECT
	course_author
  , COUNT(1) AS course_count
FROM
	courses
WHERE
	course_status = 'published'
GROUP BY
	course_author;