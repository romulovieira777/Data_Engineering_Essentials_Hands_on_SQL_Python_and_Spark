-- Extracting Data - substr and split_part
SELECT
    SUBSTR('2013-07-25 00:00:00.0', 1, 4) AS result;


SELECT
    SUBSTRING('2013-07-25 00:00:00.0', 1, 4) AS result;


SELECT
    SUBSTRING('2013-07-25 00:00:00.0' FROM 1 FOR 4) AS result;


SELECT
    SUBSTRING('2013-07-25 00:00:00.0', 6, 2) AS result;


SELECT
    SUBSTRING('2013-07-25 00:00:00.0', 9, 2) AS result;


SELECT
    SUBSTRING('2013-07-25 00:00:00.0' from 12) AS result;


SELECT
    SUBSTR('2013-07-25 00:00:00.0', 12) AS result;


SELECT
    RIGHT('123 456 7890', 4) AS result;


SELECT
    LEFT('123 456 7890', 3) AS result;


SELECT
    SUBSTRING('123 456 7890' FROM length('123 456 7890') - 4) AS result;


SELECT
    SUBSTRING('123 456 7890' FROM '....$') AS result;


WITH unique_ids AS (
    SELECT '241-80-7115' AS unique_id UNION
    SELECT '694-30-6851' UNION
    SELECT '586-92-5361' UNION
    SELECT '884-65-284' UNION
    SELECT '876-99-585' UNION
    SELECT '831-59-5593' UNION
    SELECT '399-88-3617' UNION
    SELECT '733-17-4217' UNION
    SELECT '873-68-9778' UNION
    SELECT '48'
) SELECT
    unique_id
  , SUBSTRING(unique_id FROM 1 FOR 3) AS unique_id_first3
  , SUBSTRING(unique_id FROM '....$') AS unique_id_last4
FROM
    unique_ids
ORDER BY
    unique_id;


SELECT
    *
FROM
    orders
LIMIT
    10;


SELECT
    order_id
  , substr(order_date::varchar, 1, 10) AS order_date
  , order_customer_id
  , order_status
FROM
    orders
LIMIT
    10;


SELECT
    split_part('2013-07-25', '-', 1) AS result;


WITH addresses AS (
    SELECT '593 Fair Oaks Pass, Frankfort, Kentucky, 40618' AS address UNION
    SELECT ', Vancouver, Washington, 98687' UNION
    SELECT '83047 Glacier Hill Circle, Sacramento, California, 94237' UNION
    SELECT '935 Columbus Junction, Cincinnati, Ohio, 45213' UNION
    SELECT '03010 Nevada Crossing, El Paso, Texas, 88579' UNION
    SELECT '9 Dunning Circle, , Arizona, 85271' UNION
    SELECT '96 Fair Oaks Way, Decatur, Illinois, 62525' UNION
    SELECT '999 Caliangt Avenue, Greenville, South Carolina, 29615' UNION
    SELECT '2 Saint Paul Trail, Bridgeport, , 06673' UNION
    SELECT '3 Reindahl Center, Ogden, Utah'
) SELECT
    split_part(address, ', ', 1) street
  , split_part(address, ', ', 2) city
  , split_part(address, ', ', 3) state
  , split_part(address, ', ', 4) postal_code
FROM
    addresses
ORDER BY
    postal_code;


WITH addresses AS (
    SELECT '593 Fair Oaks Pass, Frankfort, Kentucky, 40618' AS address UNION
    SELECT ', Vancouver, Washington, 98687' UNION
    SELECT '83047 Glacier Hill Circle, Sacramento, California, 94237' UNION
    SELECT '935 Columbus Junction, Cincinnati, Ohio, 45213' UNION
    SELECT '03010 Nevada Crossing, El Paso, Texas, 88579' UNION
    SELECT '9 Dunning Circle, , Arizona, 85271' UNION
    SELECT '96 Fair Oaks Way, Decatur, Illinois, 62525' UNION
    SELECT '999 Caliangt Avenue, Greenville, South Carolina, 29615' UNION
    SELECT '2 Saint Paul Trail, Bridgeport, , 06673' UNION
    SELECT '3 Reindahl Center, Ogden, Utah'
) SELECT
    split_part(address, ', ', 1) street
  , split_part(address, ', ', 2) city
  , split_part(address, ', ', 3) state
  , split_part(address, ', ', 4) postal_code
FROM
    addresses
WHERE
    split_part(address, ', ', 1) = ''
ORDER BY
    postal_code;


WITH unique_ids AS (
    SELECT '241-80-7115' AS unique_id UNION
    SELECT '694-30-6851' UNION
    SELECT '586-92-5361' UNION
    SELECT '884-65-284' UNION
    SELECT '876-99-585' UNION
    SELECT '831-59-5593' UNION
    SELECT '399-88-3617' UNION
    SELECT '733-17-4217' UNION
    SELECT '873-68-9778' UNION
    SELECT '480-69-032'
) SELECT
    unique_id
  , SUBSTRING(unique_id FROM 1 FOR 3) AS unique_id_first3
  , SUBSTRING(unique_id FROM '....$') AS unique_id_last4
  , CASE 
        WHEN length(split_part(unique_id, '-', 3)) = 4
        THEN split_part(unique_id, '-', 3)
        ELSE 'Invalid'
    END AS unique_id_last
FROM
    unique_ids
ORDER BY
    unique_id;