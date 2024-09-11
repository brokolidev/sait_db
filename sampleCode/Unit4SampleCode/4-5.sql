SET SERVEROUTPUT ON

DECLARE
	-- using the EXTRACT function to get current year
	v_year NUMBER(4) := EXTRACT(year FROM SYSDATE);
	v_name VARCHAR2(10) NOT NULL := 'Kitty';
	k_age CONSTANT NUMBER(2) := 28;

BEGIN

	v_year := v_year - k_age;
	-- using the || operator
	DBMS_OUTPUT.PUT_LINE(v_name || ' is born in ' || v_year);
	-- using the CONCAT function (only 2 strings at a time)
	DBMS_OUTPUT.PUT_LINE( CONCAT(v_name, CONCAT(' is born in ', v_year)));
	
END;
/
