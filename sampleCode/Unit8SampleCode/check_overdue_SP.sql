-- don't need this since we're not interacting with the cmd line directly 
-- unless you're debugging with DBMS_OUTPUT.PUT_LINE
-- SET SERVEROUTPUT ON

-- OR REPLACE is optional but useful for testing here
CREATE OR REPLACE PROCEDURE check_overdue
	-- parameter name, mode (default is IN), data type
	(p_date_in IN DATE,
	 p_date_out IN DATE,
	 p_overdue OUT BOOLEAN) -- just an example, this is bad practice for SP!
IS -- or AS to indicate start of pl/sql block

-- no need for the DECLARE keyword
v_date_diff BINARY_INTEGER := 0;

-- the rest is the same old pl/sql block structure!
BEGIN

	IF p_date_in IS NULL OR p_date_out IS NULL THEN
		RAISE_APPLICATION_ERROR(-20001, 'Date is null.');
	END IF;

	v_date_diff := p_date_in - p_date_out;
	-- hardcoded rental = 2 weeks... in a real system, it would be coming 
	-- from another table (e.g. type of rental)
	IF v_date_diff > 14 THEN 
		p_overdue := true;
	END IF;
	
END check_overdue; -- not needed to have the name but good practice!

-- still need to "run" so it can be compiled and stored in DB
-- Note: this doesn't execute the SP, it just signals to Oracle to parse
-- the code and save it internally as a named program!
/
