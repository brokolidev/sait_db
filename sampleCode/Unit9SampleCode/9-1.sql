-- test program for our SF
SET SERVEROUTPUT ON

DECLARE
	CURSOR c_member IS 
	SELECT *
	FROM mm_member;

BEGIN

	FOR r_member IN c_member LOOP
		-- calling our new SF in our IF w/o a comparison since it always return a boolean!
		IF suspendTF(r_member.suspension) THEN
			DBMS_OUTPUT.PUT_LINE(r_member.member_ID || ' has been suspended.');
		END IF;
	END LOOP;
	
	-- attempting to call a SF without it being part of an expression!
	-- suspendTF('Y');

END;
/
