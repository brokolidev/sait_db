SET SERVEROUTPUT ON

DECLARE
	v_value BINARY_INTEGER := 99;

BEGIN

	UPDATE mm_movie
		SET movie_value = v_value
		WHERE movie_id = 100; -- movie_id doesn't exist
	-- no oracle error! but no rows updated...
		
	COMMIT;

END;
/
