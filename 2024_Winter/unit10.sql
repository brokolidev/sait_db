rem Lab Unit 10-11 Simple SELECT and Sorting
set echo on
set linesize 200
set pagesize 66
spool C:/dev/sait/db/unit10LabOutput.txt

rem Q1 - basic select columns with headers

SELECT FIRST_NAME, LAST_NAME FROM CPRG250.RCV_AGENT
                             WHERE AGENT_LEVEL='III' OR AGENT_LEVEL='IV'
                             ORDER BY LAST_NAME;

CLEAR COLUMNS;

rem Q2

SELECT TOUR_DESCRIPTION FROM CPRG250.RCV_VACATION_TOUR
         WHERE (RATING_CODE='E' OR RATING_CODE='M') AND
               TOUR_DESCRIPTION LIKE '%Paris%'
         ORDER BY  TOUR_DESCRIPTION;

CLEAR COLUMNS;

rem Q3

COLUMN DEST_DESCRIPTION FORMAT A82;

SELECT COUNTRY, DEST_DESCRIPTION FROM CPRG250.RCV_DESTINATION
                                 WHERE COUNTRY='Canada' OR COUNTRY='United States'
                                 ORDER BY COUNTRY, DEST_DESCRIPTION;

CLEAR COLUMNS;

rem insert solution here!

spool off