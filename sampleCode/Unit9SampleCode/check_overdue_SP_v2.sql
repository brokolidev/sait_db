-- same SP from module 6 w/o the inline comments
CREATE OR REPLACE PROCEDURE check_overdue
	-- IN is always passed by reference
	(p_date_in IN DATE,
	 p_date_out IN DATE,
	 -- OUT and IN OUT defaults to passed by value (copy)
	 -- adding NOCOPY forces it to be passed by reference
	 p_overdue OUT NOCOPY BOOLEAN)
IS

v_date_diff BINARY_INTEGER := 0;

BEGIN

	IF p_date_in IS NULL OR p_date_out IS NULL THEN
		RAISE_APPLICATION_ERROR(-20001, 'Date is null.');
	END IF;

	v_date_diff := p_date_in - p_date_out;
	IF v_date_diff > 14 THEN 
		p_overdue := true;
	END IF;

END check_overdue;
/
