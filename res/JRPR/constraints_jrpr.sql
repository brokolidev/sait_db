ALTER TABLE vessel_type
  ADD CONSTRAINT pk_vessel_type PRIMARY KEY(vessel_type_code);
  
ALTER TABLE pirate_information
  ADD CONSTRAINT pk_pirate_info PRIMARY KEY(pirate_id)
  ADD CONSTRAINT ck_pi_active_flag CHECK(active_flag IN ('Y', 'N'));
  
ALTER TABLE vessel_information
  ADD CONSTRAINT pk_vessel_info PRIMARY KEY(vessel_id)
  ADD CONSTRAINT ck_vi_active_flag CHECK(active_flag IN ('Y', 'N'))
  ADD CONSTRAINT fk_vi_to_vt FOREIGN KEY(vessel_type_code) REFERENCES vessel_type(vessel_type_code);
  
ALTER TABLE vessel_captain
  ADD CONSTRAINT pk_vessel_captain PRIMARY KEY(pirate_id, vessel_id)
  ADD CONSTRAINT fk_vc_to_pi FOREIGN KEY(pirate_id) REFERENCES pirate_information(pirate_id)
  ADD CONSTRAINT fk_vc_to_vi FOREIGN KEY(vessel_id) REFERENCES vessel_information(vessel_id);
  
ALTER TABLE region_information
  ADD CONSTRAINT pk_region_info PRIMARY KEY(region_code);
  
ALTER TABLE disputed_region
  ADD CONSTRAINT pk_disputed_region PRIMARY KEY(dispute_code)
  ADD CONSTRAINT fk_dr_to_ri FOREIGN KEY(region_code) REFERENCES region_information(region_code)
  MODIFY region_code CONSTRAINT nn_region_code NOT NULL;
  
  
ALTER TABLE conflict_detail
  ADD CONSTRAINT pk_conflict_details PRIMARY KEY(conflict_id)
  ADD CONSTRAINT fk_cd_to_dr FOREIGN KEY(dispute_code) REFERENCES disputed_region(dispute_code)
  ADD CONSTRAINT fk_cd_to_vc FOREIGN KEY(pirate_id, vessel_id) REFERENCES vessel_captain(pirate_id, vessel_id)
  MODIFY dispute_code CONSTRAINT nn_dispute_code NOT NULL
  MODIFY pirate_id CONSTRAINT nn_pirate_id NOT NULL
  MODIFY vessel_id CONSTRAINT nn_vessel_id NOT NULL;
  
  