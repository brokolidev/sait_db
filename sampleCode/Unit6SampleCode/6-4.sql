SET SERVEROUTPUT ON

DECLARE
	CURSOR c_movie IS 
		SELECT *
			FROM mm_movie;
	-- no need to declare a record variable when using cursor FOR loops!
	v_movie_count BINARY_INTEGER := 0;

BEGIN

	-- the FOR loop does OPEN, FETCH and CLOSE for us!
	FOR r_movie IN c_movie LOOP
		v_movie_count := v_movie_count + 1;
	END LOOP; -- and checks for EXIT WHEN %NOTFOUND
	DBMS_OUTPUT.PUT_LINE(v_movie_count);

END;
/
