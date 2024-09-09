-- This script manipulates the Grand Hill Collage DB with required data

spool C:/dev/sait/db/populate_GHCDB_output.txt
set echo on

-- Add a new department
INSERT INTO GHC_DEPARTMENT (dept_no, dept_name)
    VALUES (100, 'Astrophysics');

COMMIT;

-- Add a new instructor
INSERT INTO GHC_FACULTY (faculty_id, surname, firstname, date_hired, date_fired, is_active, dept_no)
    VALUES (1001, 'Faulkner', 'Danny', '01-Jan-22', '', 1, 100);

COMMIT;

-- Add the following courses that Danny Faulkner has expertise to teach
INSERT INTO GHC_COURSE (course_code, course_title, credits)
    VALUES ('APHY202', 'The Solar System', 5);
INSERT INTO GHC_COURSE (course_code, course_title, credits)
    VALUES ('APHY203', 'Nebula', 5);
INSERT INTO GHC_COURSE (course_code, course_title, credits)
    VALUES ('APHY204', 'Global ClusterWs', 5);

INSERT INTO GHC_EXPERTISE (faculty_id, course_code)
    VALUES (1001, 'APHY202');
INSERT INTO GHC_EXPERTISE (faculty_id, course_code)
    VALUES (1001, 'APHY203');
INSERT INTO GHC_EXPERTISE (faculty_id, course_code)
    VALUES (1001, 'APHY204');

COMMIT;

UPDATE GHC_COURSE SET course_code='APHY302' WHERE COURSE_CODE='APHY203';

COMMIT;

DELETE FROM GHC_FACULTY WHERE FACULTY_Id=1001;

COMMIT;


spool off