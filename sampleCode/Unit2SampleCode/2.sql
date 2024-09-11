/* *********************************************************************
**  File:  	 	 my_program.sql
**  Author:  	 Kitty Wong
**  Created:	 September 11, 2015
**  Description: This program does something awesome!
********************************************************************* */

-- Person is crazy
IF (person.crazy = TRUE) THEN
     DBMS_OUTPUT.PUTLINE( 'Crazy!' );
-- Person is not crazy
ELSE
     DBMS_OUTPUT.PUTLINE( 'Not Crazy.' );
END IF;

