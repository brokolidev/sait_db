SET SERVEROUTPUT ON

DECLARE
	v_value BINARY_INTEGER := 99;
	e_invalid_movie_id EXCEPTION;
	-- variables to store error code and error message
	v_err_num VARCHAR2(10);
	v_err_msg VARCHAR2(100);

BEGIN

	UPDATE mm_movie
		SET movie_value = v_value
		WHERE movie_id = 100;
		
	IF SQL%NOTFOUND THEN
		RAISE e_invalid_movie_id;
	END IF;
	
	COMMIT;
	
EXCEPTION
	WHEN e_invalid_movie_id THEN
		DBMS_OUTPUT.PUT_LINE('No movie matching this ID.');
	-- all other exceptions will be caught here
	WHEN OTHERS THEN
		-- when others, you don't know what really happened!
		-- better safe than sorry so let's end the transaction and undo changes
		ROLLBACK;
		-- display the error code and message associated with the exceptions
		-- retrieved from the DBMS (SQLCODE/SQLERRM are only for Oracle)
		DBMS_OUTPUT.PUT_LINE('Error code: ' || SQLCODE);
		DBMS_OUTPUT.PUT_LINE('Error message: ' || SQLERRM);
		-- or more importantly: log the error into table so we can review it later!
		v_err_num := SQLCODE;
		v_err_msg := SUBSTR(SQLERRM, 1, 100);
		INSERT INTO error_log (errnum, errmsg)
			VALUES (v_err_num, v_err_msg);
		COMMIT;

END;
/
