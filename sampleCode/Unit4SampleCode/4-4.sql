SET SERVEROUTPUT ON

DECLARE
	v_date DATE := SYSDATE;
	-- v_name must not be null (always have a value)
	v_name VARCHAR2(10) NOT NULL := 'Kitty';
	-- k_age never changes, k for constant (from math notations)
	k_age CONSTANT NUMBER(2) := 28;
	v_happy	BOOLEAN DEFAULT TRUE;

BEGIN

	DBMS_OUTPUT.PUT_LINE(v_date);
	DBMS_OUTPUT.PUT_LINE(v_name);
	DBMS_OUTPUT.PUT_LINE(k_age);
	
	IF v_happy THEN
		DBMS_OUTPUT.PUT_LINE('Woohoo!');
	END IF;

END;
/
