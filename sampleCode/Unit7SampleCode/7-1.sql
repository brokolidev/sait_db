SET SERVEROUTPUT ON

DECLARE
	r_movie mm_movie%ROWTYPE;

BEGIN

	SELECT *
		INTO r_movie
		FROM mm_movie
		WHERE movie_id = 99; -- no such movie ID
	DBMS_OUTPUT.PUT_LINE('There are ' || r_movie.movie_qty || ' copies of ' || r_movie.movie_title);
	
END;
/
