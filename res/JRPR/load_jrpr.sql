-- Inserts into LOAD_TABLE1


-- Inserts into LOAD_TABLE2

-- Inserts into VESSEL_TYPE

INSERT INTO vessel_type
(vessel_type_code, vessel_type_name)
VALUES
('SLO', 'sloop');

INSERT INTO vessel_type
(vessel_type_code, vessel_type_name)
VALUES
('FRI', 'frigate');

INSERT INTO vessel_type
(vessel_type_code, vessel_type_name)
VALUES
('MER', 'merchant');

INSERT INTO vessel_type
(vessel_type_code, vessel_type_name)
VALUES
('BRI', 'brigatine');

INSERT INTO vessel_type
(vessel_type_code, vessel_type_name)
VALUES
('GAN', 'galleon');

INSERT INTO vessel_type
(vessel_type_code, vessel_type_name)
VALUES
('GAL', 'galley');


-- Inserts into PIRATE_INFORMATION 

INSERT INTO pirate_information
(pirate_id, first_name, last_name, pirating_start_date, active_flag)
VALUES
(seq_pirate.NEXTVAL, 'Morgan', 'Adams', SYSDATE - 50, 'Y');

INSERT INTO pirate_information
(pirate_id, first_name, last_name, pirating_start_date, active_flag)
VALUES
(seq_pirate.NEXTVAL, 'Johannes', 'Elshazly', SYSDATE - 40, 'Y');

INSERT INTO pirate_information
(pirate_id, first_name, last_name, pirating_start_date, active_flag)
VALUES
(seq_pirate.NEXTVAL, 'Jane', 'Sparrow', SYSDATE - 30, 'Y');

INSERT INTO pirate_information
(pirate_id, first_name, last_name, pirating_start_date, active_flag)
VALUES
(seq_pirate.NEXTVAL, 'Daoquian', 'Lin', SYSDATE - 50, 'Y');

INSERT INTO pirate_information
(pirate_id, first_name, last_name, pirating_start_date, active_flag)
VALUES
(seq_pirate.NEXTVAL, 'Heyreddin', 'Barbarossa', SYSDATE - 20, 'Y');

INSERT INTO pirate_information
(pirate_id, first_name, last_name, pirating_start_date, active_flag)
VALUES
(seq_pirate.NEXTVAL, 'Edward', 'Teach', SYSDATE - 50, 'Y');

INSERT INTO pirate_information
(pirate_id, first_name, last_name, pirating_start_date, active_flag)
VALUES
(seq_pirate.NEXTVAL, 'Henry', 'Morgan', SYSDATE - 10, 'Y');

INSERT INTO pirate_information
(pirate_id, first_name, last_name, pirating_start_date, active_flag)
VALUES
(seq_pirate.NEXTVAL, 'Samuel', 'Bellamy', SYSDATE, 'Y');

INSERT INTO pirate_information
(pirate_id, first_name, last_name, pirating_start_date, active_flag)
VALUES
(seq_pirate.NEXTVAL, 'Roger', 'Black', SYSDATE - 25, 'Y');

INSERT INTO pirate_information
(pirate_id, first_name, last_name, pirating_start_date, active_flag)
VALUES
(seq_pirate.NEXTVAL, 'Jack', 'Rackham', SYSDATE - 100, 'Y');

INSERT INTO pirate_information
(pirate_id, first_name, last_name, pirating_start_date, active_flag)
VALUES
(seq_pirate.NEXTVAL, 'Liz', 'Crowfoot', SYSDATE - 200, 'Y');

INSERT INTO pirate_information
(pirate_id, first_name, last_name, pirating_start_date, active_flag)
VALUES
(seq_pirate.NEXTVAL, 'Billy', 'Bones', SYSDATE - 90, 'Y');

INSERT INTO pirate_information
(pirate_id, first_name, last_name, pirating_start_date, active_flag)
VALUES
(seq_pirate.NEXTVAL, 'Anne', 'Bonny', SYSDATE - 40, 'Y');

INSERT INTO pirate_information
(pirate_id, first_name, last_name, pirating_start_date, active_flag)
VALUES
(seq_pirate.NEXTVAL, 'Jean', 'Lafitte', SYSDATE, 'Y');

INSERT INTO pirate_information
(pirate_id, first_name, last_name, pirating_start_date, active_flag)
VALUES
(seq_pirate.NEXTVAL, 'John', 'Connor', SYSDATE - 20, 'Y');

INSERT INTO pirate_information
(pirate_id, first_name, last_name, pirating_start_date, active_flag)
VALUES
(seq_pirate.NEXTVAL, 'Jean', 'Lafitte', SYSDATE - 200, 'Y');

INSERT INTO pirate_information
(pirate_id, first_name, last_name, pirating_start_date, active_flag)
VALUES
(seq_pirate.NEXTVAL, 'Julia', 'Connor', SYSDATE - 90, 'Y');

INSERT INTO pirate_information
(pirate_id, first_name, last_name, pirating_start_date, active_flag)
VALUES
(seq_pirate.NEXTVAL, 'Henrietta', 'Cook', SYSDATE - 50, 'Y');

INSERT INTO pirate_information
(pirate_id, first_name, last_name, pirating_start_date, active_flag)
VALUES
(seq_pirate.NEXTVAL, 'Arabella', 'Drummond', SYSDATE - 20, 'Y');

INSERT INTO pirate_information
(pirate_id, first_name, last_name, pirating_start_date, active_flag)
VALUES
(seq_pirate.NEXTVAL, 'Jose', 'Gaspar', SYSDATE - 60, 'Y');

INSERT INTO pirate_information
(pirate_id, first_name, last_name, pirating_start_date, active_flag)
VALUES
(seq_pirate.NEXTVAL, 'Edward', 'Kenway', SYSDATE - 80, 'Y');

INSERT INTO pirate_information
(pirate_id, first_name, last_name, pirating_start_date, active_flag)
VALUES
(seq_pirate.NEXTVAL, 'Maria', 'Ramirez', SYSDATE - 40, 'Y');

INSERT INTO pirate_information
(pirate_id, first_name, last_name, pirating_start_date, active_flag)
VALUES
(seq_pirate.NEXTVAL, 'Mary', 'Read', SYSDATE - 50, 'Y');

INSERT INTO pirate_information
(pirate_id, first_name, last_name, pirating_start_date, active_flag)
VALUES
(seq_pirate.NEXTVAL, 'Bob', 'Harvey', SYSDATE - 300, 'Y');

INSERT INTO pirate_information
(pirate_id, first_name, last_name, pirating_start_date, active_flag)
VALUES
(seq_pirate.NEXTVAL, 'Denise', 'Lafitte', SYSDATE - 30, 'Y');


-- Inserts into VESSEL_INFORMATION

INSERT INTO vessel_information
(vessel_id, vessel_name, vessel_type_code, commission_date, active_flag)
VALUES
(seq_vessel.NEXTVAL, 'Morning Star', 'SLO', SYSDATE - 600, 'Y');

INSERT INTO vessel_information
(vessel_id, vessel_name, vessel_type_code, commission_date, active_flag)
VALUES
(seq_vessel.NEXTVAL, 'Perdita', 'FRI', SYSDATE - 500, 'Y');

INSERT INTO vessel_information
(vessel_id, vessel_name, vessel_type_code, commission_date, active_flag)
VALUES
(seq_vessel.NEXTVAL, 'Black Pearl', 'MER', SYSDATE - 400, 'Y');

INSERT INTO vessel_information
(vessel_id, vessel_name, vessel_type_code, commission_date, active_flag)
VALUES
(seq_vessel.NEXTVAL, 'Pride', 'SLO', SYSDATE - 600, 'Y');

INSERT INTO vessel_information
(vessel_id, vessel_name, vessel_type_code, commission_date, active_flag)
VALUES
(seq_vessel.NEXTVAL, 'Captains Fear', 'BRI', SYSDATE - 500, 'Y');

INSERT INTO vessel_information
(vessel_id, vessel_name, vessel_type_code, commission_date, active_flag)
VALUES
(seq_vessel.NEXTVAL, 'Royal Fortune', 'GAN', SYSDATE - 900, 'Y');

INSERT INTO vessel_information
(vessel_id, vessel_name, vessel_type_code, commission_date, active_flag)
VALUES
(seq_vessel.NEXTVAL, 'Golden Hind', 'GAL', SYSDATE - 600, 'Y');

INSERT INTO vessel_information
(vessel_id, vessel_name, vessel_type_code, commission_date, active_flag)
VALUES
(seq_vessel.NEXTVAL, 'Satisfaction', 'BRI', SYSDATE - 900, 'Y');

INSERT INTO vessel_information
(vessel_id, vessel_name, vessel_type_code, commission_date, active_flag)
VALUES
(seq_vessel.NEXTVAL, 'Roebuk', 'BRI', SYSDATE - 900, 'Y');

INSERT INTO vessel_information
(vessel_id, vessel_name, vessel_type_code, commission_date, active_flag)
VALUES
(seq_vessel.NEXTVAL, 'Adventure Galley', 'FRI', SYSDATE - 800, 'Y');

INSERT INTO vessel_information
(vessel_id, vessel_name, vessel_type_code, commission_date, active_flag)
VALUES
(seq_vessel.NEXTVAL, 'Golden Fleece', 'MER', SYSDATE - 600, 'Y');

INSERT INTO vessel_information
(vessel_id, vessel_name, vessel_type_code, commission_date, active_flag)
VALUES
(seq_vessel.NEXTVAL, 'Argonaut', 'MER', SYSDATE - 500, 'Y');

INSERT INTO vessel_information
(vessel_id, vessel_name, vessel_type_code, commission_date, active_flag)
VALUES
(seq_vessel.NEXTVAL, 'Aurora', 'SLO', SYSDATE - 800, 'Y');

INSERT INTO vessel_information
(vessel_id, vessel_name, vessel_type_code, commission_date, active_flag)
VALUES
(seq_vessel.NEXTVAL, 'Sirius', 'GAL', SYSDATE - 900, 'Y');

INSERT INTO vessel_information
(vessel_id, vessel_name, vessel_type_code, commission_date, active_flag)
VALUES
(seq_vessel.NEXTVAL, 'Vulkan', 'SLO', SYSDATE - 700, 'Y');

INSERT INTO vessel_information
(vessel_id, vessel_name, vessel_type_code, commission_date, active_flag)
VALUES
(seq_vessel.NEXTVAL, 'Belafonte', 'MER', SYSDATE - 800, 'Y');

INSERT INTO vessel_information
(vessel_id, vessel_name, vessel_type_code, commission_date, active_flag)
VALUES
(seq_vessel.NEXTVAL, 'Defiant', 'GAL', SYSDATE - 700, 'Y');

INSERT INTO vessel_information
(vessel_id, vessel_name, vessel_type_code, commission_date, active_flag)
VALUES
(seq_vessel.NEXTVAL, 'Ghost', 'FRI', SYSDATE - 800, 'Y');

INSERT INTO vessel_information
(vessel_id, vessel_name, vessel_type_code, commission_date, active_flag)
VALUES
(seq_vessel.NEXTVAL, 'Argo', 'GAL', SYSDATE - 600, 'Y');

INSERT INTO vessel_information
(vessel_id, vessel_name, vessel_type_code, commission_date, active_flag)
VALUES
(seq_vessel.NEXTVAL, 'Artemis', 'BRI', SYSDATE - 400, 'Y');


-- Inserts into VESSEL_CAPTAIN

INSERT INTO vessel_captain
(pirate_id, vessel_id, start_date, end_date)
VALUES
(1, 10, SYSDATE - 100, SYSDATE - 50);

INSERT INTO vessel_captain
(pirate_id, vessel_id, start_date, end_date)
VALUES
(25, 20, SYSDATE - 100, SYSDATE - 50);

INSERT INTO vessel_captain
(pirate_id, vessel_id, start_date, end_date)
VALUES
(1, 120, SYSDATE - 40, SYSDATE - 30);

INSERT INTO vessel_captain
(pirate_id, vessel_id, start_date, end_date)
VALUES
(6, 20, SYSDATE - 50, NULL);

INSERT INTO vessel_captain
(pirate_id, vessel_id, start_date, end_date)
VALUES
(10, 90, SYSDATE - 60, SYSDATE - 50);

INSERT INTO vessel_captain
(pirate_id, vessel_id, start_date, end_date)
VALUES
(11, 200, SYSDATE - 100, SYSDATE - 50);

INSERT INTO vessel_captain
(pirate_id, vessel_id, start_date, end_date)
VALUES
(20, 50, SYSDATE - 100, NULL);

INSERT INTO vessel_captain
(pirate_id, vessel_id, start_date, end_date)
VALUES
(15, 70, SYSDATE - 90, SYSDATE - 50);

INSERT INTO vessel_captain
(pirate_id, vessel_id, start_date, end_date)
VALUES
(4, 180, SYSDATE - 100, SYSDATE - 50);

INSERT INTO vessel_captain
(pirate_id, vessel_id, start_date, end_date)
VALUES
(22, 180, SYSDATE - 40, NULL);


-- Inserts into REGION_INFORMATION

INSERT INTO region_information
(region_code, region_name)
VALUES
('DAST', 'Davis Strait');

INSERT INTO region_information
(region_code, region_name)
VALUES
('BOFF', 'Bay of Fundy');

INSERT INTO region_information
(region_code, region_name)
VALUES
('NASO', 'Nantucket Sound');

INSERT INTO region_information
(region_code, region_name)
VALUES
('BUBA', 'Buzzards Bay');

INSERT INTO region_information
(region_code, region_name)
VALUES
('GOFM', 'Gulf of Mexico');

INSERT INTO region_information
(region_code, region_name)
VALUES
('CASE', 'Caribbean Sea');

INSERT INTO region_information
(region_code, region_name)
VALUES
('BASE', 'Baltic Sea');

INSERT INTO region_information
(region_code, region_name)
VALUES
('BOFB', 'Bay of Biscay');

INSERT INTO region_information
(region_code, region_name)
VALUES
('AESE', 'Aegean Sea');

INSERT INTO region_information
(region_code, region_name)
VALUES
('DEST', 'Denmark Strait');

INSERT INTO region_information
(region_code, region_name)
VALUES
('IRSE', 'Irish Sea');

INSERT INTO region_information
(region_code, region_name)
VALUES
('MESE', 'Mediterranean Sea');

INSERT INTO region_information
(region_code, region_name)
VALUES
('BABA', 'Baffin Bay');

INSERT INTO region_information
(region_code, region_name)
VALUES
('GRSE', 'Greenland Sea');

-- Inserts into DISPUTED_REGION

INSERT INTO disputed_region
(dispute_code, region_code, region_importance, start_date, end_date)
VALUES
('BOFF1', 'BOFF', 'Gold mine', SYSDATE - 70, SYSDATE - 60);

INSERT INTO disputed_region
(dispute_code, region_code, region_importance, start_date, end_date)
VALUES
('BABA1', 'BABA', 'Pirate vacation resort', SYSDATE - 50, SYSDATE - 10);

INSERT INTO disputed_region
(dispute_code, region_code, region_importance, start_date, end_date)
VALUES
('GOFM1', 'GOFM', 'Best pirate parrots in the world', SYSDATE - 40, SYSDATE - 10);

INSERT INTO disputed_region
(dispute_code, region_code, region_importance, start_date, end_date)
VALUES
('BOFF2', 'BOFF', 'Abundance of fish', SYSDATE - 50, NULL);

INSERT INTO disputed_region
(dispute_code, region_code, region_importance, start_date, end_date)
VALUES
('NASO1', 'NASO', 'Sunken galleon filled with priceless jewels', SYSDATE - 20, SYSDATE - 10);

INSERT INTO disputed_region
(dispute_code, region_code, region_importance, start_date, end_date)
VALUES
('BUBA1', 'BUBA', 'Location of ''Be Your Best Pirate'' conference', SYSDATE - 5, SYSDATE - 4);

INSERT INTO disputed_region
(dispute_code, region_code, region_importance, start_date, end_date)
VALUES
('CASE1', 'CASE', 'Silver mine', SYSDATE - 50, NULL);

-- Inserts into CONFLICT_DETAIL

INSERT INTO conflict_detail
(conflict_id, dispute_code, pirate_id, vessel_id)
VALUES
(seq_conflict.NEXTVAL, 'BABA1', 1, 10);

INSERT INTO conflict_detail
(conflict_id, dispute_code, pirate_id, vessel_id)
VALUES
(seq_conflict.NEXTVAL, 'BOFF1', 1, 120);

INSERT INTO conflict_detail
(conflict_id, dispute_code, pirate_id, vessel_id)
VALUES
(seq_conflict.NEXTVAL, 'BABA1', 4, 180);

INSERT INTO conflict_detail
(conflict_id, dispute_code, pirate_id, vessel_id)
VALUES
(seq_conflict.NEXTVAL, 'BUBA1', 1, 10);

INSERT INTO conflict_detail
(conflict_id, dispute_code, pirate_id, vessel_id)
VALUES
(seq_conflict.NEXTVAL, 'BOFF2', 4, 180);

INSERT INTO conflict_detail
(conflict_id, dispute_code, pirate_id, vessel_id)
VALUES
(seq_conflict.NEXTVAL, 'CASE1', 1, 120);

INSERT INTO conflict_detail
(conflict_id, dispute_code, pirate_id, vessel_id)
VALUES
(seq_conflict.NEXTVAL, 'BABA1', 10, 90);

INSERT INTO conflict_detail
(conflict_id, dispute_code, pirate_id, vessel_id)
VALUES
(seq_conflict.NEXTVAL, 'CASE1', 4, 180);

INSERT INTO conflict_detail
(conflict_id, dispute_code, pirate_id, vessel_id)
VALUES
(seq_conflict.NEXTVAL, 'GOFM1', 6, 20);

INSERT INTO conflict_detail
(conflict_id, dispute_code, pirate_id, vessel_id)
VALUES
(seq_conflict.NEXTVAL, 'BOFF2', 15, 70);

INSERT INTO conflict_detail
(conflict_id, dispute_code, pirate_id, vessel_id)
VALUES
(seq_conflict.NEXTVAL, 'BUBA1', 20, 50);

INSERT INTO conflict_detail
(conflict_id, dispute_code, pirate_id, vessel_id)
VALUES
(seq_conflict.NEXTVAL, 'GOFM1', 11, 200);

INSERT INTO conflict_detail
(conflict_id, dispute_code, pirate_id, vessel_id)
VALUES
(seq_conflict.NEXTVAL, 'NASO1', 10, 90);

INSERT INTO conflict_detail
(conflict_id, dispute_code, pirate_id, vessel_id)
VALUES
(seq_conflict.NEXTVAL, 'BOFF1', 22, 180);

INSERT INTO conflict_detail
(conflict_id, dispute_code, pirate_id, vessel_id)
VALUES
(seq_conflict.NEXTVAL, 'NASO1', 25, 20);

-- Inserts into LOAD_TABLE1


-- Inserts into LOAD_TABLE2


