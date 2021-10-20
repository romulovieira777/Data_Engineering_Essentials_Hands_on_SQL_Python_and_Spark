-- Data Type Conversion
SELECT
	'09'


SELECT
    '09'::INT


SELECT
    '09'::FLOAT


SELECT
    CURRENT_DATE AS Current_Date


SELECT
    SPLIT_PART('2020-09-30', '-', 2) AS Month


SELECT
    SPLIT_PART('2020-09-30', '-', 2)::INT AS Month


SELECT
    TO_CHAR('2020-09-30'::DATE, 'MM') AS Month


SELECT
    TO_CHAR('2020-09-30'::DATE, 'MM')::INT AS Month


SELECT
    TO_CHAR(CURRENT_DATE, 'MM')::INT AS Month


SELECT
    CAST('0.04000' AS FLOAT) AS Result


SELECT
    '0.04000'::FLOAT AS Result


SELECT
    CAST('09' AS INT) AS Result


SELECT
    '09'::INT AS Result