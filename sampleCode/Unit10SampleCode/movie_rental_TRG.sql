-- the other demo triggers may interferes with this one so let's just go bye-bye!
DROP TRIGGER movie_quantity_update_aur;
DROP TRIGGER log_movie_compound;

-- instead of trigger example
CREATE OR REPLACE TRIGGER movie_rental_vw_add
	-- key here is INSTEAD OF to specify the triggering event
	INSTEAD OF INSERT ON vw_movie_rental
	FOR EACH ROW

DECLARE
	v_movie_id NUMBER(4);
	v_member_id NUMBER(4);
	
BEGIN

	-- working with the base tables
	SELECT movie_id
		INTO v_movie_id
		FROM mm_movie
		WHERE movie_title = :NEW.movie_title;
	
	SELECT member_id
		INTO v_member_id
		FROM mm_member
		WHERE last = :NEW.last;
		
	INSERT INTO mm_rental
		values (mm_rental_seq.NEXTVAL, v_member_id, v_movie_id, SYSDATE, NULL, NULL);
	
END movie_rental_vw_add;
/