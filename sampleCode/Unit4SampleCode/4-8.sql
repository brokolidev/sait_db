SET SERVEROUTPUT ON

DECLARE
	-- create a record data type
	TYPE type_movie IS RECORD
	(
		id mm_movie.movie_id%TYPE,
		title mm_movie.movie_title%TYPE,
		cat_id mm_movie.movie_cat_id%TYPE,
		val mm_movie.movie_value%TYPE,
		qty mm_movie.movie_qty%TYPE
	);
	-- create a variable of record type
	rec_movie type_movie;

BEGIN

	-- use the record variable to store data from row in DB
	SELECT *
		INTO rec_movie
		FROM mm_movie
		WHERE movie_id = 13;
	-- retrieve data from record fields
	DBMS_OUTPUT.PUT_LINE('There are ' || rec_movie.qty || ' copies of ' || rec_movie.title);
	
END;
/
