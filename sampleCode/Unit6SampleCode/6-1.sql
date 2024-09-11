SET SERVEROUTPUT ON

DECLARE
	TYPE t_movie IS TABLE OF mm_movie%ROWTYPE
		INDEX BY BINARY_INTEGER;
	movie t_movie;
	v_movie_count BINARY_INTEGER := 0;

BEGIN

	SELECT *
		BULK COLLECT INTO movie
		FROM mm_movie;
	
	-- a basic LOOP (like do-while in Java)
	LOOP
		v_movie_count := v_movie_count + 1;
		-- exit condition
		EXIT WHEN v_movie_count >= 10;
	END LOOP;
	DBMS_OUTPUT.PUT_LINE(v_movie_count);
	
	-- a WHILE loop (note the explicit LOOP keyword)
	v_movie_count := 0;
	WHILE v_movie_count < 10 LOOP
		v_movie_count := v_movie_count + 1;
	END LOOP;
	DBMS_OUTPUT.PUT_LINE(v_movie_count);
	
	-- a FOR loop (again, you must use LOOP)
	v_movie_count := 0;
	FOR i in 1..movie.COUNT LOOP
		DBMS_OUTPUT.PUT_LINE(movie(i).movie_title);
	END LOOP;
	
	-- same FOR loop but counting backwards
	v_movie_count := 0;
	FOR i in REVERSE 1..movie.COUNT LOOP
		DBMS_OUTPUT.PUT_LINE(movie(i).movie_title);
	END LOOP;
	
	-- mimic a step of 2 in the FOR loop (e.g. i += 2)
	-- by default, loops always increment by 1 (e.g. i++)
	-- since we're working with DB tables, pl/sql assumes we want ALL rows
	v_movie_count := 0;
	FOR i in 1..movie.COUNT LOOP
		-- skip current iteration when condition is true
		CONTINUE WHEN MOD(i,2) != 0;
		DBMS_OUTPUT.PUT_LINE(movie(i).movie_title);
	END LOOP;
	
	-- Note: yes you can use EXIT WHEN and CONTINUE WHEN with any loops
	-- but just like Java, it's considered bad practices to use these to
	-- control your loops (except the basic LOOP of course)
	-- if you find yourself doing this, rethink your loop exit control 
	-- conditions or the data set you're working on! (e.g. WHERE clause)
	
END;
/
