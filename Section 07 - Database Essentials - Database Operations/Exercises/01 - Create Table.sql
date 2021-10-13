/*
Exercise 1 - Create Table¶

Create table - courses
course_id - sequence generated integer and primary key
course_name - which holds alpha numeric or string values up to 60 characters
course_author - which holds the name of the author up to 40 characters
course_status - which holds one of these values (published, draft, inactive).
course_published_dt - which holds date type value.
*/
CREATE TABLE courses
(
	course_id SERIAL PRIMARY KEY
  , course_name VARCHAR(60) NOT NULL
  , course_author VARCHAR(40) NOT NULL
  , course_status VARCHAR(10) NOT NULL
  , course_published_it DATE
);