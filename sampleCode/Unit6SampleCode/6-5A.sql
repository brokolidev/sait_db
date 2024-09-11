SET SERVEROUTPUT ON

DECLARE
	CURSOR c_movie IS 
		SELECT *
			FROM mm_movie;

BEGIN

	FOR r_movie IN c_movie LOOP
		-- imagine this new value will be stored back to DB
		r_movie.movie_value := r_movie.movie_value + 2;
	END LOOP;

END;
/
