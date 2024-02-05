-- this script drops and creates the Grand Hill
spool C:/dev/sait/db/build_GHCDB_output.txt

set echo on

-- drop the tables
DROP TABLE ghc_experies;
DROP TABLE ghc_course;
DROP TABLE ghc_faculty;
DROP TABLE ghc_department;

-- create the tables
CREATE TABLE ghc_department (

);
