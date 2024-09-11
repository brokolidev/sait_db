SET SERVEROUTPUT ON

DECLARE
	-- cursor of simple SELECT w/o BULK COLLECT or INTO a table type
	-- this is the MUCH BETTER way to work with our data in the DB!
	-- no stale data here! (we're not making a copy of the DB table!)
	CURSOR c_movie IS 
		SELECT *
			FROM mm_movie;
	-- record to store row from cursor - you can use %ROWTYPE or
	-- create a custom record type + record variable to do this
	-- this depends if you'll be working with most/all the columns
	-- or just a few columns of the DB tables
	r_movie mm_movie%ROWTYPE;
	v_movie_count BINARY_INTEGER := 0;

BEGIN

	-- "open" the cursor: allocate memory and run query
	-- positions cursor to just before the first row of result set
	OPEN c_movie;
	LOOP
		-- retrieve next row in result set and store in record
		-- advances cursor to end of row
		FETCH c_movie INTO r_movie;
			-- stop looping when no more rows
			EXIT WHEN c_movie%NOTFOUND;
			-- pretend I'm doing something intelligent here...
			v_movie_count := v_movie_count + 1;
	END LOOP;
	-- deallocate memory, frees up memory
	CLOSE c_movie;
	DBMS_OUTPUT.PUT_LINE(v_movie_count);

END;
/
