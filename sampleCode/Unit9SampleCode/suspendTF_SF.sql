-- just like SP, the OR REPLACE is optional
CREATE OR REPLACE FUNCTION suspendTF
	(p_suspend IN VARCHAR2) -- parameters
	-- functions ALWAYS return a single value!
	RETURN BOOLEAN
IS -- or AS
	-- declaration section, don't need the DECLARE either!
	v_value BOOLEAN := false;
	
BEGIN

	IF p_suspend = 'Y' THEN
		v_value := true;
	END IF;
	
	-- guess what this is! :-)
	RETURN v_value;
	
END suspendTF; -- name not needed but good practice!
/
