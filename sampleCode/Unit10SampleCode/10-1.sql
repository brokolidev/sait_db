-- test program for auditing DMLs on mm_movie using the log triggers
SET SERVEROUTPUT ON

BEGIN

	-- test 1: update just one value = one log entry
	UPDATE mm_movie
		SET movie_value = 9
		WHERE movie_id = 11;
	
	-- test 2: update two values = two log entries
	UPDATE mm_movie
		SET movie_value = 9, movie_qty = 9
		WHERE movie_id = 12;
	
	-- test 3: insert a row = one log entry
	INSERT INTO mm_movie
		values (14, 'The Princess Bride', 4, 25, 10);
		
	-- test 4: delete a row = one log entry
	DELETE FROM mm_movie
		WHERE movie_id = 14;
	
	-- COMMIT;

END;
/
