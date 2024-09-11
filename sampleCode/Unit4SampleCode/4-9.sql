SET SERVEROUTPUT ON

DECLARE
	-- create a record based on table structure
	r_movie mm_movie%ROWTYPE;

BEGIN

	-- use the record variable to store data from row in DB
	SELECT *
		INTO r_movie
		FROM mm_movie
		WHERE movie_id = 13;
	-- retrieve data from record accessed through table column names
	DBMS_OUTPUT.PUT_LINE('There are ' || r_movie.movie_qty || ' copies of ' || r_movie.movie_title);
	
END;
/
