-- one compound trigger to perform the logging as the 4 simple DML triggers
-- when to use this? and limitations/restictions on CTRG
-- http://viralpatel.net/blogs/compound-triggers-in-oracle-11g-tutorial-example/

SET SERVEROUTPUT ON

CREATE OR REPLACE TRIGGER log_movie_compound
	FOR INSERT OR UPDATE OR DELETE -- FOR to specify which DMLs will fire this trigger
	ON mm_movie
	COMPOUND TRIGGER -- must explicitly state this is a CTRG

-- global variables to share!
k_date CONSTANT DATE := TO_DATE('Jan-01-2000', 'Mon-DD-YYYY');

-- compound triggers allows you to explicitly specify what to do at each
-- timing point on a single table (note there's no BEFORE/AFTER and FOR EACH
-- ROW in the header)

BEFORE STATEMENT IS
    BEGIN
		DBMS_OUTPUT.PUT_LINE('Before statement...');
		IF SYSDATE < k_date THEN
			RAISE_APPLICATION_ERROR(-20001, 'Problem with system date');
		END IF;

END BEFORE STATEMENT;

BEFORE EACH ROW IS
	BEGIN
		DBMS_OUTPUT.PUT_LINE('Before row...');
END BEFORE EACH ROW;

AFTER EACH ROW IS
	-- local variable for AFTER EACH ROW
	v_user VARCHAR2(25) := SYS_CONTEXT ('USERENV', 'SESSION_USER');
	
	BEGIN
		DBMS_OUTPUT.PUT_LINE('After row...');
		IF INSERTING THEN
			INSERT INTO audit_movie
				VALUES (v_user, SYSDATE, :NEW.movie_ID || ' ' || :NEW.movie_title || ' added.', 'NULL', '*');
		ELSIF UPDATING THEN
			IF (:OLD.movie_value <> :NEW.movie_value) THEN
				INSERT INTO audit_movie 
					VALUES (v_user, SYSDATE, :NEW.movie_ID || ' movie value updated.', :OLD.movie_value, :NEW.movie_value);
			END IF;
			IF (:OLD.movie_qty <> :NEW.movie_qty) THEN		
				INSERT INTO audit_movie
					VALUES (v_user, SYSDATE, :NEW.movie_ID || ' movie qty updated.', :OLD.movie_value, :NEW.movie_value);
			END IF;
		ELSIF DELETING THEN
			INSERT INTO audit_movie
				VALUES (v_user, SYSDATE, :OLD.movie_ID || ' ' || :OLD.movie_title || ' removed.', '*', 'NULL');
		END IF;
	
END AFTER EACH ROW;

AFTER STATEMENT IS
	v_count BINARY_INTEGER := 0;
	
	BEGIN
		DBMS_OUTPUT.PUT_LINE('After statement...');
		-- now we can still output this line AND log each row deleted w/o mutating table error!
		IF DELETING THEN
			SELECT COUNT(*)
				INTO v_count
				FROM mm_movie;
			DBMS_OUTPUT.PUT_LINE('There are ' || v_count || ' movies left.');
		END IF;
END AFTER STATEMENT;

END log_movie_compound;
/