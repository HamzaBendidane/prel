<?php

/**
 * Récupère les informations concernant le salarié
 * @return $result
 */
function formation_db_get_temp_dgf_form_formation($id_dgf) {
  db_set_active(@DB_EXTRANET);
  $result = db_select('temp_dgf_form_formation', 'f')
    ->fields('f')
    ->condition('id_dgf', $id_dgf, '=')
    ->condition('is_delete', 0, '=')
    ->execute()
    ->fetchAssoc();

  if($result) {
    $result['ref_diplome'] = share_get_code_label('extranet','ref_diplome', $result['id_ref_finalite_formation']);
  }

  db_set_active();


  db_set_active(@DB_SLAVE);
  if($result) {

    $result['specialites_de_formation'] = share_get_code_label('referentiel','specialites_de_formation', $result['id_ref_esclave_specialite']);
  }
  db_set_active();


  return $result;
}


function check_entreprise_nb_salarie($id_dgf){

    $dgf_data = get_entreprise_data_extranet($id_dgf);

    $entreprise_data = shared_db_get_entreprise_data($dgf_data[0]->id_ref_esclave_entreprise);
    return trim(@$entreprise_data->id_categorie);

}

/**
 * Récupère les informations concernant les répartitions de la formation reçue
 * @return $result
 */
function formation_db_get_dgf_form_formation_repartition($id_formation) {
  db_set_active(@DB_EXTRANET);

  $result = db_select('dgf_form_formation_repartition', 'r')
  ->fields('r')
  ->condition('id_dgf_form_formation', $id_formation, '=')
  ->condition('is_delete', 0, '=')
  ->execute()
  ->fetchAssoc();
  db_set_active();

  return $result;
}

function formation_db_get_temp_dgf_form_formation_repartition($id_dgf_formation) {
  db_set_active(@DB_EXTRANET);
  $result = db_select('temp_dgf_form_formation_repartition', 'f')
    ->fields('f')
    ->condition('id_dgf_form_formation', $id_dgf_formation, '=')
    ->execute()
    ->fetchAll();

  db_set_active();

  return $result;
}

/* Retourne une formation de dgf_formation via l'id
 * @param $id
 * @return les donnes de dgf_foramtion
 * */
/**
 * Retourne une formation de dgf_formation via l'id
 * @author gael galbas
 * @param str id de la formation
 * @return array les informations de la formation
 */
function formation_db_get_dgf_form_formation($id) {
  db_set_active(@DB_EXTRANET);
  $result = db_select('dgf_form_formation', 'f')
  ->fields('f')
  ->condition('id', $id, '=')
  ->execute()
  ->fetchAll();

  db_set_active();

  return $result;
}


function formation_db_get_referentiel_esclave_data() {
  db_set_active(@DB_SLAVE);

  $results = db_select('intitules_de_formation', 'ifo')
    ->fields('ifo')
    ->condition('est_actif', 1, '=')
    ->condition('est_valide', 1, '=')
    ->execute()
    ->fetchAll();

  $intitules_formation = array();
  foreach ($results as $int_form) {
    $intitules_formation[trim($int_form->id)] = trim($int_form->libelle);
  }

  $results = db_select('specialites_de_formation', 'sf')
    ->fields('sf')
    ->condition('est_actif', 1, '=')
    ->condition('est_valide', 1, '=')
    ->execute()
    ->fetchAll();

  $specialites_formation = array('Veuillez choisir dans la liste');
  foreach ($results as $spe_form) {
    $specialites_formation[trim($spe_form->id)] = trim($spe_form->libelle);
  }

  db_set_active();

  $datas_extranet = array(
      'intitules_formation' => $intitules_formation,
      'specialites_formation' => $specialites_formation,
  );

  return $datas_extranet;
}

/**
 * Cette fonction extrait les formations recurrentes
 * @author gael galbas
 * @return $formations_recurrentes liste des formations récurrentes
 */
function formation_db_get_formations_recurrentes() {
  global $user;
  db_set_active(@DB_EXTRANET);

  $dateM1A = new DateTime();
  $dateM1A->sub(new DateInterval('P01Y'));

  $query = db_select('dgf_form_formation', 'f')
  ->condition('f.is_delete', 0, '=')
  ->condition('f.date_creation', $dateM1A->format('Y-m-d\Th:i:s'), '>')
  ->condition('f.id_user_creation', $user->uid, '=')
  ->groupBy('t_intitule_formation')
  ->groupBy('t_saisie_libre_intitule_formation');

  $query->fields('f', array(
      't_intitule_formation',
      't_saisie_libre_intitule_formation',
  ));
  $query->addExpression('count(*)', 'count');
  $query->addExpression('max(id)', 'max_id');
  $query->range(0, 4);
  $query->orderBy('count', 'DESC');

  $recurrentes = $query->execute()->fetchAll();

  $results = array();
  foreach ($recurrentes as $recurrente) {
    $results[] = formation_db_get_dgf_form_formation($recurrente->max_id)[0];
  }

  $nb_rows = count($results);
  for ($i = 0; $i < $nb_rows; $i++) {
    $id_formation = $results[$i]->id;
    $results[$i]->formation_repartition = formation_db_get_dgf_form_formation_repartition($id_formation);
  }

  db_set_active(@DB_SLAVE);
  // Extraction des id des intitulés présents dans le référenciel esclave
  $query = db_select('v_intitules_de_formation', 'ifo');
  $query->fields('ifo');
  $query->condition('ifo.est_actif = ', 1, '=');
  $intitules_formation = $query->execute()->fetchAll();

  $ref_intitules = array();
  foreach ($intitules_formation as $intitule_form) {
  			$ref_intitules[trim($intitule_form->id)] = trim($intitule_form->libelle);
  }
  db_set_active();

  $formations_recurrentes = array();
  foreach ($results as $result) {

    if(!($id_referenciel = array_search(trim($result->t_intitule_formation), $ref_intitules))) {
      $id_referenciel = '0';
    }
  	$formations_recurrentes[] = array(
  	    'id_formation' => $id_referenciel,
  	    'libelle' => $result->t_intitule_formation ? trim($result->t_intitule_formation) : trim($result->t_saisie_libre_intitule_formation),
  	    'num_cqpi' => trim($result->t_num_cqpi),
  	    'type_qualification' => trim(@$result->t_type_qualification),
        'date_debut' => $result->t_date_debut,
        'date_examen' => $result->t_date_examen,
  	    'finalite_formation' => trim($result->t_finalite_formation),
        'duree_totale_heure' => trim($result->t_duree_totale_heure),
        'duree_ens_gen_heure' => trim($result->t_duree_ens_gen_heure),
  	    'duree_acc_heure' => trim($result->t_duree_acc_heure),
        'formation_interne' => trim($result->t_formation_interne),
        'specialite' => trim($result->t_specialite),
        't_num_cqpi' => trim($result->t_num_cqpi),
  	    'type_qualification' => trim($result->t_type_qualification),
  	    'formation_repartition1' => isset($result->formation_repartition[0]->t_repartition_heure) ? $result->formation_repartition[0]->t_repartition_heure : null,
  	    'formation_repartition2' => isset($result->formation_repartition[1]->t_repartition_heure) ? $result->formation_repartition[1]->t_repartition_heure : null,
  	    'formation_repartition3' => isset($result->formation_repartition[2]->t_repartition_heure) ? $result->formation_repartition[2]->t_repartition_heure : null,
  	);
  }
  return $formations_recurrentes;
}

function formation_db_get_referentiel_esclave_intitule_formation() {
  db_set_active(@DB_SLAVE);

  $term = $_GET["term"];

  $query = db_select('v_intitules_de_formation', 'ifo');
  $query->fields('ifo');
  $query->condition('ifo.est_valide = ', 1, '=');
  $query->condition('ifo.est_actif = ', 1, '=');
  $query->condition('ifo.libelle', '%' . db_like($term) . '%' , 'LIKE');
  $intitules_formation = $query->execute()->fetchAll();

  $data = array();
  foreach ($intitules_formation as $intitule_form) {
    $data[] = array(
        'value' => trim($intitule_form->libelle),
        'label' => trim($intitule_form->libelle),
        'data'  => $intitule_form,
    );
  }

  db_set_active();

  // Renvoie des résultats en json
  drupal_json_output($data);
}

function formation_db_insert_temp_dgf_form_autre_dispo ($form_data,$id_dgf) {
  global $user;


  db_set_active(@DB_EXTRANET);

  $query = db_insert('temp_dgf_form_formation')
  ->fields(array(
      'id_dgf' => intval($id_dgf),
      'id_ref_finalite_formation' => $form_data['values']['finalite_formation'],
      'id_ref_esclave_intitule_formation' => trim($form_data['values']['id_libelle']) != '' ?
      trim($form_data['values']['id_libelle']) : null,
      'id_ref_esclave_specialite' => $form_data['values']['specialty_training'],
      'intitule_finalite' => null,
      'intitule_formation' => $form_data['values']['libelle'],
      'num_cqpi' => $form_data['values']['type_qualification'] != 2 ? $form_data['values']['num_CQPI_CQPM'] : null,
      'formation_interne' => $form_data['values']['internal_training'],
      'date_debut' => shared_send_to_mssql_date($form_data['values']['training_start']),
      'date_fin' => shared_send_to_mssql_date($form_data['values']['date_end']),
      'date_examen' => shared_send_to_mssql_date($form_data['values']['date_exam']),
      'duree_totale_heure' => $form_data['values']['total_duration'],
      'duree_ens_gen_heure' => $form_data['values']['duration_main_learning'],
      'duree_acc_heure' => $form_data['values']['accompanying_actions'],
      'date_creation' => shared_send_to_mssql_date(null, 'datetime'),
      'id_user_creation' => $user->uid,
      'is_delete' => 0,
  ));
  $id_form_formation = $query->execute();

  // save date begin et date end de contrat
  $query = db_update('temp_dgf_form_contrat')
  ->fields(array(
      'date_debut' => shared_send_to_mssql_date($form_data['values']['date_begin']),
      'date_fin' => shared_send_to_mssql_date($form_data['values']['date_end']),
      'date_last_edit' => shared_send_to_mssql_date(null, 'datetime'),
      'id_user_last_edit' => $user->uid,
  ));
  $query->condition('id_dgf', $form_data['values']['id_dgf'], '=');

  $query->execute();

  db_set_active();

  return $id_form_formation;
}function formation_db_insert_temp_dgf_form_formation($form_data) {
  global $user;


  db_set_active(@DB_EXTRANET);

  $query = db_insert('temp_dgf_form_formation')
    ->fields(array(
      'id_dgf' => intval($form_data['values']['id_dgf']),
      'id_type_qualification' => $form_data['values']['type_qualification'],
//       'id_ref_esclave_niveau' => $form_data['values']['type_qualification'],
      'id_ref_finalite_formation' => $form_data['values']['finalite_formation'],
      'id_ref_esclave_intitule_formation' => trim($form_data['values']['id_libelle']) != '' ?
        trim($form_data['values']['id_libelle']) : null,
      'id_ref_esclave_specialite' => $form_data['values']['specialty_training'],
      'intitule_finalite' => null,
      'intitule_formation' => $form_data['values']['libelle'],
      'num_cqpi' => $form_data['values']['type_qualification'] != 2 ? $form_data['values']['num_CQPI_CQPM'] : null,
      'formation_interne' => isset($form_data['values']['internal_training']) ? $form_data['values']['internal_training'] : null,
      'date_debut' => shared_send_to_mssql_date($form_data['values']['training_start']),
      'date_fin' => shared_send_to_mssql_date($form_data['values']['date_end']),
      'date_examen' => shared_send_to_mssql_date($form_data['values']['date_exam']),
      'duree_totale_heure' => $form_data['values']['total_duration'],
      'duree_ens_gen_heure' => $form_data['values']['duration_main_learning'],
      'duree_acc_heure' => $form_data['values']['accompanying_actions'],
      'date_creation' => shared_send_to_mssql_date(null, 'datetime'),
      'id_user_creation' => $user->uid,
      'is_delete' => 0,
  ));
  $id_form_formation = $query->execute();

  // save date begin et date end de contrat
  $query = db_update('temp_dgf_form_contrat')
    ->fields(array(
      'date_debut' => shared_send_to_mssql_date($form_data['values']['date_begin']),
      'date_fin' => shared_send_to_mssql_date($form_data['values']['date_end']),
      'date_last_edit' => shared_send_to_mssql_date(null, 'datetime'),
      'id_user_last_edit' => $user->uid,
  ));
  $query->condition('id_dgf', $form_data['values']['id_dgf'], '=');

  $query->execute();

  db_set_active();

  return $id_form_formation;
}

function formation_db_update_temp_dgf_form_formation($form_data) {
  global $user;

  db_set_active(@DB_EXTRANET);
  $query = db_update('temp_dgf_form_formation')
    ->fields(array(
//         'id_ref_esclave_niveau' => $form_data['values']['type_qualification'],
      'id_type_qualification' => $form_data['values']['type_qualification'],
      'id_ref_finalite_formation' => $form_data['values']['finalite_formation'],
      'id_ref_esclave_intitule_formation' => trim($form_data['values']['id_libelle']) != '' ?
        trim($form_data['values']['id_libelle']) : null,
      'id_ref_esclave_specialite' => $form_data['values']['specialty_training'],
      'intitule_finalite' => null,
      'intitule_formation' => $form_data['values']['libelle'],
      'num_cqpi' => $form_data['values']['type_qualification'] != 2 ? $form_data['values']['num_CQPI_CQPM'] : null,
      'formation_interne' => isset($form_data['values']['internal_training']) ? $form_data['values']['internal_training']: null,
      'date_debut' => shared_send_to_mssql_date($form_data['values']['training_start']),
      'date_fin' => shared_send_to_mssql_date($form_data['values']['date_end']),
      'date_examen' => shared_send_to_mssql_date($form_data['values']['date_exam']),
      'duree_totale_heure' => $form_data['values']['total_duration'],
      'duree_ens_gen_heure' => $form_data['values']['duration_main_learning'],
      'duree_acc_heure' => $form_data['values']['accompanying_actions'],
      'date_last_edit' => shared_send_to_mssql_date(null, 'datetime'),
      'id_user_last_edit' => $user->uid,
      'is_delete' => 0,
  ))
  ->condition('id_dgf', $form_data['values']['id_dgf'], '=');
$query->execute();

  // save date begin et date end de contrat
  $query = db_update('temp_dgf_form_contrat')
    ->fields(array(
      'date_debut' => shared_send_to_mssql_date($form_data['values']['date_begin']),
      'date_fin' => shared_send_to_mssql_date($form_data['values']['date_end']),
      'date_last_edit' => shared_send_to_mssql_date(null, 'datetime'),
      'id_user_last_edit' => $user->uid,
  ));
  $query->condition('id_dgf', $form_data['values']['id_dgf'], '=');

  $query->execute();

  db_set_active();
}

function formation_db_delete_insert_temp_dgf_form_formation_repartition($form_data, $id_form_formation, $create) {
  db_set_active(@DB_EXTRANET);

  if (!$create) {
    // SUPPRESSION DE LA SAISIE PRÉCÉDENTE
    $query = db_delete ('temp_dgf_form_formation_repartition')
      ->condition('id_dgf_form_formation', $id_form_formation, '=')
      ->execute();
  }

  $date_training_start = date_create_from_format ('d/m/Y', $form_data['values']['training_start']);
  $annee = (int)($date_training_start->format('Y'));

  for ($i = 1; $i <= 3; $i++) {
    $year = 'year'.$i;
    if ($form_data['values'][$year] != '') {
      $query = db_insert('temp_dgf_form_formation_repartition')
        ->fields(array(
          'id_dgf_form_formation' => $id_form_formation,
          'annee' => $annee + $i - 1,
          'repartition_heure' => (int)$form_data['values']['year'.$i]
      ))
      ->execute ();
    }
  }

  db_set_active();
}

function get_formation_data_extranet($id_dgf) {
    db_set_active(@DB_EXTRANET);

     $query = "SELECT
 forma.id_dgf as id_dgf,
 fina.label as t_finalite_formation,
 forma.num_cqpi as t_num_cqpi,
 forma.intitule_formation as t_saisie_libre_intitule_formation,
 forma.reference_interne as t_reference_interne,
 forma.intitule_finalite as t_intitule_finalite,
 forma.date_debut as t_date_debut,
 forma.date_fin as t_date_fin,
 forma.date_examen as t_date_examen,
 forma.duree_jours as t_duree_jours,
 forma.duree_heures as t_duree_heures,
 forma.duree_totale_heure as t_duree_totale_heure,
 forma.duree_ens_gen_heure as t_duree_ens_gen_heure,
 forma.duree_acc_heure as t_duree_acc_heure,
 forma.formation_interne as t_formation_interne,
 forma.nb_participant as t_nb_participant,
 forma.formation_intra_entreprise as t_formation_intra_entreprise,
 forma.date_creation as date_creation,
 forma.id_user_creation as id_user_creation,
 forma.date_last_edit as date_last_edit,
 forma.id_user_last_edit as id_user_last_edit,
 forma.date_delete as date_delete,
 forma.id_user_delete as id_user_delete,
 forma.is_delete as is_delete,
 forma.id_type_qualification,

 forma.id_ref_esclave_niveau,
 forma.id_ref_esclave_specialite,
 forma.id_ref_esclave_intitule_formation

  FROM [temp_dgf_form_formation] forma
  left join ref_diplome fina on fina.id = forma.id_ref_finalite_formation
  where  forma.id_dgf = :id_dgf";

    $result = db_query($query,array(':id_dgf'=>$id_dgf));

    $resultdata  = $result->fetchAssoc();
    db_set_active();

    if (!$resultdata) return array();

    return $resultdata;
}

function get_formation_data_referenciel($id_ref_esclave_niveau,$id_ref_esclave_specialite,$id_ref_esclave_intitule_formation, $id_ref_type_qualification) {

    $resultdata['t_intitule_formation'] = shared_get_libelle_by_id('intitules_de_formation',$id_ref_esclave_intitule_formation);
    $resultdata['t_specialite'] = shared_get_libelle_by_id('specialites_de_formation',$id_ref_esclave_specialite);
    $resultdata['t_niveau'] = shared_get_libelle_by_id('niveaux_de_formation',$id_ref_esclave_niveau);
    $resultdata['t_type_qualification'] = shared_get_label_by_id('ref_finalite_formation',$id_ref_type_qualification);

    if (!$resultdata) return array();
    return $resultdata;
}

function formation_convertParam($key,$data){

    $data = shared_format_sqlsrv_datetime_for_insertion($data);

    unset ($data['id_ref_esclave_niveau']);
    unset ($data['id_ref_esclave_specialite']);
    unset ($data['id_ref_esclave_intitule_formation']);
    unset ($data['id_type_qualification']);
    return $data;
}

function process_formation_repartition_extranet($id_dgf,$id) {
    db_set_active(@DB_EXTRANET);

    $query = "SELECT
       rep. [id_dgf_form_formation] as id_dgf_form_formation
      ,rep.[annee] as t_annee
      ,rep.[repartition_heure] as t_repartition_heure,
	  forma.date_creation as date_creation,
	  forma.id_user_creation as id_user_creation,
	  forma.date_last_edit as date_last_edit,
	  forma.date_delete as date_delete,
	  forma.id_user_delete as id_user_delete,
	  forma.is_delete as is_delete
  FROM [temp_dgf_form_formation_repartition] rep
  left join temp_dgf_form_formation forma on rep.[id_dgf_form_formation] = forma.id
  where forma.id_dgf = :id_dgf";

    $result = db_query($query,array(':id_dgf' => $id_dgf));
    while($resultdata  = $result->fetchAssoc()){
        $resultdata['id_dgf_form_formation'] = $id;
        insert_formation_repartition($resultdata,$id);
    };
    db_set_active();
}

function insert_formation_repartition($data)
{
    db_set_active(@DB_EXTRANET);
    $nid = db_insert('dgf_form_formation_repartition');

    $data = formation_convertParam('',$data);

    $nid->fields($data);

    $nid->execute();
    db_set_active();
}

function insert_formation($data)
{
    db_set_active(@DB_EXTRANET);
    $nid = db_insert('dgf_form_formation');

    $data = formation_convertParam('',$data);

    $nid->fields($data);

    return $nid->execute();
    db_set_active();
}

function formation_db_get_intitule_from_cqp() {
  $cqp = $_GET["cqp"];
  db_set_active(@DB_SLAVE);
  $query = db_select('v_intitules_de_formation', 'vif');
  $query->fields('vif', array('libelle'));
  $query->condition('code', $cqp, '=');

  $result = $query->execute()->fetchAssoc();
  db_set_active();
  $data = trim($result['libelle']);

  drupal_json_output($data);
}