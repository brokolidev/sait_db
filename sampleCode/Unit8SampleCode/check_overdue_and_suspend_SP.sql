-- SP containing a subprogram
CREATE OR REPLACE PROCEDURE check_overdue_and_suspend
	(p_date_in mm_rental.checkin_date%TYPE,
	 p_date_out mm_rental.checkout_date%TYPE,
	 p_member_ID mm_member.member_ID%TYPE)
IS

v_date_diff BINARY_INTEGER := 0;

	-- inner SP (like inner classes in Java)
	PROCEDURE suspend_member
		(p_member_ID mm_member.member_ID%TYPE)
	AS

	BEGIN

		UPDATE mm_member
			SET suspension = 'Y'
			WHERE member_id = p_member_ID;

	END suspend_member;

BEGIN

	IF p_date_in IS NULL OR p_date_out IS NULL THEN
		RAISE_APPLICATION_ERROR(-20001, 'Date is null.');
	END IF;

	v_date_diff := p_date_in - p_date_out;
	IF v_date_diff > 14 THEN
		suspend_member(p_member_ID);
	END IF;

END check_overdue_and_suspend;
/
