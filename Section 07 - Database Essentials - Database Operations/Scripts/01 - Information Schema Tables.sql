SELECT
	*
FROM
	information_schema.tables 
WHERE
	table_catalog = 'sms_db'
AND
	table_schema = 'public'
LIMIT
	10;