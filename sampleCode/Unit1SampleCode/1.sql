DROP TABLE course;
DROP TABLE instructor;
DROP SEQUENCE id_seq;

CREATE SEQUENCE id_seq
	INCREMENT BY 1
	START WITH 123456789;

CREATE TABLE instructor
    (id NUMBER(9) NOT NULL,
     name VARCHAR(10),
	 address VARCHAR(100),
	 CONSTRAINT instructor_primary_key PRIMARY KEY (id));
CREATE TABLE course
	(code VARCHAR(8) NOT NULL,
	 instructor NUMBER(9) NOT NULL,
	 CONSTRAINT course_primary_key PRIMARY KEY (code),
	 CONSTRAINT course_foreign_key FOREIGN KEY (instructor)
		REFERENCES instructor (id));

INSERT INTO instructor (id, name, address)
	VALUES (id_seq.nextval, 'Kitty', '123 This St');

INSERT INTO course (code, instructor)
	VALUES ('CPRG307A', id_seq.currval);
INSERT INTO course (code, instructor)
	VALUES ('CPRG304A', id_seq.currval);
INSERT INTO course (code, instructor)
	VALUES ('CMPS369A', id_seq.currval);

INSERT INTO instructor (id, name, address)
	VALUES (id_seq.nextval, 'Nicole', '123 That St');

INSERT INTO course (code, instructor)
	VALUES ('CPRG307B', id_seq.currval);
INSERT INTO course (code, instructor)
	VALUES ('CPRG307C', id_seq.currval);
INSERT INTO course (code, instructor)
	VALUES ('CPRG307D', id_seq.currval);

-- simple view
CREATE OR REPLACE VIEW vw_instructors AS
	SELECT name, id
		FROM instructor;

-- complex view
CREATE OR REPLACE VIEW vw_kitty_courses AS
	SELECT name, code
		FROM course c, instructor i
		WHERE i.name = 'Kitty'
		AND i.id = c.instructor;

COMMIT;


