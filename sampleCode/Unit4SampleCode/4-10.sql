SET SERVEROUTPUT ON

DECLARE
	r_movie mm_movie%ROWTYPE;

BEGIN

	-- set up the values for each field in record
	r_movie.movie_id := mm_rental_seq.NEXTVAL;
	r_movie.movie_title := 'Interstellar';
	r_movie.movie_cat_id := 1;
	r_movie.movie_value := 30;
	r_movie.movie_qty := 20;
	-- add record to table
	INSERT INTO mm_movie
		VALUES r_movie;
	
END;
/
