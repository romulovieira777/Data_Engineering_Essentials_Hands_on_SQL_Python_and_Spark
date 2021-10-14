/*
Exercise 4 - Deleting Data
Delete all the courses which are neither in draft mode nor published.
Provide the delete statement as answer for this exercise.
*/
DELETE FROM
	courses
WHERE
	course_status IN('inactive', 'draft')