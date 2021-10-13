SELECT
	*
FROM
	information_schema.columns
WHERE
	table_catalog = 'sms_db'
AND
	table_schema = 'public'
LIMIT
	10;