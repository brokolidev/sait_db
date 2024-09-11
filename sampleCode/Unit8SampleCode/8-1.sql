-- test program for check_overdue_SP
SET SERVEROUTPUT ON

DECLARE
	-- variable to hold the OUT parameter (return value)
	v_overdue BOOLEAN := false;
	v_err_num VARCHAR2(10);
	v_err_msg VARCHAR2(100);

BEGIN

	-- 1) call stored procedure by name using parameter positions
	check_overdue( 	TO_DATE('16-AUG-2015', 'DD-MM-YYYY'), 
					TO_DATE('01-AUG-2015', 'DD-MM-YYYY'),
					v_overdue);
	
	IF v_overdue = true THEN
		DBMS_OUTPUT.PUT_LINE('First movie is overdued.');
	END IF;	

	-- 2) call stored procedure by name using parameter names
	check_overdue( 	p_overdue => v_overdue,
					p_date_out => TO_DATE('01-AUG-2015', 'DD-MM-YYYY'), 
					p_date_in => TO_DATE('16-AUG-2015', 'DD-MM-YYYY'));
	
	IF v_overdue = true THEN
		DBMS_OUTPUT.PUT_LINE('Second movie is overdued.');
	END IF;	

	-- trying out the exception!
	check_overdue( 	NULL, 
					TO_DATE('01-AUG-2015', 'DD-MM-YYYY'),
					v_overdue);

EXCEPTION
	-- since we're using RAISE_APPLICATION_ERROR in the SP, the exception
	-- is sent back to the caller/initiator of the SP = this program! So
	-- we can catch the exception here!
	WHEN OTHERS THEN
		-- commented out transactional control commands for testing only!
		-- ROLLBACK;
		v_err_num := SQLCODE;
		v_err_msg := SUBSTR(SQLERRM, 1, 100);
		INSERT INTO error_log
			VALUES (v_err_num, v_err_msg);
		-- COMMIT;
END;
/
