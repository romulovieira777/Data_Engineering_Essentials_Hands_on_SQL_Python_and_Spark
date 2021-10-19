-- Trimming and Padding Functions
SELECT
    LTRIM('     Hello World') AS result;


SELECT
    LTRIM('     Hello World', ' ') AS result;


SELECT
    RTRIM('     Hello World       ') AS result;


SELECT
    LENGTH(TRIM('     Hello World       ')) AS result;


SELECT
    LTRIM('----Hello World----', '-') AS result;


SELECT
    RTRIM('----Hello World----', '-') AS result;


SELECT
    TRIM('----Hello World----', '-') AS result;


SELECT
    TRIM(LEADING '-' FROM '----Hello World----') AS result;


SELECT
    TRIM(TRAILING '-' FROM '----Hello World----') AS result;


SELECT
    TRIM(BOTH '-' FROM '----Hello World----') AS result;


SELECT
    TRIM(BOTH '- ;' FROM '- -;-Hello World- - -') AS result;


SELECT
    TRIM('- -;-Hello World- - -', '- ;') AS result;


SELECT
    2013    AS year
  , 7       AS month
  , 25      AS myDate;


SELECT
    LPAD(7::varchar, 2, '0') AS result;


SELECT
    LPAD(10::varchar, 2, '0') AS result;


SELECT
    LPAD(100::varchar, 2, '0') AS result;