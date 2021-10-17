-- Repartitioning - Range
ALTER TABLE
    users_range_part
DETACH PARTITION
    users_range_part_2016;


ALTER TABLE
    users_range_part
DETACH PARTITION
    users_range_part_2017;


ALTER TABLE
    users_range_part
DETACH PARTITION
    users_range_part_2018;


ALTER TABLE
    users_range_part
DETACH PARTITION
    users_range_part_2019;


ALTER TABLE
    users_range_part
DETACH PARTITION
    users_range_part_2020;


INSERT INTO
    users_range_part
SELECT
    *
FROM
    users_range_part_2016;


INSERT INTO
    users_range_part
SELECT
    *
FROM
    users_range_part_2017;


INSERT INTO
    users_range_part
SELECT
    *
FROM
    users_range_part_2018;


INSERT INTO
    users_range_part
SELECT
    *
FROM
    users_range_part_2019;


INSERT INTO
    users_range_part
SELECT
    *
FROM
    users_range_part_2020;


SELECT
    *
FROM
    users_range_part;


SELECT
    *
FROM
    users_range_part_201706;


SELECT
    *
FROM
    users_range_part_201810;


SELECT
    *
FROM
    users_range_part_201902;


DROP TABLE
    users_range_part_2016;


DROP TABLE
    users_range_part_2017;


DROP TABLE
    users_range_part_2018;


DROP TABLE
    users_range_part_2019;


DROP TABLE
    users_range_part_2020;


SELECT
    table_catalog
  , table_schema
  , table_name
FROM
    information_schema.tables
WHERE
    table_name ~ 'users_range_part_'
ORDER BY
    table_name;