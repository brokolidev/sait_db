SET SERVEROUTPUT ON

-- variable declaration and assignment (initialization)
DECLARE
	v_date DATE := SYSDATE;
	v_name VARCHAR2(10) := 'Kitty';
	v_age NUMBER(2) := 28;
	-- DEFAULT is same as :=
	v_happy	BOOLEAN DEFAULT TRUE;

BEGIN

	DBMS_OUTPUT.PUT_LINE(v_date);
	DBMS_OUTPUT.PUT_LINE(v_name);
	DBMS_OUTPUT.PUT_LINE(v_age);
	
	IF v_happy THEN
		DBMS_OUTPUT.PUT_LINE('Woohoo!');
	END IF;

END;
/
