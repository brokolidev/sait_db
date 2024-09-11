SET SERVEROUTPUT ON

DECLARE
	v_value BINARY_INTEGER := 999;
	-- declare a named exception
	e_value_ck EXCEPTION;
	-- associate the error code with the exception name using the last 4 digits
	-- of the SQLCODE value with a minus sign
	PRAGMA EXCEPTION_INIT(e_value_ck, -2290);

BEGIN

	UPDATE mm_movie
		SET movie_value = v_value
		WHERE movie_id = 1;
		
	COMMIT;
		
EXCEPTION
	-- exception handler for named exception with the specific error code 
	-- defined in the DECLARE block
	WHEN e_value_ck THEN
		DBMS_OUTPUT.PUT_LINE('Value must be between 5 and 100.');

END;
/
