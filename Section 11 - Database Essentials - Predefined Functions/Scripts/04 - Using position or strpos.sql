-- Using position or strpos
SELECT
    position('@' IN 'it@versity.com')
  , position('@' IN 'itversity.com');


SELECT
    strpos('it@versity.com', '@')
  , strpos('itversity.com', '@');


WITH email_ids AS (
    SELECT 'bsellan0@yellowbook.com' AS email_id UNION
    SELECT 'rstelljes1@illinois.edu' UNION
    SELECT 'mmalarkey2@webeden.co.uk' UNION
    SELECT 'emussared3@redcross.org' UNION
    SELECT 'livashin4@bloglovin.com' UNION
    SELECT 'gkeach5@cbc.ca' UNION
    SELECT 'emasham6@xing.com' UNION
    SELECT 'rcobbald7@house.gov' UNION
    SELECT 'rdrohan8@washingtonpost.com' UNION
    SELECT 'aebben9@arstechnica.com'
) SELECT
		email_id
  	  , POSITION('@' IN email_id)
      , STRPOS(email_id, '@')
  FROM
  		email_ids
  ORDER BY
  		2
	  , 1;

WITH email_ids AS (
    SELECT 'bsellan0@yellowbook.com' AS email_id UNION
    SELECT 'rstelljes1@illinois.edu' UNION
    SELECT 'mmalarkey2@webeden.co.uk' UNION
    SELECT 'emussared3@redcross.org' UNION
    SELECT 'livashin4@bloglovin.com' UNION
    SELECT 'gkeach5@cbc.ca' UNION
    SELECT 'emasham6@xing.com' UNION
    SELECT 'rcobbald7@house.gov' UNION
    SELECT 'rdrohan8@washingtonpost.com' UNION
    SELECT 'aebben9@arstechnica.com'
) SELECT
        email_id
      , POSITION('@' IN email_id)
      , STRPOS(email_id, '@')
  FROM
        email_ids
  WHERE
        POSITION('@' IN email_id) = 0
  ORDER BY
        2
      , 1;


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
      , POSITION('-' IN unique_id) AS pos
  FROM
        unique_ids
  ORDER BY
        unique_id;


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
      , POSITION('-' IN unique_id) AS pos
	  , POSITION('-' IN SUBSTRING(unique_id FROM 5)) AS pos
  FROM
        unique_ids
  ORDER BY
        unique_id;


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
      , POSITION('-' IN unique_id) AS pos_01
	  , POSITION('-' IN unique_id) + POSITION('-' IN SUBSTRING(unique_id FROM 5)) AS pos_02
  FROM
        unique_ids
  ORDER BY
        unique_id;