<?php
/**
 *  Renvoie la liste des Adefims
 */
function shared_get_adefim() {

  db_set_active(@DB_SLAVE);

  $adefims = db_select('adefims' , 'adf')
             ->distinct()
             ->fields('adf')
             ->orderBy('raison_sociale')
             ->execute();

  $listes_adefims = $adefims->fetchAll();
  $adefims =array('Veuillez sélectionner dans la liste');
  foreach ($listes_adefims as $adefim) {
    $adefims[trim($adefim->id)] = trim($adefim->raison_sociale);
  }

  db_set_active();

  return $adefims;
}

function shared_get_fonction_adefim_from_id($id_fonction) {

  db_set_active(@DB_SLAVE);

  $sql = db_select('v_fonctions_adefims', 'vfa')
  ->fields('vfa', array('libelle'))
  ->condition('id', $id_fonction, '=')
  ->execute();

  $fonction_adefim = $sql->fetchCol();

  db_set_active();

  return $fonction_adefim;
}

/**
 *  Renvoie une Adefims à partir de son id
 */
function shared_get_adefim_from_id($id) {
  db_set_active(@DB_SLAVE);

  $adefims = db_select('v_adefims' , 'vadf')
    ->fields('vadf')
    ->condition('id', $id, '=')
    ->execute()
    ->fetchAssoc();

  db_set_active();

  return $adefims;
}

/**
 * Renvoie l'id ADEFIM associé à une entreprise via l'id entreprise
 *
 */
 function shared_get_id_adefim_from_id_entreprise($id_entreprise) {

  db_set_active(@DB_SLAVE);

  // Renvoie l'id entreprise
  $sql_adefims = db_select('v_adefims_entreprise', 'l')
                 ->fields('l', array('id_adefim'))
                 ->condition('id_entreprise' , $id_entreprise , '=')
                 ->execute();

  $value_id_adefim = $sql_adefims->fetchAssoc();

  $id_adefim = trim($value_id_adefim['id_adefim']);
  
  db_set_active();

  return $id_adefim;
 }

 function shared_get_adefim_info($id) {
   db_set_active(@DB_SLAVE);

   // Renvoie l'id entreprise
   $adefims_infos_sql = db_select('v_adefims', 'va');
   $adefims_infos_sql->leftJoin('v_adresses_adefims', 'vae', 'vae.id_adefim = va.id');
   $adefims_infos_sql->fields('va');
   $adefims_infos_sql->fields('vae');
   $adefims_infos_sql->condition('va.id' , $id , '=');

   $adefims_infos = $adefims_infos_sql->execute()->fetchAssoc();

   db_set_active();

   return $adefims_infos;
 }

/**
 *  Renvoie l'ADEFIM liée à une entreprise via son siret entreprise
 *  @param: $siret
 *  @return: l'ADEFIM de l'entreprise.
 */
function shared_get_adefim_from_siret($siret) {

  db_set_active(@DB_SLAVE);

  // Renvoie l'id entreprise
  $get_id_entreprise = db_select('v_entreprises', 'e')
         ->fields('e', array('id'))
         ->condition('siret' , $siret , '=')
         ->execute();

  $data_id_entreprise = $get_id_entreprise->fetchAssoc();

  $id_entreprise = trim($data_id_entreprise['id']);

  // Renvoie l'id ADEFIM  associé à une entreprise
  $query = db_select('v_adefims_entreprise' , 'lae');
  $query->leftJoin('adefims', 'ade', 'ade.id = lae.id_adefim');
  $query->fields('lae', array('id_adefim'));
  $query->fields('ade', array('raison_sociale'));
  $query->condition('id_entreprise', $id_entreprise, '=');
  $query_liens_adefim_entreprise = $query->execute();

  $adefims = $query_liens_adefim_entreprise->fetchAll();

  db_set_active();

  return $adefims;
}

/**
 *  Permet de délier et relier un ADEFIM existant
 *  @param: $id_adefim
 *  @param: $id_adefim_nouveau
 *  @param: $user_id
 *  @param: $id_entreprise
 *
 */
function shared_delier_adefim($id_adefim_ancien, $user_id, $id_entreprise) {
  // Modification si ADEFIM changé
  $delier_adefim_entreprise = array('user' => $user_id,
                                    'id_adefim' => $id_adefim_ancien,
                                    'id_entreprise' => $id_entreprise,
                                );
  shared_execute_procedure('sp_delier_adefim_entreprise', $delier_adefim_entreprise);

}

/**
 *  Permet de délier et relier un ADEFIM existant
 *  @param: $id_adefim
 *  @param: $id_adefim_nouveau
 *  @param: $user_id
 *  @param: $id_entreprise
 *
 */
function shared_relier_adefim( $id_adefim_nouveau, $user_id, $id_entreprise) {
    $lier_adefim_entreprise = array('user' => $user_id,
        'id_adefim' => $id_adefim_nouveau,
        'id_entreprise' => $id_entreprise,
    );
    shared_execute_procedure('sp_lier_adefim_entreprise', $lier_adefim_entreprise);
}

function shared_get_adefim_from_siret_entreprise($siret) {
  db_set_active(@DB_SLAVE);
  $query = db_select('v_adefims_entreprise', 'vae');
  $query->fields('vae');
  $query->condition('siret_entreprise', $siret, '=');
  $result = $query->execute();
  $adefims = $result->fetchAll();
  db_set_active();

  return $adefims;
}