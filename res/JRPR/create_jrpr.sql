DROP TABLE conflict_detail;
DROP TABLE disputed_region;
DROP TABLE region_information;
DROP TABLE vessel_captain;
DROP TABLE vessel_information;
DROP TABLE pirate_information;
DROP TABLE vessel_type;
DROP TABLE load_table1;
DROP TABLE load_table2;

DROP SEQUENCE seq_pirate;
DROP SEQUENCE seq_vessel;
DROP SEQUENCE seq_conflict;

CREATE SEQUENCE seq_pirate
  START WITH 1
  INCREMENT BY 1;

CREATE SEQUENCE seq_vessel
  START WITH 10
  INCREMENT BY 10;

CREATE SEQUENCE seq_conflict
  START WITH 25
  INCREMENT BY 15;

CREATE TABLE vessel_type
(vessel_type_code		VARCHAR2(3),
 vessel_type_name		VARCHAR2(20)
);

CREATE TABLE pirate_information
(pirate_id				NUMBER,
 first_name				VARCHAR2(30),
 last_name				VARCHAR2(30),
 pirating_start_date	DATE,
 active_flag			CHAR(1)
);

CREATE TABLE load_table1
(pirate_id				NUMBER,
 first_name				VARCHAR2(30),
 last_name				VARCHAR2(30),
 vessel_id				NUMBER,
 vessel_name			VARCHAR2(30),
 vessel_type_code		VARCHAR2(3),
 conflict_id			NUMBER,
 dispute_code			VARCHAR2(6),
 region_code			CHAR(4),
 region_importance		VARCHAR2(300)
);

CREATE TABLE load_table2
(pirate_id				NUMBER,
 first_name				VARCHAR2(30),
 last_name				VARCHAR2(30),
 vessel_id				NUMBER,
 vessel_name			VARCHAR2(30),
 vessel_type_code		VARCHAR2(3),
 conflict_id			NUMBER,
 dispute_code			VARCHAR2(6),
 region_code			CHAR(4),
 region_importance		VARCHAR2(300)
);

CREATE TABLE vessel_information
(vessel_id				NUMBER,
 vessel_name			VARCHAR2(30),
 vessel_type_code		VARCHAR2(3),
 commission_date		DATE,
 active_flag			CHAR(1)
);

CREATE TABLE vessel_captain
(pirate_id				NUMBER,
 vessel_id				NUMBER,
 start_date				DATE,
 end_date				DATE
);

CREATE TABLE conflict_detail
(conflict_id			NUMBER,
 dispute_code			VARCHAR2(6),
 pirate_id				NUMBER,
 vessel_id				NUMBER
);


CREATE TABLE disputed_region
(dispute_code			VARCHAR2(6),
 region_code			CHAR(4),
 region_importance		VARCHAR2(300),
 start_date				DATE,
 end_date				DATE
);

CREATE TABLE region_information
(region_code			CHAR(4),
 region_name			VARCHAR2(30)
);
