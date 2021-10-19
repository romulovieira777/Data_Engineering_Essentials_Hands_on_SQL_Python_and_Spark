-- String Replacement
SELECT
    REPLACE('Halo World', 'alo', 'ello') AS result;


SELECT
    OVERLAY('Halo World' PLACING 'ello' FROM 2 FOR 3) AS result;


WITH unique_ids AS (
    SELECT '241-80-7115' AS unique_id UNION
    SELECT '694-30-6851' UNION
    SELECT '586-92-5361' UNION
    SELECT '884-65-2844' UNION
    SELECT '876-99-5856' UNION
    SELECT '831-59-5593' UNION
    SELECT '399-88-3617' UNION
    SELECT '733-17-4217' UNION
    SELECT '873-68-9778' UNION
    SELECT '487-21-9802'
) SELECT
    unique_id
  , REPLACE(unique_id, '-', ' ')                AS unique_id_replaced
  , TRANSLATE(unique_id, '-', ' ')              AS unique_id_translated
  , OVERLAY(unique_id PLACING ' ' FROM 4 FOR 1) AS unique_id_overlaid
FROM
    unique_ids
ORDER BY
    unique_id;


WITH unique_ids AS (
    SELECT '241-80-7115' AS unique_id UNION
    SELECT '694-30:6851' UNION
    SELECT '586-92-5361' UNION
    SELECT '884:65-2844' UNION
    SELECT '876/99-5856' UNION
    SELECT '831-59:5593' UNION
    SELECT '399-88-3617' UNION
    SELECT '733:17-4217' UNION
    SELECT '873:68-9778' UNION
    SELECT '487-21/9802'
) SELECT
    unique_id
  , REPLACE(REPLACE(unique_id, '-', ' '), ':', ' ')                               AS unique_id_replaced
  , TRANSLATE(unique_id, '-:/', '   ')                                            AS unique_id_translated
  , OVERLAY(OVERLAY(unique_id PLACING ' ' FROM 4 FOR 1) PLACING ' ' FROM 7 FOR 1) AS unique_id_overlaid
FROM
    unique_ids
ORDER BY
    unique_id;


SELECT
    TRANSLATE('+86 (238) 954-9649', '+() -', '0') AS result;


WITH phone_numbers AS (
    SELECT '+86 (238) 954-9649' AS phone_number UNION
    SELECT '+420 (331) 900-5807' UNION
    SELECT '+1 (320) 484-4495' UNION
    SELECT '+45 (238) 961-9801' UNION
    SELECT '+51 (123) 545-6543' UNION
    SELECT '+63 (308) 354-2560' UNION
    SELECT '+86 (433) 851-1260' UNION
    SELECT '+63 (332) 705-0319' UNION
    SELECT '+351 (147) 359-3767' UNION
    SELECT '+57 (714) 557-0468'
) SELECT
    phone_number 
  , TRANSLATE(phone_number, '+() -', '') phone_number_int
FROM
    phone_numbers
ORDER BY
    phone_number;