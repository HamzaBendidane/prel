ALTER TABLE temp_dgf_form_organisme_formation
DROP COLUMN id_ref_esclave_contacts_organisme_formation

ALTER TABLE temp_dgf_form_organisme_formation
ADD  id_ref_esclave_contacts_organisme_formation CHAR(25)