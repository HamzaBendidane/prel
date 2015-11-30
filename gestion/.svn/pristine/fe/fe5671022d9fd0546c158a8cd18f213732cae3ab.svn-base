<?php
function justificatif_get_pieceJustificatice($idDgf) {

  db_set_active(@DB_EXTRANET);
  $query = db_select('dgf_form_justificatif', 'de')
  ->fields('de')
  ->condition('id_dgf', $idDgf, '=')
  ->condition('is_delete', 0, '=')
  ->execute();

  $result = $query->fetchAll();

  db_set_active();
  return $result;

}

/*identique dgf form*/


function justificatif_db_get_directory_info($id_dgf) {
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

function justificatif_db_get_ref_justificatif($id_dgf, $temp_dgf_form_justificatif) {
  db_set_active(@DB_EXTRANET);

  $query = db_select('temp_dgf_form_demande' , 'dem')
  ->fields('dem', array('id_dgf_nature_demande'))
  ->condition('id_dgf' , $id_dgf, '=')
  ->execute();
  $id_nature_demande = $query->fetchField();

  $dgf_form_justificatif = justificatif_get_pieceJustificatice($id_dgf);
  db_set_active(@DB_EXTRANET);
  if (!$id_nature_demande) {
    db_set_active();
    return array();
  }

  // Renvoie les données ref justificatifs pour la nature de demande sélectionné
  $query = db_select('ref_justificatif' , 'jus')
  ->fields('jus')
  ->condition('is_delete', 0, '=')
  ->orderBy('jus.is_mandatory, jus.label' , 'asc')
  ->execute();

  $ref_justificatifs = $query->fetchAll();
  $key_dgf_form_justificatif=array();
  foreach ($dgf_form_justificatif as $key) {
    if($key->is_delete !=1){
      $key_dgf_form_justificatif[]=$key->id;
    }
  }

  foreach ($ref_justificatifs as $key => $justificatif) {
    if (in_array($justificatif->id, $key_dgf_form_justificatif)) {
      unset($ref_justificatifs[$key]);
    }
  }

  db_set_active();
  return $ref_justificatifs;
}

function justificatif_db_get_temp_dgf_form_justificatif($id_dgf, $nomJustificatif = null) {
  db_set_active(@DB_EXTRANET);
  if (!$nomJustificatif) {
    $query = db_select('dgf_form_justificatif', 'jus');
    $query->fields('jus')
    ->condition('jus.id_dgf', $id_dgf, '=')
    ->condition('jus.is_delete', 0, '=');
    $results = $query->execute()
    ->fetchAll();
    $justificatifs = array();
    foreach ($results as $result) {
      $justificatifs[$result->id] = $result;
    }
  } else {
    $justificatifs = db_select('dgf_form_justificatif', 'jus')
    ->fields('jus')
    ->condition('jus.t_nom_ref_fichier', $nomJustificatif, '=')
    ->condition('jus.id_dgf', $id_dgf, '=')
    ->execute()
    ->fetchAssoc();
  }

  db_set_active();

  return $justificatifs;
}

function justificatif_db_delete_temp_dgf_form_justificatif($id_justificatif) {
  global $user;
  db_set_active(@DB_EXTRANET);

  $query = db_update('dgf_form_justificatif')->fields(array(
      'is_delete' => 1,
      'date_delete' => shared_send_to_mssql_date(null, 'datetime'),
      'id_user_delete' => $user->uid,
  ))
  ->condition('t_nom_ref_fichier', $id_justificatif, '=')
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
function justificatif_db_save_files($form_state, $destination, $repertoire_fichier, $file_name_cleaned, $file_tmp,
    $file_size) {
  global $user;

  db_set_active(@DB_EXTRANET);

  $id_dgf = $form_state['values']['id_dgf'];
  $id_ref_justificatifs = $form_state['values']['id_ref_file'];


  $query0 = db_select('ref_justificatif', 'de')
  ->fields('de')
  ->condition('id', $id_ref_justificatifs, '=')
  ->execute();

  $result = $query0->fetchAssoc();
  $id_dgf_form_justificatif  = db_insert('dgf_form_justificatif')
  ->fields(array(
      'id_dgf' => $id_dgf,
      't_fichier' => $file_name_cleaned,
      't_nom_fichier'=> $file_name_cleaned,
      't_chemin_fichier' => $destination,
      't_nom_ref_fichier' =>$result['label'],
      't_repertoire_fichier' => $repertoire_fichier,
      't_taille_fichier' => $file_size,
      'date_creation' => shared_send_to_mssql_date(null, 'datetime'),
      'id_user_creation' => $user->uid,
      't_obligatoire'=>$result['is_mandatory'],
      'is_delete'=>'0',
  ))
  ->execute();

  $name = $id_dgf . '_' . $id_dgf_form_justificatif . '_' . $file_name_cleaned;
  $query = db_update('dgf_form_justificatif')
  ->fields(array(
      't_nom_fichier' => $name,
      't_fichier' => $name,
  ))
  ->condition('id', $id_dgf_form_justificatif, '=' )
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

  FROM [opcaim_extranet].[dbo].[temp_dgf_form_justificatif] justif
  left join [opcaim_extranet].[dbo].ref_justificatif refjutif on refjutif.id = justif.id_ref_justificatifs
  where justif.id_dgf = '$id_dgf'";

  $result = db_query($query);

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

  FROM [opcaim_extranet].[dbo].[temp_dgf_form_justificatif] justif
  left join [opcaim_extranet].[dbo].ref_justificatif refjutif on refjutif.id = justif.id_ref_justificatifs
  where justif.id_dgf = '$id_dgf'";

  $result = db_query($query);

  $resultdata  = $result->fetchAssoc();
  db_set_active();

  if (!$resultdata) return array();

  return $resultdata;
}


function insert_justificatif_payment($data)
{
  db_set_active(@DB_EXTRANET);
  $nid = db_insert('dgf_form_justificatif_paiement');

  $nid->fields($data);

  $nid->execute();
  db_set_active();
}