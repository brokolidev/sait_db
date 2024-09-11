SET SERVEROUTPUT ON

DECLARE
	TYPE t_movie IS TABLE OF mm_movie%ROWTYPE
		INDEX BY BINARY_INTEGER;
	movie t_movie;
	v_counter_1 BINARY_INTEGER := 0;
	v_counter_2 BINARY_INTEGER := 0;
	v_counter_3 BINARY_INTEGER := 0;
	v_counter_4 BINARY_INTEGER := 0;
	v_counter_5 BINARY_INTEGER := 0;

BEGIN

	SELECT *
		BULK COLLECT INTO movie
		FROM mm_movie;
		
	FOR i IN 1..movie.COUNT LOOP
		-- the basic CASE: just like switch/case in Java
		CASE movie(i).movie_cat_id
			WHEN 1 THEN v_counter_1 := v_counter_1 + 1;
			WHEN 2 THEN v_counter_2 := v_counter_2 + 1;
			WHEN 3 THEN v_counter_3 := v_counter_3 + 1;
			WHEN 4 THEN v_counter_4 := v_counter_4 + 1;
			WHEN 5 THEN v_counter_5 := v_counter_5 + 1;
			-- like the default case in Java but it's not optional!
			-- if none of the above WHEN matches, you will get an error
			-- unless you have this ELSE here!
			ELSE DBMS_OUTPUT.PUT_LINE(movie(i).movie_title || ' has an invalid cat id.');
		END CASE;
	END LOOP;
	
	DBMS_OUTPUT.PUT_LINE('There are ' || v_counter_1 || ' movies in category 1.');
	DBMS_OUTPUT.PUT_LINE('There are ' || v_counter_2 || ' movies in category 2.');
	DBMS_OUTPUT.PUT_LINE('There are ' || v_counter_3 || ' movies in category 3.');
	DBMS_OUTPUT.PUT_LINE('There are ' || v_counter_4 || ' movies in category 4.');
	DBMS_OUTPUT.PUT_LINE('There are ' || v_counter_5 || ' movies in category 5.');
	
END;
/
