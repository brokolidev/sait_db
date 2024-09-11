CREATE OR REPLACE PROCEDURE suspend_member
	-- SP are just pl/sql programs! you can use everything you know just like
	-- anonymous blocks... like %TYPE!
	-- Note: if you don't specify the parameter mode, it is defaulted to IN
	(p_member_id NUMBER)
	-- (p_member_ID mm_member.member_ID%TYPE)
IS
-- To make this SP run independently (separate transaction)
-- PRAGMA AUTONOMOUS_TRANSACTION;

BEGIN

	UPDATE mm_member
		SET suspension = 'Y'
		WHERE member_id = p_member_id;

	-- this is only here for demo purposes, it's not recommended to do ANY
	-- transactional control commands inside a SP!
	-- COMMIT;
	
END suspend_member;
/
