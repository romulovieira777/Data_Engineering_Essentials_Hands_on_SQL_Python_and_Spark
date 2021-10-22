/*
Exercise 3 - Updating Data
Update the status of all the draft courses related to Python and Scala to published along with 
the course_published_dt using system date.
Provide the update statement as answer for this exercise
*/
UPDATE
	courses
SET
	course_status = 'published'
  , course_published_it = CURRENT_DATE
WHERE
	course_status = 'draft'
AND
	course_name LIKE '%Python%'
OR
	course_name LIKE '%Scala%'