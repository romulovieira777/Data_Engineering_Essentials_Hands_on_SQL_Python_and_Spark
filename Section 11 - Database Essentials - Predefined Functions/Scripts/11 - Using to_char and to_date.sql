-- Using to_char and to_date
SELECT
    CURRENT_TIMESTAMP AS Current_Timestamp


SELECT
    CURRENT_TIMESTAMP AS Current_Timestamp
  , TO_CHAR(CURRENT_TIMESTAMP, 'yyyy') AS Year
  , TO_DATE('2020', 'yyyy')


SELECT
    CURRENT_TIMESTAMP AS Current_Timestamp
  , TO_CHAR(CURRENT_TIMESTAMP, 'yyyy') AS Year


SELECT
    CURRENT_TIMESTAMP AS Current_Timestamp
  , TO_CHAR(CURRENT_TIMESTAMP, 'yyyy') AS Year
  , TO_DATE('20', 'yy')


SELECT
    CURRENT_TIMESTAMP AS Current_Timestamp
  , TO_CHAR(CURRENT_TIMESTAMP, 'MM') AS Year
  , TO_DATE('202011', 'yyyyMM')


SELECT
    CURRENT_TIMESTAMP AS Current_Timestamp
  , TO_CHAR(CURRENT_TIMESTAMP, 'MM') AS Month


SELECT
    CURRENT_TIMESTAMP AS Current_Timestamp
  , TO_CHAR(CURRENT_TIMESTAMP, 'dd') AS Year
  , TO_DATE('20201110', 'yyyyMMdd')


SELECT
    CURRENT_TIMESTAMP AS Current_Timestamp
  , TO_CHAR(CURRENT_TIMESTAMP, 'dd') AS Day_of_Month


SELECT
    CURRENT_TIMESTAMP AS Current_Timestamp
  , TO_CHAR(CURRENT_TIMESTAMP, 'DD') AS Day_of_Month


SELECT
    CURRENT_TIMESTAMP AS Current_Timestamp
  , TO_CHAR(CURRENT_TIMESTAMP, 'dd') AS Day_of_Month
  , TO_CHAR(CURRENT_TIMESTAMP, 'DD') AS Day_of_Month


SELECT
    CURRENT_TIMESTAMP AS Current_Timestamp
  , TO_CHAR(CURRENT_TIMESTAMP, 'DDD') AS Day_of_Year

SELECT
    CURRENT_TIMESTAMP AS Current_Timestamp
  , TO_CHAR(CURRENT_TIMESTAMP, 'ddd') AS Day_of_Year
  , TO_DATE('2020300', 'yyyyDDD')


SELECT
    CURRENT_TIMESTAMP AS Current_Timestamp
  , TO_CHAR(CURRENT_TIMESTAMP, 'Mon') AS Month_Name


SELECT
    CURRENT_TIMESTAMP AS Current_Timestamp
  , TO_CHAR(CURRENT_TIMESTAMP, 'Mon') AS Month_Name
  , TO_DATE('2020Nov', 'yyyyMon')


SELECT
    CURRENT_TIMESTAMP AS Current_Timestamp
  , TO_CHAR(CURRENT_TIMESTAMP, 'Mon') AS Month_Name


SELECT
    CURRENT_TIMESTAMP AS Current_Timestamp
  , TO_CHAR(CURRENT_TIMESTAMP, 'mon') AS Month_Name
  , TO_DATE('2020Nov', 'yyyymon')


SELECT
    CURRENT_TIMESTAMP AS Current_Timestamp
  , TO_CHAR(CURRENT_TIMESTAMP, 'Month') AS Month_Name


SELECT
    CURRENT_TIMESTAMP AS Current_Timestamp
  , TO_CHAR(CURRENT_TIMESTAMP, 'Month') AS Month_Name
  , TO_DATE('2020November', 'yyyyMonth')


SELECT
    CURRENT_TIMESTAMP AS Current_Timestamp
  , TO_CHAR(CURRENT_TIMESTAMP, 'month') AS Month_Name


SELECT
    CURRENT_TIMESTAMP AS Current_Timestamp
  , TO_CHAR(CURRENT_TIMESTAMP, 'day') AS Day_Name


SELECT
    CURRENT_TIMESTAMP AS Current_Timestamp
  , TO_CHAR(CURRENT_TIMESTAMP, 'DY') AS Day_Name


SELECT
    CURRENT_TIMESTAMP AS Current_Timestamp
  , TO_CHAR(CURRENT_TIMESTAMP, 'Day') AS Day_Name


SELECT
    CURRENT_TIMESTAMP AS Current_Timestamp 
  , TO_CHAR('2020-11-17'::DATE, 'Day')               AS dayname
  , LENGTH(TO_CHAR('2020-11-17'::DATE, 'Day'))       AS dayname_length
  , LENGTH(TRIM(TO_CHAR('2020-11-17'::DATE, 'Day'))) AS dayname_trimmed_length


SELECT
    CURRENT_TIMESTAMP AS Current_Timestamp 
  , TO_CHAR('2020-11-17'::DATE, 'Day')               AS Day_Name
  , LENGTH(TO_CHAR('2020-11-17'::DATE, 'Day'))       AS Day_Name_Length
  , LENGTH(TRIM(TO_CHAR('2020-11-17'::DATE, 'Day'))) AS Day_Name_Trimmed_Length


SELECT
    CURRENT_TIMESTAMP AS Current_Timestamp
  , TO_CHAR(CURRENT_TIMESTAMP, 'HH') AS Hour_12


SELECT
    CURRENT_TIMESTAMP AS Current_Timestamp
  , TO_CHAR(CURRENT_TIMESTAMP, 'hh') AS Hour_12


SELECT
    CURRENT_TIMESTAMP AS Current_Timestamp
  , TO_CHAR(CURRENT_TIMESTAMP, 'mm') AS Minutes


SELECT
    CURRENT_TIMESTAMP AS Current_Timestamp
  , TO_CHAR(CURRENT_TIMESTAMP, 'ss') AS Seconds


SELECT
    CURRENT_TIMESTAMP AS Current_Timestamp
  , TO_CHAR(CURRENT_TIMESTAMP, 'MS') AS Millis


SELECT
    TO_CHAR(CURRENT_TIMESTAMP, 'yyyyMM') AS Current_Month


SELECT
    TO_CHAR(CURRENT_TIMESTAMP, 'yyyyMM')::INT AS Current_Month


SELECT
    TO_CHAR(CURRENT_TIMESTAMP, 'yyyyMMdd') AS Current_Date


SELECT
    TO_CHAR(CURRENT_TIMESTAMP, 'yyyyMMdd')::INT AS Current_Date


SELECT
    TO_CHAR(CURRENT_TIMESTAMP, 'yyyy/MM/dd') AS Current_Date