
ACCEPT booktitle CHAR PROMPT 'Enter phrase to search for:'
SET VERIFY OFF;

SELECT title FROM books WHERE UPPER(title) like UPPER('%&booktitle%');

SET VERIFY ON;


SELECT * from RCV_DESTINATION where STATE != null;





SELECT title FROM books WHERE UPPER(title) like UPPER('%&booktitle%');



SELECT title FROM books WHERE title like UPPER('%&booktitle%');