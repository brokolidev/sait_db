

rem Lab Unit 10-11 Simple SELECT and Sorting
set echo on
set linesize 133
set pagesize 66
spool C:/dev/sait/db/single_row_func.txt


REM Q1

COLUMN "Desc" FORMAT A22;
COLUMN "Start Date" FORMAT A22;
COLUMN "Duration" FORMAT A12;
COLUMN "Dest Desc" FORMAT A15;
COLUMN "Num" HEADING "     Num" FORMAT 99;
COLUMN "Price" FORMAT 999999.99;

BREAK ON "Desc" ON "Start Date" ON "Duration"

select TOUR_DESCRIPTION "Desc",
       TO_CHAR(START_DATE, 'Mon DD, YYYY') "Start Date",
       CONCAT(END_DATE - START_DATE, ' Days') "Duration",
       ROW_NUMBER() over (PARTITION BY TOUR_DESCRIPTION ORDER BY TOUR_DESCRIPTION, ORDER#) "Num",
       SUBSTR(DEST_DESCRIPTION, 0, 15) "Dest Desc",
       TO_CHAR(PRICE, '$999999.00') "Price"
from RCV_CUSTOMER
natural join RCV_TOUR_CUSTOMER
natural join RCV_VACATION_TOUR
natural join RCV_TOUR_DESTINATION
natural join RCV_DESTINATION
where FIRST_NAME='Amy' and LAST_NAME='Folwer'
ORDER BY 1, ORDER#;

CLEAR COLUMNS
CLEAR BREAKS



REM Q2

COLUMN "Desc" FORMAT A40;
COLUMN "Cost" FORMAT A12;
COLUMN "Country" FORMAT A20;
COLUMN "City" FORMAT A16;


select DEST_DESCRIPTION "Desc",
       CASE WHEN PRICE < 50 THEN '$'
            WHEN PRICE >= 50 AND PRICE < 100 THEN '$$'
            WHEN PRICE >= 100 AND PRICE < 200 THEN '$$$'
            WHEN PRICE >= 200 AND PRICE < 500 THEN '$$$$'
            WHEN PRICE >= 500 THEN '$$$$$' END "Cost",
       UPPER(COUNTRY) "Country",
       CITY "City"
from RCV_DESTINATION
WHERE COUNTRY != 'Canada' and COUNTRY != 'United States'
ORDER BY COUNTRY, CITY, 2 ASC;


CLEAR COLUMNS


REM Q3

COLUMN "Desc" FORMAT A80;
COLUMN "Country" FORMAT A20;
COLUMN "State" FORMAT A12;

select DEST_DESCRIPTION "Desc",
       CASE COUNTRY WHEN 'United States' THEN 'USA'
        ELSE COUNTRY END "Country",
       NVL(STATE, 'NA') "State"
       from RCV_DESTINATION
WHERE INSTR(DEST_DESCRIPTION, 'Cook') > 0
   OR INSTR(DEST_DESCRIPTION, 'Wine') > 0
   OR INSTR(DEST_DESCRIPTION, 'Dinner') > 0
ORDER BY 2, 1;

CLEAR COLUMNS



spool off