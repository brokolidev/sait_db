SET SERVEROUTPUT ON

DECLARE
	CURSOR c_movie IS 
		SELECT *
			FROM mm_movie
	-- tells Oracle we'll be using this cursor to update something
	FOR UPDATE; 

BEGIN

	FOR r_movie IN c_movie LOOP
		IF r_movie.movie_cat_id = 2 THEN
			UPDATE mm_movie SET movie_value = r_movie.movie_value + 2
				-- update only current row of cursor
				WHERE CURRENT OF c_movie;
		END IF;
	END LOOP;
	-- the following is only commented out for testing purposes
	-- don't forget to do this COMMIT when you submit your assignments!
	-- COMMIT;

END;
/
