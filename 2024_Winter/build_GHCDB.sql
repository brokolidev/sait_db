-- this script drops and creates the Grand Hill
SET SERVEROUTPUT ON
spool C:/dev/sait/db/build_GHCDB_output.txt

-- drop the tables
DROP TABLE ghc_expertise;
DROP TABLE ghc_course;
DROP TABLE ghc_faculty;
DROP TABLE ghc_department;

-- create the tables
CREATE TABLE ghc_department (
    dept_no NUMBER,
    dept_name VARCHAR2(20)
);

-- add constraints using ALTER
ALTER TABLE ghc_department
    ADD CONSTRAINT sys_department_pk PRIMARY KEY (dept_no)
    ADD CONSTRAINT sys_department_dept_name UNIQUE (dept_name);

ALTER TABLE ghc_department
    MODIFY dept_name NOT NULL;


-- create the tables
CREATE TABLE ghc_faculty (
    faculty_id NUMBER,
    surname VARCHAR2(50),
    firstname VARCHAR2(50),
    date_hired DATE,
    date_fired DATE,
    is_active NUMBER(1),
    dept_no NUMBER
);

-- add constraints using ALTER
ALTER TABLE ghc_faculty
    ADD CONSTRAINT sys_faculty_pk PRIMARY KEY (faculty_id)
    ADD CONSTRAINT sys_faculty_is_active_ck CHECK (is_active IN (0, 1))
    ADD CONSTRAINT sys_department_faculty_fk FOREIGN KEY (dept_no) REFERENCES ghc_department(dept_no);

ALTER TABLE ghc_faculty
    MODIFY surname NOT NULL
    MODIFY firstname NOT NULL
    MODIFY date_hired NOT NULL
    MODIFY is_active NOT NULL
    MODIFY dept_no NOT NULL;

CREATE TABLE ghc_course (
    course_code CHAR(7),
    course_title VARCHAR2(60),
    credits NUMBER(2)
);

ALTER TABLE ghc_course
    ADD CONSTRAINT sys_course_pk PRIMARY KEY (course_code)
    ADD CONSTRAINT sys_course_credits_ck CHECK (credits BETWEEN 1 AND 9);

ALTER TABLE ghc_course
    MODIFY course_title NOT NULL
    MODIFY credits NOT NULL;

CREATE TABLE ghc_expertise (
    faculty_id NUMBER,
    course_code CHAR(7)
);

ALTER TABLE ghc_expertise
    ADD CONSTRAINT sys_expertise_pk PRIMARY KEY (faculty_id, course_code)
    ADD CONSTRAINT sys_faculty_expertise_fk FOREIGN KEY (faculty_id) REFERENCES ghc_faculty(faculty_id)
    ADD CONSTRAINT sys_course_expertise_fk FOREIGN KEY (course_code) REFERENCES ghc_course(course_code);

spool off