-- Extracting information - extract
SELECT
    EXTRACT(century FROM CURRENT_DATE) AS Century


SELECT
    DATE_PART('century', CURRENT_DATE) AS Century


SELECT
    EXTRACT(decade FROM CURRENT_DATE) AS Decade


SELECT
    DATE_PART('decade', CURRENT_DATE) AS Century


SELECT
    EXTRACT(year FROM CURRENT_DATE) AS Year


SELECT
    EXTRACT(quarter FROM CURRENT_DATE) AS Quarter


SELECT
    EXTRACT(month FROM CURRENT_DATE) AS Month


SELECT
    EXTRACT(week FROM CURRENT_DATE) AS Week


SELECT
    EXTRACT(day FROM CURRENT_DATE) AS Day


SELECT
    EXTRACT(doy FROM CURRENT_DATE) AS Day_of_Year


SELECT
    EXTRACT(dow FROM CURRENT_DATE) AS Day_of_Week


SELECT
    EXTRACT(hour FROM current_timestamp) AS Hour


SELECT
    EXTRACT(minute FROM current_timestamp) AS Minute


SELECT
    EXTRACT(second FROM current_timestamp) AS Second


SELECT
    EXTRACT(milliseconds FROM current_timestamp) AS Millis