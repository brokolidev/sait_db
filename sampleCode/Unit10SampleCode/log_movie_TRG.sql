-- 4 separate simple DML triggers to log events on mm_movie table
SET SERVEROUTPUT ON

-- trigger 1: update movie value
CREATE OR REPLACE TRIGGER log_movie_value_aur
	AFTER UPDATE OF movie_value ON mm_movie
	FOR EACH ROW

DECLARE
k_date CONSTANT DATE := TO_DATE('Jan-01-2000', 'Mon-DD-YYYY');
	
BEGIN

	IF SYSDATE < k_date THEN
        RAISE_APPLICATION_ERROR(-20001, 'Problem with system date');
    END IF;

	INSERT INTO audit_movie (username, date_time, event, old_value, new_value)
		VALUES (SYS_CONTEXT ('USERENV', 'SESSION_USER'), SYSDATE, :NEW.movie_ID || ' movie value updated.', :OLD.movie_value, :NEW.movie_value);

END log_movie_value_aur;
/

-- trigger 2: update movie quantity
CREATE OR REPLACE TRIGGER log_movie_qty_aur
	AFTER UPDATE OF movie_qty ON mm_movie
	FOR EACH ROW
	
DECLARE
k_date CONSTANT DATE := TO_DATE('Jan-01-2000', 'Mon-DD-YYYY');

BEGIN

	IF SYSDATE < k_date THEN
        RAISE_APPLICATION_ERROR(-20001, 'Problem with system date');
    END IF;
	
	INSERT INTO audit_movie (username, date_time, event, old_value, new_value)
		VALUES (SYS_CONTEXT ('USERENV', 'SESSION_USER'), SYSDATE, :NEW.movie_ID || ' movie qty updated.', :OLD.movie_value, :NEW.movie_value);

END log_movie_qty_aur;
/

-- trigger 3: insert new movie entry
CREATE OR REPLACE TRIGGER log_add_movie_air
	AFTER INSERT ON mm_movie
	FOR EACH ROW
	
DECLARE
k_date CONSTANT DATE := TO_DATE('Jan-01-2000', 'Mon-DD-YYYY');

BEGIN

	IF SYSDATE < k_date THEN
        RAISE_APPLICATION_ERROR(-20001, 'Problem with system date');
    END IF;
	
	INSERT INTO audit_movie (username, date_time, event, old_value, new_value)
		VALUES (SYS_CONTEXT ('USERENV', 'SESSION_USER'), SYSDATE, :NEW.movie_ID || ' ' || :NEW.movie_title || ' added.', 'NULL', '*');

END log_add_movie_air;
/

-- trigger 4: delete a movie entry
CREATE OR REPLACE TRIGGER log_rm_movie_adr
	AFTER DELETE ON mm_movie
	FOR EACH ROW
	
DECLARE
k_date CONSTANT DATE := TO_DATE('Jan-01-2000', 'Mon-DD-YYYY');
v_count BINARY_INTEGER := 0;

BEGIN

	IF SYSDATE < k_date THEN
        RAISE_APPLICATION_ERROR(-20001, 'Problem with system date');
    END IF;
	
	INSERT INTO audit_movie (username, date_time, event, old_value, new_value)
		VALUES (SYS_CONTEXT ('USERENV', 'SESSION_USER'), SYSDATE, :NEW.movie_ID || ' ' || :NEW.movie_title || ' removed.', 'NULL', '*');
	
	-- mutating table error! rollbacked so none of the other entries were inserted!
	SELECT COUNT(*)
		INTO v_count
		FROM mm_movie; -- same table as the triggering event
	DBMS_OUTPUT.PUT_LINE('There are ' || v_count || ' movies left.');

END log_rm_movie_adr;
/