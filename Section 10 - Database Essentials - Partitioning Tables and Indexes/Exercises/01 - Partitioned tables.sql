/*
Exercise 1
Create table orders_part with the same columns as orders.

Partition the table by month using range partitioning on order_date.
Add 14 partitions - 13 based up on the data and 1 default. Here is the naming convention.
Default - orders_part_default
Partition for 2014 January - orders_part_201401
*/
DROP TABLE IF EXISTS
   orders_part;


CREATE TABLE orders_part
(
    order_id SERIAL
  , order_date DATE DEFAULT CURRENT_DATE
  , order_customer_id INTEGER
  , order_status VARCHAR(45) NOT NULL
  , created_mnth INT
  , last_updated_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  , PRIMARY KEY (created_mnth, order_id)
) PARTITION BY LIST(created_mnth);


CREATE TABLE
    orders_part_201401
PARTITION OF
    orders_part
FOR VALUES IN (201401);


CREATE TABLE
   orders_part_201402
PARTITION OF
    orders_part
FOR VALUES IN (201402);


CREATE TABLE
    orders_part_201403
PARTITION OF
    orders_part
FOR VALUES IN (201403);


CREATE TABLE
    orders_part_201404
PARTITION OF
   orders_part
FOR VALUES IN (201404);


CREATE TABLE
    orders_part_201405
PARTITION OF
    orders_part
FOR VALUES IN (201405);


CREATE TABLE
    orders_part_201406
PARTITION OF
    orders_part
FOR VALUES IN (201406);


CREATE TABLE
   orders_part_201407
PARTITION OF
    orders_part
FOR VALUES IN (201407);


CREATE TABLE
    orders_part_201408
PARTITION OF
    orders_part
FOR VALUES IN (201408);


CREATE TABLE
    orders_part_201409
PARTITION OF
    orders_part
FOR VALUES IN (201409);


CREATE TABLE
    orders_part_201410
PARTITION OF
    orders_part
FOR VALUES IN (201410);


CREATE TABLE
    orders_part_201411
PARTITION OF
   orders_part
FOR VALUES IN (201411);


CREATE TABLE
    orders_part_201412
PARTITION OF
   orders_part
FOR VALUES IN (201412);