SET SERVEROUTPUT ON

DECLARE
	CURSOR c_movie IS 
		SELECT *
			FROM mm_movie;
		
	v_count BINARY_INTEGER := 0;
		
	CURSOR c_type IS
		SELECT *
			FROM mm_movie_type
	FOR UPDATE; 
	
	v_type mm_movie_type.movie_cat_id%TYPE;

BEGIN

	FOR r_type IN c_type LOOP
		v_type := r_type.movie_cat_id;
		v_count := 0;
		FOR r_movie IN c_movie LOOP
			IF r_movie.movie_cat_id = v_type THEN
				v_count := v_count + 1;
			END IF;
		END LOOP;
		UPDATE mm_movie_type
			SET movie_count = v_count
			WHERE CURRENT OF c_type;
	END LOOP;
	-- COMMIT;

END;
/
