DROP TABLE audit_DB;

CREATE TABLE audit_DB
	(username VARCHAR(25) NOT NULL,
	 date_time DATE NOT NULL,
	 event VARCHAR2(50) NOT NULL,
	 old_value VARCHAR2(50),
	 new_value VARCHAR2(50));