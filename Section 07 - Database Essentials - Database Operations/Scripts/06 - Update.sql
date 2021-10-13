UPDATE
	users 
SET
	user_role = 'A' 
WHERE
	user_id = 1;


UPDATE 
	users
SET
    user_email_validated = true,
    is_active = true;


UPDATE 
	users
SET
    user_email_id = UPPER(user_email_id);


ALTER TABLE
	users
ADD COLUMN
	user_full_name VARCHAR(50);


UPDATE
	users
SET
	user_full_name = UPPER(CONCAT(user_first_name, ' ', user_last_name));