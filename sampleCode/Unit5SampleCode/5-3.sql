SET SERVEROUTPUT ON

DECLARE
	TYPE t_movie IS TABLE OF mm_movie%ROWTYPE
		INDEX BY BINARY_INTEGER;
	movie t_movie;
	v_counter_1 BINARY_INTEGER := 0;
	v_counter_2 BINARY_INTEGER := 0;
	v_counter_3 BINARY_INTEGER := 0;

BEGIN

	SELECT *
		BULK COLLECT INTO movie
		FROM mm_movie;
		
	FOR i IN 1..movie.COUNT LOOP
		-- searched CASE: like switch/case without a selector
		CASE
			WHEN movie(i).movie_value > 0 AND movie(i).movie_value < 10 
				AND movie(i).movie_cat_id = 1 THEN v_counter_1 := v_counter_1 + 1;
			WHEN movie(i).movie_value > 0 AND movie(i).movie_value < 20 
				AND movie(i).movie_cat_id = 5 THEN v_counter_2 := v_counter_2 + 1;
			ELSE v_counter_3 := v_counter_3 + 1;
		END CASE;
	END LOOP;
	
	DBMS_OUTPUT.PUT_LINE('There are ' || v_counter_1 || ' movies in category 1 under $10.');
	DBMS_OUTPUT.PUT_LINE('There are ' || v_counter_2 || ' movies in category 5 under $20.');
	DBMS_OUTPUT.PUT_LINE('There are ' || v_counter_3 || ' movies beyond your budget.');
	
END;
/
