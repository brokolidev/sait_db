SET SERVEROUTPUT ON

BEGIN

	-- this creates an implicit cursor
	UPDATE mm_movie
		SET movie_value = movie_value + 1
		WHERE movie_cat_id = 2;

	-- if at least one row was updated
	IF SQL%FOUND THEN
		-- show number of rows updated
		DBMS_OUTPUT.PUT_LINE('Updated ' || SQL%ROWCOUNT || ' rows.');
	ELSE
		-- SQL%NOTFOUND is true
		DBMS_OUTPUT.PUT_LINE('No rows updated');
	END IF;
	
	-- there's also SQL%ISOPEN but is always false for implicit cursors since 
	-- Oracle closes the cursor automatically after executing the SQL statement
	
END;
/
