DECLARE
	CURSOR c_movie_return IS
		SELECT *
		FROM mm_return;

	v_err_num VARCHAR2(10);
	v_err_msg VARCHAR2(100);	

BEGIN

	FOR r_movie_return IN c_movie_return LOOP
		
		DECLARE
			v_rental_id NUMBER(4) := 0;
			v_movie_id NUMBER(4) := 0;
			v_movie_qty NUMBER(2) := 0;
		
		BEGIN

			BEGIN
			
				BEGIN
				
					SELECT movie_id, movie_qty
						INTO v_movie_id, v_movie_qty
						FROM mm_movie
						WHERE movie_title = r_movie_return.movie_title;
					
				EXCEPTION
					WHEN no_data_found THEN
						RAISE_APPLICATION_ERROR(-20001, 'No movie matching ' || r_movie_return.movie_title || '.');
				
				END;

				SELECT rental_id
					INTO v_rental_id
					FROM mm_rental
					WHERE movie_id = v_movie_id
						AND member_id = r_movie_return.member_id;

			EXCEPTION
				WHEN no_data_found THEN
					RAISE_APPLICATION_ERROR(-20002, 'No rental record for ' || r_movie_return.movie_title || ' from member ' || r_movie_return.member_ID || '.');
				WHEN too_many_rows THEN
					RAISE_APPLICATION_ERROR(-20003, 'More than one rental record for ' || r_movie_return.movie_title || ' from member ' || r_movie_return.member_ID || '.');
					
			END;
			
			UPDATE mm_rental 
			SET checkin_date = SYSDATE
			WHERE rental_id = v_rental_id;
			
			v_movie_qty := v_movie_qty + 1;
			
			UPDATE mm_movie
			SET movie_qty = v_movie_qty
			WHERE movie_id = v_movie_id;
			
			COMMIT;

		EXCEPTION
			WHEN OTHERS THEN
				ROLLBACK;
				v_err_num := SQLCODE;
				v_err_msg := SUBSTR(SQLERRM, 1, 100);
				INSERT INTO error_log
					VALUES (v_err_num, v_err_msg);
				COMMIT;
		   
		END;
  
	END LOOP;
	
END;
/
