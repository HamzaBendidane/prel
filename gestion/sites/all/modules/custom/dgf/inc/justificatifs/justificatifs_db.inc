<?php

function justificatifs_db_get_directory_info($id_dgf) {
  db_set_active(@DB_EXTRANET);

  $result = array();

  $query = db_select('dgf' , 'dgf')
    ->fields('dgf', array('numero_demande'))
    ->condition('id' , $id_dgf, '=')
    ->execute();
  $numero_demande = $query->fetchField();

  $result['numero_demande'] = $numero_demande;

  $query = db_select('lien_dgf_ref_esclave_entreprise' , 'lre')
  ->fields('lre', array('id_ref_esclave_entreprise'))
  ->condition('id_dgf' , $id_dgf, '=')
  ->execute();
  $id_ref_esclave_entreprise = $query->fetchField();

  db_set_active(@DB_SLAVE);

  $query = db_select('v_entreprises' , 'ven')
    ->fields('ven', array('siret'))
    ->condition('id' , $id_ref_esclave_entreprise, '=')
    ->condition('est_actif' , 1, '=')
    ->condition('est_valide' , 1, '=')
    ->execute();
  $siret = $query->fetchField();

  $result['siret'] = $siret;

  db_set_active();

  return $result;

}

function justificatifs_db_get_ref_justificatif($id_dgf, $temp_dgf_form_justificatif) {
  db_set_active(@DB_EXTRANET);

  $query = db_select('temp_dgf_form_demande' , 'dem')
    ->fields('dem', array('id_dgf_nature_demande'))
    ->condition('id_dgf' , $id_dgf, '=')
    ->execute();
  $id_nature_demande = $query->fetchField();

  if (!$id_nature_demande) {
    db_set_active();
    return array();
  }

  // Renvoie les données ref jsutificatifs pour la nature de demande sélectionné
  $query = db_select('ref_justificatif' , 'jus')
    ->fields('jus')
    ->condition('is_delete', 0, '=')
    ->orderBy('jus.is_mandatory, jus.label' , 'asc')
    ->execute();

  $ref_justificatifs = $query->fetchAll();

  foreach ($ref_justificatifs as $key => $justificatif) {
    if (in_array($justificatif->id, array_keys($temp_dgf_form_justificatif))) {
      unset($ref_justificatifs[$key]);
    }
  }

  db_set_active();

  return $ref_justificatifs;
}

function justificatifs_db_get_temp_dgf_form_justificatif($id_dgf, $id_justificatif = null) {
  db_set_active(@DB_EXTRANET);
  if (!$id_justificatif) {
    $query = db_select('temp_dgf_form_justificatif', 'jus');
    $query->join('ref_justificatif', 'rju', 'rju.id = jus.id_ref_justificatifs');
    $query->fields('jus')
      ->fields('rju', array('label', '[is_mandatory]'))
      ->condition('jus.id_dgf', $id_dgf, '=')
      ->condition('jus.is_delete', 0, '=')
      ->condition('rju.is_delete', 0, '=');
    $results = $query->execute()
      ->fetchAll();

    $justificatifs = array();
    foreach ($results as $result) {
      $justificatifs[$result->id_ref_justificatifs] = $result;
    }
  } else {
    $justificatifs = db_select('temp_dgf_form_justificatif', 'jus')
      ->fields('jus')
      ->condition('jus.id', $id_justificatif, '=')
      ->condition('jus.id_dgf', $id_dgf, '=')
      ->execute()
      ->fetchAssoc();
  }

  db_set_active();

  return $justificatifs;
}

function justificatifs_db_delete_temp_dgf_form_justificatif($id_justificatif) {
  global $user;

  db_set_active(@DB_EXTRANET);

  $query = db_update('temp_dgf_form_justificatif')->fields(array(
      'is_delete' => 1,
      'date_delete' => shared_send_to_mssql_date(null, 'datetime'),
      'id_user_delete' => $user->uid,
  ))
  ->condition('id', $id_justificatif, '=')
  ->execute();

  db_set_active();
}


/**
 *  Sauvegarde les pièces jointes en bases de données
 *
 *  @table: dgf_form_justificatifs
 *
 *  Service AJAX qui sauvegarde les pièces jointes
 *
 */
function justificatifs_db_save_files($form_state, $destination, $repertoire_fichier, $file_name_cleaned, $file_tmp,
    $file_size) {
  global $user;

  db_set_active(@DB_EXTRANET);

  $id_dgf = $form_state['values']['id_dgf'];
  $id_ref_justificatifs = $form_state['values']['id_ref_file'];

  $id_temp_dgf_form_justificatif  = db_insert('temp_dgf_form_justificatif')
  ->fields(array(
      'id_dgf' => $id_dgf,
      'id_ref_justificatifs' => $id_ref_justificatifs,
      'nom_fichier'   => $file_name_cleaned,
      'chemin_fichier' => $destination,
      'repertoire_fichier' => $repertoire_fichier,
      'taille_fichier' => $file_size,
      'date_creation' => shared_send_to_mssql_date(null, 'datetime'),
      'id_user_creation' => $user->uid,
      ))
  ->execute();

  $name = $id_dgf . '_' . $id_temp_dgf_form_justificatif . '_' . $file_name_cleaned;
  $query = db_update('temp_dgf_form_justificatif')
    ->fields(array('nom_fichier' => $name))
    ->condition('id', $id_temp_dgf_form_justificatif, '=' )
    ->execute();

  // DEPLACE LE FICHIER DANS LE BON REP
  move_uploaded_file($file_tmp, $destination.$name);

  db_set_active();
}


function get_justificatif_data_extranet($id_dgf) {
    db_set_active(@DB_EXTRANET);

    $query = "SELECT

 justif.id_dgf as id_dgf,
  justif.nom_fichier as t_fichier,
 justif.chemin_fichier as t_chemin_fichier,
 refjutif.label as t_nom_ref_fichier,
 justif.nom_fichier as t_nom_fichier,
 justif.repertoire_fichier as t_repertoire_fichier,
 refjutif.is_mandatory as t_obligatoire,
 '' as t_extension_fichier,
 justif.date_creation as date_creation,
 justif.id_user_creation as id_user_creation,
 justif.date_last_edit as date_last_edit,
 justif.id_user_last_edit as id_user_last_edit,
 justif.date_delete as date_delete,
 justif.id_user_delete as id_user_delete,
 justif.is_delete as is_delete

  FROM [temp_dgf_form_justificatif] justif
  left join ref_justificatif refjutif on refjutif.id = justif.id_ref_justificatifs
where justif.id_dgf = :id_dgf";

    $result = db_query($query,array(':id_dgf' => $id_dgf));

    while($data = $result->fetchAssoc()){
        insert_justificatif($data);
    };
    db_set_active();
}


function get_justificatif_data_referenciel() {

    return array();

}

function justificatif_convertParam($key,$data)
{

    $data = shared_format_sqlsrv_datetime_for_insertion($data);

    return $data;
}

function insert_justificatif($data)
{
    db_set_active(@DB_EXTRANET);
    $nid = db_insert('dgf_form_justificatif');

    $data = justificatif_convertParam('',$data);

    $nid->fields($data);

    $nid->execute();
    db_set_active();
}


function get_justificatif_payment_data_extranet($id_dgf) {
    db_set_active(@DB_EXTRANET);

    $query = "SELECT

 justif.id_dgf as id_dgf,
  justif.nom_fichier as t_fichier,
 justif.chemin_fichier as t_chemin_fichier,
 refjutif.label as t_nom_ref_fichier,
 justif.nom_fichier as t_nom_fichier,
 justif.repertoire_fichier as t_repertoire_fichier,
 refjutif.is_mandatory as t_obligatoire,
 '' as t_extension_fichier,
 justif.date_creation as date_creation,
 justif.id_user_creation as id_user_creation,
 justif.date_last_edit as date_last_edit,
 justif.id_user_last_edit as id_user_last_edit,
 justif.date_delete as date_delete,
 justif.id_user_delete as id_user_delete,
 justif.is_delete as is_delete

  FROM [temp_dgf_form_justificatif] justif
  left join ref_justificatif refjutif on refjutif.id = justif.id_ref_justificatifs
where justif.id_dgf = :id_dgf";

    $result = db_query($query,array(':id_dgf' => $id_dgf));

    $resultdata  = $result->fetchAssoc();
    db_set_active();

    return $resultdata;
}


function get_justificatif_payment_data_referenciel() {

    return array();

}

function justificatif_payment_convertParam($key,$data)
{
    $data = shared_format_sqlsrv_datetime_for_insertion($data);

    return $data;
}

function insert_justificatif_payment($data)
{
    db_set_active(@DB_EXTRANET);
    $nid = db_insert('dgf_form_justificatif_paiement');

    $data = justificatif_payment_convertParam('',$data);
    $nid->fields($data);

    $nid->execute();
    db_set_active();
}