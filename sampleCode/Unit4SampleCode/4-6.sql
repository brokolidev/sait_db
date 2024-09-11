SET SERVEROUTPUT ON

DECLARE
	-- %TYPE gets data type from table column
	v_movie_title VARCHAR(40) := 'Donnie Darko';
	v_movie_cat_id NUMBER(2) := 1;
	v_movie_value DECIMAL(5,2) := 30;
	v_movie_qty NUMBER(2) := 20;

BEGIN

	INSERT INTO mm_movie
		VALUES ( mm_rental_seq.NEXTVAL, v_movie_title, v_movie_cat_id, v_movie_value, v_movie_qty);
	COMMIT;
	
END;
/
