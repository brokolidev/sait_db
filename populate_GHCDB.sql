-- This script populates the Grand Hill Collage DB with test data
-- @C:/dev/sait/db/populate_GHCDB.sql

spool C:/dev/sait/db/populate_GHCDB_output.txt
set echo on


-- Delete existing table data (children first!)
DELETE GHC_EXPERTISE;
COMMIT;

DELETE GHC_COURSE;
COMMIT;

DELETE GHC_FACULTY;
COMMIT;

DELETE GHC_DEPARTMENT;
COMMIT;

-- Insert test data into tables (parents first)
INSERT INTO GHC_COURSE (course_code, course_title, credits)
    VALUES ('CMPS253', 'Interface Design', 3);
INSERT INTO GHC_COURSE (course_code, course_title, credits)
    VALUES ('CPRG250', 'Database Design and Programming', 5);
INSERT INTO GHC_COURSE (course_code, course_title, credits)
    VALUES ('CPRG251', 'Object Oriented Programming Essentials', 5);
INSERT INTO GHC_COURSE (course_code, course_title, credits)
    VALUES ('CPRG302', 'Web Essentials', 3);
INSERT INTO GHC_COURSE (course_code, course_title, credits)
    VALUES ('HREL250', 'Business Dynamics', 3);

-- Save the changes
COMMIT;

INSERT INTO GHC_DEPARTMENT (dept_no, dept_name)
    VALUES (25, 'ITC');
INSERT INTO GHC_DEPARTMENT (dept_no, dept_name)
    VALUES (26, 'Business');

COMMIT;

INSERT INTO GHC_FACULTY (faculty_id, surname, firstname, date_hired, date_fired, is_active, dept_no)
    VALUES (1294, 'Harris', 'Len', '15-Dec-19', '', 1, 25);
INSERT INTO GHC_FACULTY (faculty_id, surname, firstname, date_hired, date_fired, is_active, dept_no)
    VALUES (1244, 'Lock', 'Sara', '15-Dec-19', '01-May-20', 1, 25);
INSERT INTO GHC_FACULTY (faculty_id, surname, firstname, date_hired, date_fired, is_active, dept_no)
    VALUES (1948, 'Fischer', 'Jenny', '15-Mar-21', '',	1, 26);
INSERT INTO GHC_FACULTY (faculty_id, surname, firstname, date_hired, date_fired, is_active, dept_no)
    VALUES (7839, 'Wallbanger', 'Harvey', '15-Aug-02', '',	1, 25);

COMMIT;

INSERT INTO GHC_EXPERTISE(faculty_id, course_code)
    VALUES(1294, 'CMPS253');
INSERT INTO GHC_EXPERTISE(faculty_id, course_code)
    VALUES(1294, 'CPRG302');
INSERT INTO GHC_EXPERTISE(faculty_id, course_code)
    VALUES(1294, 'CPRG251');
INSERT INTO GHC_EXPERTISE(faculty_id, course_code)
    VALUES(1948, 'HREL250');
INSERT INTO GHC_EXPERTISE(faculty_id, course_code)
    VALUES(7839, 'CPRG251');
INSERT INTO GHC_EXPERTISE(faculty_id, course_code)
    VALUES(7839, 'CPRG250');
INSERT INTO GHC_EXPERTISE(faculty_id, course_code)
    VALUES(7839, 'CMPS253');
INSERT INTO GHC_EXPERTISE(faculty_id, course_code)
    VALUES(1244, 'HREL250');
INSERT INTO GHC_EXPERTISE(faculty_id, course_code)
    VALUES(1244, 'CMPS253');

COMMIT;

SELECT * FROM GHC_COURSE;
SELECT * FROM GHC_DEPARTMENT;
SELECT * FROM GHC_FACULTY;
SELECT * FROM GHC_EXPERTISE;

spool off
