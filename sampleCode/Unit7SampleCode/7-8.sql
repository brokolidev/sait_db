SET SERVEROUTPUT ON

DECLARE
	v_value BINARY_INTEGER := 99;
	v_err_num VARCHAR2(10);
	v_err_msg VARCHAR2(100);

BEGIN

	UPDATE mm_movie
		SET movie_value = v_value
		WHERE movie_id = 100; -- no such movie ID
		
	IF SQL%NOTFOUND THEN
		-- this allows us to make our own error codes and pass it back
		-- to the caller environment! (e.g. JavaSE or JavaEE app)
		-- error code must be between -20000 and -20999
		-- error message is a string up to 2048 bytes long
		RAISE_APPLICATION_ERROR(-20001, 'Invalid movie ID.');
	END IF;
	
	COMMIT;
	
EXCEPTION
	WHEN OTHERS THEN
		ROLLBACK;
		DBMS_OUTPUT.PUT_LINE('Error code: ' || SQLCODE);
		DBMS_OUTPUT.PUT_LINE('Error message: ' || SQLERRM);
		v_err_num := SQLCODE;
		v_err_msg := SUBSTR(SQLERRM, 1, 100);
		INSERT INTO error_log (errnum, errmsg)
			VALUES (v_err_num, v_err_msg);
		COMMIT;

END;
/
