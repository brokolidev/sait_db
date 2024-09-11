SET SERVEROUTPUT ON

DECLARE
	v_value BINARY_INTEGER := 999;

BEGIN

	-- will fail due to constraint 5 <= movie_value <= 100
	UPDATE mm_movie
		SET movie_value = v_value
		WHERE movie_id = 1;
		
	COMMIT;

END;
/
