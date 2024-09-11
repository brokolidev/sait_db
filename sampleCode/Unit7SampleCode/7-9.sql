SET SERVEROUTPUT ON

-- START OF OUTER (PARENT) ANONYMOUS BLOCK
DECLARE
	CURSOR c_movie IS 
		SELECT *
		FROM mm_movie;
	v_decrease BINARY_INTEGER := 1;
	
BEGIN

	FOR r_movie IN c_movie LOOP
		
		-- START OF INNER (CHILD) ANONYMOUS BLOCK
		DECLARE
			-- these is a local variable to the inner anonymous block 
			-- i.e. scope: not available outside this block
			v_new_movie_value NUMBER(5,2) := r_movie.movie_value - v_decrease;
			-- this exception is also only available inside this inner
			-- anonymous block
			e_movie_value_too_low EXCEPTION;
		BEGIN 
		
			IF v_new_movie_value < 7 THEN
				-- this will go directly to the exception block on line 37
				RAISE e_movie_value_too_low;
			END IF;
		
			UPDATE mm_movie
				SET movie_value = v_new_movie_value
				WHERE movie_id = r_movie.movie_id;
		
			COMMIT;
		
		-- if the correct handler is found here, then the exception will be handled
		-- here and continue to the END of the inner anonymous block
		EXCEPTION
			WHEN e_movie_value_too_low THEN
				DBMS_OUTPUT.PUT_LINE('Cannot decrease ' || r_movie.movie_title || '.');
		-- if the correct handler is NOT found here, the program will 'jump' out to
		-- the next exception block of the (next) outer anonymous block! (line 51)
		END;
		-- END OF INNER (CHILD) ANONYMOUS BLOCK
		
		-- because the inner block has ended, the cursor for loop of the outer block
		-- will continue to the next iteration!
	END LOOP;

-- any exceptions not caught in any of the inner anonymous blocks will propagate 
-- here (catch all - great place for our WHEN OTHERS!)
EXCEPTION
	WHEN OTHERS THEN
		ROLLBACK;
		DBMS_OUTPUT.PUT_LINE('Error code: ' || SQLCODE);
		DBMS_OUTPUT.PUT_LINE('Error message: ' || SQLERRM);
		COMMIT;
			
END;
-- END OF OUTER (PARENT) ANONYMOUS BLOCK
/
