SET SERVEROUTPUT ON

DECLARE
	v_text VARCHAR2(20);

BEGIN

	-- using a simple escape
	v_text := 'Kitty''s awesome!';
	DBMS_OUTPUT.PUT_LINE(v_text);
	
	-- using the literal quote notation
	v_text := q'(Kitty's awesome!)';
	DBMS_OUTPUT.PUT_LINE(v_text);

END;
/
