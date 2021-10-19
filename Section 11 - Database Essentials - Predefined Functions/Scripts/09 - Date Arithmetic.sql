-- Date Arithmetic
SELECT
   CURRENT_DATE + INTERVAL '32 DAYS' AS result;


SELECT
   CURRENT_DATE + INTERVAL '730 DAYS' AS result;


SELECT
   CURRENT_DATE + INTERVAL '-730 DAYS' AS result;


SELECT
   CURRENT_DATE - INTERVAL '730 DAYS' AS result;


SELECT
   CURRENT_DATE + INTERVAL '3 MONTHS' AS result;


SELECT
    '2019-01-31'::DATE + INTERVAL '3 MONTHS' AS result;


SELECT
    '2019-01-31'::DATE + INTERVAL '3 MONTHS 3 DAYS 3 HOURS' AS result;


SELECT
    CURRENT_TIMESTAMP + INTERVAL '3 MONTHS' AS result;


SELECT
    CURRENT_TIMESTAMP + INTERVAL '10 HOURS' AS result;


SELECT
    CURRENT_TIMESTAMP + INTERVAL '10 MINUTES' AS result;


SELECT
    CURRENT_TIMESTAMP + INTERVAL '10 HOURS 10 MINUTES' AS result;


SELECT
    '2019-03-30'::DATE - '2017-12-31'::DATE AS result;


SELECT
	'2019-03-30'::DATE - TO_DATE('2017/31/12', 'yyyy/dd/MM') AS Result;


SELECT
    '2017-12-31'::DATE - '2019-03-30'::DATE AS result;


SELECT
   CURRENT_DATE - '2019-03-30'::DATE AS result;


SELECT
    CURRENT_TIMESTAMP - '2019-03-30'::DATE AS result;