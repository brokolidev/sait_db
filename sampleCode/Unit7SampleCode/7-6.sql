SET SERVEROUTPUT ON

DECLARE
	v_value BINARY_INTEGER := 99;
	-- declare the named exception
	e_invalid_movie_id EXCEPTION;

BEGIN

	UPDATE mm_movie
		SET movie_value = v_value
		WHERE movie_id = 100;
	
	-- check for 0 rows updated
	IF SQL%NOTFOUND THEN
		-- Houston we have a problem!
		-- signal for exception handler - RAISE an exception!
		-- note: only use this for anonymous blocks
		RAISE e_invalid_movie_id;
	END IF;
	
	COMMIT;
	
EXCEPTION
	WHEN e_invalid_movie_id THEN
		DBMS_OUTPUT.PUT_LINE('NOT UPDATED - No movie matching this ID.');

END;
/
