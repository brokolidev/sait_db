SET SERVEROUTPUT ON

DECLARE
	TYPE t_movie IS TABLE OF mm_movie%ROWTYPE
		INDEX BY BINARY_INTEGER;
	movie t_movie;
	v_movie_worth NUMBER(5,2) := 0;

BEGIN

	SELECT *
		BULK COLLECT INTO movie
		FROM mm_movie;
		
	FOR i IN 1..movie.COUNT LOOP
		IF movie(i).movie_cat_id = 1 THEN
			v_movie_worth := movie(i).movie_value * 2.1;
		ELSIF movie(i).movie_cat_id = 2 THEN
			v_movie_worth := movie(i).movie_value * 0.7;
		ELSIF movie(i).movie_cat_id = 3 THEN
			v_movie_worth := movie(i).movie_value * 0.4;
		ELSIF movie(i).movie_cat_id = 4 THEN
			v_movie_worth := movie(i).movie_value * 1.2;
		ELSE
			v_movie_worth := movie(i).movie_value * 3.3;
		END IF;
		DBMS_OUTPUT.PUT_LINE(movie(i).movie_title || ' is worth ' || v_movie_worth || '.');
		
		-- equivalent code using a CASE expression
		-- CASE can be used as part of another statement!
		-- (isn't it beautiful?!?!)
		v_movie_worth := CASE movie(i).movie_cat_id
			WHEN 1 THEN movie(i).movie_value * 2.1
			WHEN 2 THEN movie(i).movie_value * 0.7
			WHEN 3 THEN movie(i).movie_value * 0.4
			WHEN 4 THEN movie(i).movie_value * 1.2
			ELSE movie(i).movie_value * 3.3
		-- note it's just END here, not END CASE
		END;
		DBMS_OUTPUT.PUT_LINE(movie(i).movie_title || ' is worth ' || v_movie_worth || '.');
		
	END LOOP;
	
END;
/
