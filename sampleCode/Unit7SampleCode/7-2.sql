SET SERVEROUTPUT ON

DECLARE
	r_movie mm_movie%ROWTYPE;

BEGIN

	SELECT *
		INTO r_movie
		FROM mm_movie
		WHERE movie_id = 99; -- exception raised!
		-- execution of program now 'jumps' out from this point to the EXCEPTION block!
	DBMS_OUTPUT.PUT_LINE('There are ' || r_movie.movie_qty || ' copies of ' || r_movie.movie_title);
	
-- exception block is always after the main program code and just before the END
EXCEPTION
	-- catching some predefined oracle exceptions!
	-- 1) exception handler for no rows returned
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('No movie matching this ID.');
	-- 2) exception handler for more than one row returned
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE('There are more than one movie matching this ID.');
	
	-- Important Note! After an exception is raised, execution of program does NOT
	-- return back to the point it came from, regardless of whether the exception
	-- was caught/handled or not.

END;
/
