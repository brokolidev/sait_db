-- same example code from module 7, now with (some) comments!

-- program to process movie returns
-- checks if the movie being returned matches a movie or rental in DB
-- updates inventory if everything checks out!

DECLARE
	-- simulate processing of movies being returned
	CURSOR c_movie_return IS
		SELECT *
		FROM mm_return;

	v_err_num VARCHAR2(10);
	v_err_msg VARCHAR2(100);	

BEGIN

	-- go through every movie being returned
	FOR r_movie_return IN c_movie_return LOOP
		
		DECLARE
			v_rental_id NUMBER(4) := 0;
			v_movie_id NUMBER(4) := 0;
			v_movie_qty NUMBER(2) := 0;
		
		BEGIN

			BEGIN
			
				BEGIN
				
					-- check the movie based on ID
					SELECT movie_id, movie_qty
						INTO v_movie_id, v_movie_qty
						FROM mm_movie
						WHERE movie_title = r_movie_return.movie_title;
					
				EXCEPTION
					-- not even a movie we have in DB
					WHEN no_data_found THEN
						RAISE_APPLICATION_ERROR(-20001, 'No movie matching ' || r_movie_return.movie_title || '.');
				
				END;

				-- check what's been rented out
				SELECT rental_id
					INTO v_rental_id
					FROM mm_rental
					WHERE movie_id = v_movie_id
						AND member_id = r_movie_return.member_id;

			EXCEPTION
				-- movie returned wasn't checked out
				WHEN no_data_found THEN
					RAISE_APPLICATION_ERROR(-20002, 'No rental record for ' || r_movie_return.movie_title || ' from member ' || r_movie_return.member_ID || '.');
				-- movie returned was checked out more than once
				WHEN too_many_rows THEN
					RAISE_APPLICATION_ERROR(-20003, 'More than one rental record for ' || r_movie_return.movie_title || ' from member ' || r_movie_return.member_ID || '.');
					
			END;
			
			-- return looks ok, set the return date
			UPDATE mm_rental 
				SET checkin_date = SYSDATE
				WHERE rental_id = v_rental_id;
			
			v_movie_qty := v_movie_qty + 1;
			
			-- movie returned correctly, so we have one more in inventory
			-- manually increase the quantity by one
			UPDATE mm_movie
				SET movie_qty = v_movie_qty
				WHERE movie_id = v_movie_id;
			
			-- commented out for testing
			-- COMMIT;

		EXCEPTION
			WHEN OTHERS THEN
				-- commented out for testing
				-- ROLLBACK;
				v_err_num := SQLCODE;
				v_err_msg := SUBSTR(SQLERRM, 1, 100);
				INSERT INTO error_log
					VALUES (v_err_num, v_err_msg);
				-- commented out for testing
				-- COMMIT;
		   
       END;
  
	-- all these embedded blocks is to enable processing of all movie returns
	END LOOP;
	
END;
/
