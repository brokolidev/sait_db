SET SERVEROUTPUT ON

DECLARE
	v_movie_title VARCHAR(40) := 'Donnie Darko';
	-- v_movie_title mm_movie.movie_title%TYPE;
	v_movie_qty NUMBER(2) := 20;
	-- v_movie_qty mm_movie.movie_qty%TYPE;

BEGIN

	SELECT movie_title, movie_qty
		INTO v_movie_title, v_movie_qty
		FROM mm_movie
		WHERE movie_id = 13;
	DBMS_OUTPUT.PUT_LINE('There are ' || v_movie_qty || ' copies of ' || v_movie_title);
	
END;
/
