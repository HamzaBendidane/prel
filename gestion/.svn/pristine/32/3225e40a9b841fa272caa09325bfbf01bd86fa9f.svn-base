<?php

function dgf_contrat_pro_cerfa_get_dgf_infos($id_dgf = null) {
	// Connection a l'extranet
	db_set_active(@DB_EXTRANET);

	$query = db_select('dgf', 'd');
	$query->condition('id', $id_dgf, '=');
	$query->fields('d');
	$result = $query->execute()->fetchAssoc();

	// Deconnexion à l'extranet
	db_set_active();

	return $result;
}

function dgf_contrat_pro_cerfa_get_lien_dgf_ref_esclave_entreprise_infos($id_dgf = null) {
	// Connection a l'extranet
	db_set_active(@DB_EXTRANET);

	$query = db_select('lien_dgf_ref_esclave_entreprise', 'l');
	$query->condition('id_dgf', $id_dgf, '=');
	$query->fields('l');
	$result = $query->execute()->fetchAssoc();

	// Deconnexion à l'extranet
	db_set_active();

	return $result;
}

function dgf_contrat_pro_cerfa_get_salarie_infos($id_dgf = null) {
	// Connection a l'extranet
	db_set_active(@DB_EXTRANET);

	// SALARIE (partie 1)
	$query = db_select('temp_dgf_form_salarie', 's');
	$query->leftJoin('ref_derniere_situation', 'ds', 'ds.id = s.id_ref_derniere_situation');
	$query->leftJoin('ref_diplome', 'dp', 'dp.id = s.id_ref_diplome');
	$query->leftJoin('ref_beneficiaire_minimas_sociaux', 'ms', 'ms.id = s.id_ref_beneficiaire_minimas_sociaux');
	$query->fields('s');
	$query->addExpression('ds.code', 'derniere_situation');
	$query->addExpression('dp.code', 'diplome');
	$query->addExpression('ms.code', 'min_sociaux');
	$query->condition('id_dgf', $id_dgf, '=');
	$result = $query->execute()->fetchAssoc();

	// Deconnexion à l'extranet
	db_set_active();

	return $result;
}

function dgf_contrat_pro_cerfa_get_tuteur_infos($id_dgf = null) {
	// Connection a l'extranet
	db_set_active(@DB_EXTRANET);

	// TUTEUR (partie 1)
	$query = db_select('temp_dgf_form_tuteur', 't');
	$query->fields('t');
	$query->condition('id_dgf', $id_dgf, '=');
	$result = $query->execute()->fetchAssoc();

	// Deconnexion à l'extranet
	db_set_active();

	return $result;
}

function dgf_contrat_pro_cerfa_get_contrat_infos($id_dgf = null) {
	// Connection a l'extranet
	db_set_active(@DB_EXTRANET);

	// CONTRAT
	$query = db_select('temp_dgf_form_contrat', 'c');
	$query->fields('c');
	$query->condition('id_dgf', $id_dgf, '=');
	$result = $query->execute()->fetchAssoc();

	// Deconnexion à l'extranet
	db_set_active();

	return $result;
}

function dgf_contrat_pro_cerfa_get_temp_dgf_form_formation_infos($id_dgf = null) {
	// Connection a l'extranet
	db_set_active(@DB_EXTRANET);

	// FORMATION
	$query = db_select('temp_dgf_form_formation', 'f');
	$query->fields('f');
	$query->condition('f.id_dgf', $id_dgf, '=');
	$result = $query->execute()->fetchAssoc();

	// Deconnexion à l'extranet
	db_set_active();

	return $result;
}

function dgf_contrat_pro_cerfa_get_temp_dgf_form_organisme_formation_infos($id_dgf = null) {
	// Connection a l'extranet
	db_set_active(@DB_EXTRANET);

	// FORMATION
	$query = db_select('temp_dgf_form_organisme_formation', 'tof');
	$query->fields('tof');
	$query->condition('id_dgf', $id_dgf, '=');
	$result = $query->execute()->fetchAssoc();

	// Deconnexion à l'extranet
	db_set_active();

	return $result;
}

function dgf_contrat_pro_cerfa_get_type_contrat_infos($id_ref_type_contrat = null) {
	// Connection a l'extranet
	db_set_active(@DB_SLAVE);

	$query = db_select('types_de_contrats', 'tc');
	$query->fields('tc');
	$query->condition('tc.id', $id_ref_type_contrat, '=');
	$query->condition('tc.est_actif', 1, '=');
	$query->condition('tc.est_valide', 1, '=');
	$result = $query->execute()->fetchAssoc();
	
	// Deconnexion à l'extranet
	db_set_active();
	return $result;
}

function dgf_contrat_pro_cerfa_get_ref_groupe_infos($id_ref_groupe = null) {
	// Connection a l'extranet
	db_set_active(@DB_EXTRANET);

	$query = db_select('ref_groupe', 'g');
	$query->fields('g');
	$query->condition('g.id', $id_ref_groupe, '=');
	$result = $query->execute()->fetchAssoc();

	// Deconnexion à l'extranet
	db_set_active();

	return $result;
}


function dgf_contrat_pro_cerfa_get_vue_entreprises_infos($id_ref_entreprise = null) {
	// Connection a la base esclave
	db_set_active(@DB_SLAVE);
	// ENTREPRISE
	$query = db_select('v_entreprises', 'e');
	$query->fields('e');
	$query->condition('est_actif', 1, '=');
	$query->condition('id', $id_ref_entreprise, '=');
	$result = $query->execute()->fetchAssoc();

	// Deconnexion à l'extranet
	db_set_active();

return $result;
}

function dgf_contrat_pro_cerfa_get_vue_naf_infos($id_ref_naf = null) {
  // Connection a la base esclave
  db_set_active(@DB_SLAVE);
  // ENTREPRISE
  $query = db_select('v_nafs', 'n');
  $query->fields('n');
  $query->condition('est_actif', 1, '=');
  $query->condition('id', $id_ref_naf, '=');
  $result = $query->execute()->fetchAssoc();

  // Deconnexion à l'extranet
  db_set_active();

  return $result;
}

function dgf_contrat_pro_cerfa_get_vue_nace_infos($id_ref_naf = null) {
    // Connection a la base esclave
    db_set_active(@DB_SLAVE);
    // ENTREPRISE
    $query = db_select('v_naces', 'n');
    $query->fields('n');
    $query->condition('est_actif', 1, '=');
    $query->condition('id', $id_ref_naf, '=');
    $result = $query->execute()->fetchAssoc();

    // Deconnexion à l'extranet
    db_set_active();

    return $result;
}

function dgf_contrat_pro_cerfa_get_vue_adresses_entreprises_infos($id_ref_entreprise = null) {
	// Connection a la base esclave
	db_set_active(@DB_SLAVE);

	// ADRESSE ENTREPRISE
	$query = db_select('v_adresses_entreprises', 'ae');
	$query->fields('ae');
	//$query->condition('est_valide' , 1, '=');
	//$query->condition('est_actif', 1, '=');
	$query->condition('id_entreprise', $id_ref_entreprise, '=');
	$result = $query->execute()->fetchAssoc();

	// Deconnexion à l'extranet
	db_set_active();

	return $result;
}

function dgf_contrat_pro_cerfa_get_vue_conventions_collectives_infos($id_convention_collective = null) {
	// Connection a la base esclave
	db_set_active(@DB_SLAVE);

	// CONVENTION COLLECTIVE
	$query = db_select('v_conventions_collectives', 'cc');
	$query->fields('cc');
	$query->condition('est_actif', 1, '=');
	$query->condition('id', $id_convention_collective, '=');
	$result = $query->execute()->fetchAssoc();

	// Deconnexion à l'extranet
	db_set_active();

	return $result;
}

function dgf_contrat_pro_cerfa_get_vue_salaries_infos($id_ref_salarie = null) {
	// Connection a la base esclave
	db_set_active(@DB_SLAVE);

	// SALARIE (partie 2)
	$query = db_select('v_salaries', 'rs');
	$query->leftJoin('v_civilites', 'vc', 'vc.id = rs.id_civilite');
	$query->fields('rs', array('nom', 'prenom', 'date_de_naissance', 'id_civilite', 'est_travailleur_handicape'));
	$query->fields('vc', array('libelle'));
	$query->condition('rs.id', $id_ref_salarie, '=');
	$result = $query->execute()->fetchAssoc();

	// Deconnexion à l'extranet
	db_set_active();

	return $result;
}


// function dgf_contrat_pro_cerfa_get_vue_specialites_de_formation_infos($id_ref_esclave_specialite = null) {
function dgf_contrat_pro_cerfa_get_specialites_de_formation_infos($id_ref_esclave_specialite = null) {
	// Connection a la base esclave
	db_set_active(@DB_SLAVE);

	// SPECIALITE FORMATION
	$query = db_select('specialites_de_formation', 'sf');
	$query->fields('sf');
	$query->condition('sf.id', $id_ref_esclave_specialite, '=');
	$result = $query->execute()->fetchAssoc();

	// Deconnexion à l'extranet
	db_set_active();

	return $result;
}

function dgf_contrat_pro_cerfa_get_vue_intitules_de_formation_infos($id_ref_esclave_intitule_formation = null) {
	// Connection a la base esclave
	db_set_active(@DB_SLAVE);

	// INTITULE FORMATION
	$query = db_select('v_intitules_de_formation', 'i');
	$query->fields('i');
	$query->condition('i.id', $id_ref_esclave_intitule_formation, '=');
	$result = $query->execute()->fetchAssoc();

	// Deconnexion à l'extranet
	db_set_active();

	return $result;
}

function dgf_contrat_pro_cerfa_get_convention($id_cc) {
  db_set_active(@DB_SLAVE);

  // CONVENTION COLLECTIVE
  $query = db_select('v_conventions_collectives', 'vcc');
  $query->fields('vcc', array('code', 'libelle'));
  $query->condition('vcc.id', $id_cc, '=');
  $result = $query->execute()->fetchAssoc();

  db_set_active();

  return $result;
}




