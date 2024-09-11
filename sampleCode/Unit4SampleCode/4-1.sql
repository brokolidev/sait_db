-- enable output from the DBMS_OUTPUT package
SET SERVEROUTPUT ON

-- create variables
DECLARE
	v_date DATE;
	v_name VARCHAR2(10);
	v_age NUMBER(2);
	v_happy	BOOLEAN;

-- main program
BEGIN

	-- variable assignments
	v_date := SYSDATE;
	v_name := 'Kitty';
	v_age := 28;
	v_happy := TRUE;

	-- output (like System.out.println in Java)
	DBMS_OUTPUT.PUT_LINE(v_date);
	DBMS_OUTPUT.PUT_LINE(v_name);
	DBMS_OUTPUT.PUT_LINE(v_age);
	
	-- simple decision logic
	IF v_happy THEN
		DBMS_OUTPUT.PUT_LINE('Woohoo!');
	END IF;

-- end of program
END;

-- run the code
/
