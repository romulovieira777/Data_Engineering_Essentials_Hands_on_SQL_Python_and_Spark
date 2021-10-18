-- Overview of Pre-Defined Functions
SELECT
    *
FROM
    information_schema.routines LIMIT 10;


SELECT
    *
FROM
    information_schema.routines 
WHERE
    routine_name ~ 'str';


SELECT
    substring('Thomas' from 2 for 3);


SELECT
    substring('Thomas', 2, 3);