<?php
function justificatif_paiement_db_get_form($idDgf) {

  db_set_active(@DB_EXTRANET);
  $query = db_select('dgf_form_justificatif_paiement', 'de')
  ->fields('de')
  ->condition('id_dgf', $idDgf, '=')
  ->condition('is_delete', 0, '=')
  ->execute();

  $result = $query->fetchAll();

  db_set_active();
  return $result;

}

/*identique dgf form*/


function insert_justificatif_paiement_payment($data)
{
  db_set_active(@DB_EXTRANET);
  $nid = db_insert('dgf_form_justificatif_paiement');

  $nid->fields($data);

  $nid->execute();
  db_set_active();
}

function justificatif_db_get_temp_dgf_form_justificatif_paiement($id_dgf,$nom=null) {
 db_set_active(@DB_EXTRANET);
 $justificatifs = array();
 if (!$nom) {
   $query = db_select('dgf_form_justificatif', 'jus');
   $query->fields('jus')
   ->condition('jus.id_dgf', $id_dgf, '=')
   ->condition('jus.is_delete', 0, '=');
   $results = $query->execute()
   ->fetchAll();

   foreach ($results as $result) {
     $justificatifs[$result->id] = $result;
   }
 } else {
  $query = db_select('dgf_form_justificatif_paiement', 'de')
  ->fields('de')
  ->condition('de.id_dgf', $id_dgf, '=')
  ->condition('de.t_nom_ref_fichier', $nom, '=')
  ->condition('de.is_delete', 0, '=')
  ->execute();
  $justificatifs = $query->fetchAssoc();
 }

  db_set_active();
  return $justificatifs ;
}

function justificatif_paiement_db_get_ref_justificatif_paiement($id_dgf, $temp_dgf_form_justificatif_paiment) {
  db_set_active(@DB_EXTRANET);

  $query = db_select('temp_dgf_form_demande' , 'dem')
  ->fields('dem', array('id_dgf_nature_demande'))
  ->condition('id_dgf' , $id_dgf, '=')
  ->execute();
  $id_nature_demande = $query->fetchField();

  //on récupère les pièces déja présentes du formulaire dgf_form_justificatif_paiement
  $dgf_form_justificatif_paiement = justificatif_paiement_db_get_form($id_dgf);
  if (!$id_nature_demande) {
    db_set_active();
    return array();
  }

  // Renvoie les données ref justificatifs pour la nature de demande sélectionné
  db_set_active(@DB_EXTRANET);
  $query = db_select('ref_justificatif' , 'jus')
  ->fields('jus')
  ->condition('is_delete', 0, '=')
  ->orderBy('jus.is_mandatory, jus.label' , 'asc')
  ->execute();

  $ref_justificatifs = $query->fetchAll();
  $key_dgf_form_justificatif=array();
  foreach ($dgf_form_justificatif_paiement as $key) {
    if($key->is_delete !=1){
      $key_dgf_form_justificatif[]=$key->t_nom_ref_fichier;
    }
  }

  foreach ($ref_justificatifs as $key => $justificatif) {
    if (in_array($justificatif->label, $key_dgf_form_justificatif)) {
      unset($ref_justificatifs[$key]);
    }
  }

  db_set_active();
  return $ref_justificatifs;
}

function justificatif_paiement_db_save_files($form_state, $destination, $repertoire_fichier, $file_name_cleaned, $file_tmp,
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
  $id_dgf_form_justificatif_paiement  = db_insert('dgf_form_justificatif_paiement')
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

  $name = $id_dgf . '_' . $id_dgf_form_justificatif_paiement . '_' . $file_name_cleaned;
  $query = db_update('dgf_form_justificatif_paiement')
  ->fields(array(
      't_nom_fichier' => $name,
      't_fichier' => $name,
  ))
  ->condition('id', $id_dgf_form_justificatif_paiement, '=' )
  ->execute();

  // DEPLACE LE FICHIER DANS LE BON REP
  move_uploaded_file($file_tmp, $destination.$name);

  db_set_active();
}

function justificatif_paiement_db_get_directory_info($id_dgf){
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

function justificatif_paiement_db_delete_temp_dgf_form_justificatif_paiement($nom) {
  if($nom) {
    global $user;
    db_set_active(@DB_EXTRANET);

    $query = db_update('dgf_form_justificatif_paiement')->fields(array(
        'is_delete' => 1,
        'date_delete' => shared_send_to_mssql_date(null, 'datetime'),
        'id_user_delete' => $user->uid,
    ))
    ->condition('t_nom_ref_fichier', $nom, '=')
    ->execute();

    db_set_active();
  }
}