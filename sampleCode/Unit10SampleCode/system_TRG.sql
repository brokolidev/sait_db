-- trigger 1: user logins
CREATE OR REPLACE TRIGGER log_user_login
	-- key here is BEFORE/AFTER <event>
	AFTER LOGON
	-- DATABASE/SCHEMA
	ON DATABASE
	
BEGIN

	INSERT INTO audit_DB (username, date_time, event, old_value, new_value)
		VALUES (SYS_CONTEXT ('USERENV', 'SESSION_USER'), SYSDATE, 'User logged in.', NULL, NULL);

END log_user_login;
/

-- trigger 2: DB shutdowns
CREATE OR REPLACE TRIGGER log_db_shutdown
	BEFORE SHUTDOWN
	ON DATABASE
	
BEGIN

	INSERT INTO audit_DB (username, date_time, event, old_value, new_value)
		VALUES (SYS_CONTEXT ('USERENV', 'SESSION_USER'), SYSDATE, 'User is shutting down the DB.', NULL, NULL);

END log_db_shutdown;
/

-- trigger 3: bad logins
CREATE OR REPLACE TRIGGER log_server_errors
	AFTER SERVERERROR
	ON DATABASE
	
BEGIN

	IF (IS_SERVERERROR(1017)) THEN
		INSERT INTO audit_DB (username, date_time, event, old_value, new_value)
			VALUES (SYS_CONTEXT ('USERENV', 'OS_USER'), SYSDATE, 'Login attempt: Invalid username/password.', NULL, NULL);
	ELSIF (IS_SERVERERROR(1005)) THEN
		INSERT INTO audit_DB (username, date_time, event, old_value, new_value)
			VALUES (SYS_CONTEXT ('USERENV', 'OS_USER'), SYSDATE, 'Login attempt: Null password.', NULL, NULL);
	ELSIF (IS_SERVERERROR(1004)) THEN
		INSERT INTO audit_DB (username, date_time, event, old_value, new_value)
			VALUES (SYS_CONTEXT ('USERENV', 'OS_USER'), SYSDATE, 'Login attempt: Automatic logon using default username.', NULL, NULL);
	ELSIF (IS_SERVERERROR(1045)) THEN
		INSERT INTO audit_DB (username, date_time, event, old_value, new_value)
			VALUES (SYS_CONTEXT ('USERENV', 'OS_USER'), SYSDATE, 'Login attempt: User does not have CREATE SESSION privileges.', NULL, NULL);
	END IF;
			
END log_server_errors;
/

-- trigger 4: prevent table deletes
CREATE OR REPLACE TRIGGER log_drop_tables
	BEFORE DROP 
	ON DATABASE
DECLARE
	PRAGMA AUTONOMOUS_TRANSACTION;
	
BEGIN

	INSERT INTO audit_DB (username, date_time, event, old_value, new_value)
		VALUES (SYS_CONTEXT ('USERENV', 'SESSION_USER'), SYSDATE, 'User attempted to drop table.', ora_dict_obj_name, NULL);
	COMMIT;
	
	RAISE_APPLICATION_ERROR(-20999, 'User does not have permissions to drop table, please contact your Database Administrator.');

END log_drop_tables;
/