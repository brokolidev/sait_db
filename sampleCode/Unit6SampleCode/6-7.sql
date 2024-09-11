SET SERVEROUTPUT ON

-- this program is looking for all overdue movies then suspend the member

DECLARE
	
	CURSOR c_overdue IS
		SELECT 
			ren.checkout_date,
			mem.first first_name,
			mem.last last_name, 
			mem.member_id id,
			mem.suspension suspend,
			mov.movie_title,
			mtyp.movie_category,
			ptyp.payment_methods
			FROM mm_rental ren
				LEFT OUTER JOIN mm_member mem ON (mem.member_id = ren.member_id)
				LEFT OUTER JOIN mm_movie mov ON (mov.movie_id = ren.movie_id)
				LEFT OUTER JOIN mm_movie_type mtyp ON (mtyp.movie_cat_id = mov.movie_cat_id)
				LEFT OUTER JOIN mm_pay_type ptyp ON (ptyp.payment_methods_id = ren.payment_methods_id)
			WHERE ren.checkin_date IS NULL
	FOR UPDATE;
	-- FOR UPDATE OF mem.suspension;

BEGIN

	FOR r_overdue IN c_overdue LOOP
		IF r_overdue.suspend = 'N' THEN
			UPDATE mm_member 
				SET suspension = 'Y'
				WHERE mm_member.member_id = r_overdue.id;
			DBMS_OUTPUT.PUT_LINE(r_overdue.first_name || ' ' || 
				r_overdue.last_name || ' is now suspended.');
		END IF;
	END LOOP;
	-- COMMIT;

END;
/
