-- Simple DML trigger example
-- trigger name prefixes (see Module 8 slide 4)
CREATE OR REPLACE TRIGGER movie_quantity_update_aur
	-- must specify the triggering event and timing point
	-- UPDATE can also specify the field to fire the trigger on with OF
	AFTER UPDATE OF checkin_date ON mm_rental 	-- trigger body will run AFTER
												-- the field is updated in table
	-- can specify multiple triggering events with OR
	-- AFTER INSERT OR UPDATE ON mm_rental
	FOR EACH ROW -- row-level trigger (omit for statement-level)
	-- can add specific conditions to a trigger with WHEN (condition)
	-- WHEN (OLD.rental_ID <> 11)
	-- triggers are created in ENABLE mode by default
	-- DISABLE

-- don't need DECLARE if not declaring anything
DECLARE
	v_movie_qty NUMBER(2) := 0;

BEGIN

	-- bind variables OLD and NEW (only for row-level triggers) to access
	-- values before and after the triggering event (DML statement)
	-- UPDATE will have both values, INSERT only has NEW, DELETE only has OLD
	-- note: must include the : in trigger body
	SELECT movie_qty
		INTO v_movie_qty
		FROM mm_movie
		WHERE movie_ID = :OLD.movie_ID;
		
	v_movie_qty := v_movie_qty + 1;
	
	UPDATE mm_movie
		SET movie_qty = v_movie_qty
		WHERE movie_id = :NEW.movie_id;
	
	-- just for showing the OLD/NEW values for our UPDATE event
	-- DBMS_OUTPUT.PUT_LINE('OLD: ' || :OLD.checkin_date);
	-- DBMS_OUTPUT.PUT_LINE('NEW: ' || :NEW.checkin_date);
	
	-- this will cause an infinite loop!
	-- UPDATE mm_rental 
		-- SET checkin_date to SYSDATE
		-- WHERE rental_ID = 1; -- or whichever row
		
	-- if multiple triggering events are defined, you can add conditional
	-- predicates to do different things for each event!
	-- personal note: i really don't like this approach, why not just make
	-- multiple triggers?!?!
	IF INSERTING THEN
		NULL; -- pretend i'm doing something interesting here!
	END IF;
	IF UPDATING ('checkin_date') THEN
		NULL; -- pretend i'm doing something interesting here!
	END IF;
	IF UPDATING ('member_id') THEN
		NULL; -- pretend i'm doing something interesting here!
	END IF;

END movie_quantity_update_aur;
/
