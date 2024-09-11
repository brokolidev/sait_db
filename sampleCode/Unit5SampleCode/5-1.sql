SET SERVEROUTPUT ON

DECLARE
-- this is the other type of composite that we are not covering in this course
-- it is NOT a good way to store data from the DB tables (very bad way in fact...)
-- this is ONLY being used here for demonstrate decision and looping structures!
-- do NOT use this table data type for anything!
	TYPE t_movie IS TABLE OF mm_movie%ROWTYPE
		INDEX BY BINARY_INTEGER;
	movie t_movie;
	v_counter_10 BINARY_INTEGER := 0;
	v_counter_20 BINARY_INTEGER := 0;
	v_counter_more BINARY_INTEGER := 0;

BEGIN

	-- this is also not considered to be the best practice to work with data
	-- again, this is ONLY being used as an example! do NOT actually do this!
	SELECT *
		BULK COLLECT INTO movie
		FROM mm_movie;
	
	FOR i IN 1..movie.COUNT LOOP
		-- note the THEN keyword
		-- logical operators: AND, OR and NOT
		IF movie(i).movie_value > 0 AND movie(i).movie_value < 10 THEN
			-- arithmetic operators: +, -, *, / and ** (exponent)
			v_counter_10 := v_counter_10 + 1;
		-- note the missing 'E' in ELSIF
		ELSIF movie(i).movie_value < 20 THEN
			v_counter_20 := v_counter_20 + 1;
		ELSE
			/* comparison operators: =, <, >, <=, >=
			   not equal: <>, !=, ~=, ^= (depending on platform)
			   also: LIKE, BETWEEN, IN, IS NULL */
			IF movie(i).movie_value > 50 THEN
				DBMS_OUTPUT.PUT_LINE(movie(i).movie_title || ' has an invalid value.');
			ELSE
				v_counter_more := v_counter_more + 1;
			-- nesting is fun! just don't forget the END IF!
			-- proper indentation always help :-)
			END IF;
		END IF;
	END LOOP;
	
	DBMS_OUTPUT.PUT_LINE('There are ' || v_counter_10 || ' movies valued under 10.');
	DBMS_OUTPUT.PUT_LINE('There are ' || v_counter_20 || ' movies valued under 20.');
	DBMS_OUTPUT.PUT_LINE('There are ' || v_counter_more || ' movies valued over 20.');
	
END;
/
