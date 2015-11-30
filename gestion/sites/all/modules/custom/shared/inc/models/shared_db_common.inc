<?php

/**
 *  Execute un select dans la base de données.
 *  @param: $db - La base de données ,
 *          $table - La table cible,
 *          $fields - Le tableau des champs à ramener lors du select
 *
 *  @return: $data - Les données résulatats de la rêquete.
 *
 */
function shared_db_select($db, $table, $alias, $fields,$condition=null){
  db_set_active($db);

  $sql = db_select($table, $alias)
         ->fields($alias, $fields);

  if ($condition){
    foreach ($condition as $value){
      $sql->condition($value[0] , $value[1],$value[2]);
    }
  }

  $query = $sql->execute();

  $data = $query->fetchAll();

  db_set_active();

  return $data;
}

function shared_get_libelle_by_id($table, $id){
    db_set_active(@DB_SLAVE);
    if (!$id) return null;
    $sql = db_select($table, 'v')
        ->fields('v')
        ->condition('id', $id, '=')
        ->execute();

    $data = $sql->fetchAssoc();

    $libelle = trim(@$data['libelle']);

    db_set_active();

    return $libelle;
}

function shared_get_label_by_id($table, $id){
  db_set_active(@DB_EXTRANET);
  if (!$id) return null;
  $sql = db_select($table, 'v')
  ->fields('v')
  ->condition('id', $id, '=')
  ->execute();

  $data = $sql->fetchAssoc();

  $label= trim(@$data['label']);

  db_set_active();

  return $label;
}

function shared_db_insert($db, $table,  $alias, $fields){
  db_set_active($db);

  $sql = db_insert($table, $alias)
         ->fields($alias, $fields)
         ->execute();

  $id = $sql->fetchAll();

  db_set_active();

  return $id;
}

function shared_db_update($db, $table,  $alias, $fields, $id_table, $id_to_update){
  db_set_active($db);

  $sql = db_insert($table)
         ->fields($alias, $fields)
         ->condition($id_table, $id_to_update, '=')
         ->execute();

  db_set_active();
}
/**
 *  TODO Commentaire
 *
 */
function delete_dgf($id)
{
    db_set_active(@DB_EXTRANET);
    global $user;
    $nid = db_update('dgf')
        ->fields(array(
            'is_delete' => 1,
            'id_user_delete' => $user->uid,
            'date_delete' => shared_send_to_mssql_date(null,'datetime')
        ))
        ->condition('id', $id, '=')->execute();

    db_set_active();
}
/**
 * shared_get_referentiel_data
 *
 * Fonction qui permet de récupérer les données référentiel de l'extranet s'il n'existe pas et de les stocker dans une
 * variable de session
 *
 * @param string $tables
 */
function shared_get_referentiel_data($tables, $isList = true, $code = true) {
  // Connection a l'extranet
  db_set_active(@DB_EXTRANET);

  if (is_array($tables)) {
    foreach ($tables as $table) {
      if (!isset($_SESSION['referentiel_extranet_datas'][$table])
          || empty($_SESSION['referentiel_extranet_datas'][$table])) {
          $results = db_select($table, 't')
          ->fields('t', array('id', 'label'))
          ->condition('is_delete', 0, '=')
          ->execute()
          ->fetchAll();

          $datas = $isList ? array('Veuillez choisir dans la liste') : array();
        foreach ($results as $value) {
          $datas[$value->id] = $value->label;
        }

        $_SESSION['referentiel_extranet_datas'][$table] = $datas;
      }
    }
  } else {
    if (!isset($_SESSION['referentiel_extranet_datas'][$tables])
        || empty($_SESSION['referentiel_extranet_datas'][$tables])) {
      if ($code) {
        $fields = array('id', 'label','code');
      } else {
        $fields = array('id', 'label');
      }
      $results = db_select($tables, 't')
        ->fields('t', $fields)
        ->condition('is_delete', 0, '=')
        ->execute()
        ->fetchAll();

      $datas = $isList ? array('Veuillez choisir dans la liste') : array();
      foreach ($results as $value) {
        $datas[$value->id] = $value->label;
      }

      $_SESSION['referentiel_extranet_datas'][$tables] = $datas;

    }
  }
  // Retour à la base de données par défaut.
  db_set_active();
}

/**
 * shared_get_referentiel_data avec tri
 *
 * Fonction qui permet de récupérer les données triées référentiel de l'extranet s'il n'existe pas et de les stocker dans une
 * variable de session
 *
 * @param string $table
 * @param array($col => $order) $col colonne à trier et $order le sens du tri (ASC, DESC)
 */
function shared_get_referentiel_data_tri($table, $isList = true, $code = true, $tri = array()) {
  // Connection a l'extranet
  db_set_active(@DB_EXTRANET);
  if (!isset($_SESSION['referentiel_extranet_datas'][$table])
      || empty($_SESSION['referentiel_extranet_datas'][$table])) {
        if ($code) {
          $fields = array('id', 'label','code');
        } else {
          $fields = array('id', 'label');
        }
        $query = db_select($table, 't')
        ->fields('t', $fields)
        ->condition('is_delete', 0, '=');
        
        foreach ($tri as $col => $tri) {
          $query->orderBy($col, $tri);
        }
        $results = $query->execute()->fetchAll();

        $datas = $isList ? array('Veuillez choisir dans la liste') : array();
        foreach ($results as $value) {
          $datas[$value->id] = $value->label;
        }

        $_SESSION['referentiel_extranet_datas'][$table] = $datas;

  }
  
  // Retour à la base de données par défaut.
  db_set_active();
}


/**
 *  Renvoie la liste des id, code et label d'un diplome
 *  @param $tables
 *  @param bool $isList
 */
function shared_get_referentiel_data_code($tables, $isList = true) {
  // Connection a l'extranet
  db_set_active(@DB_EXTRANET);

  if (!isset($_SESSION['referentiel_extranet_data_codes'][$tables])
      || empty($_SESSION['referentiel_extranet_data_codes'][$tables])) {
    $results = db_select($tables, 't')
              ->fields('t', array('id', 'code', 'label'))
              ->condition('is_delete', 0, '=')
              ->execute()
              ->fetchAll();
    $datas = $isList ? array('Veuillez choisir dans la liste') : array();
    foreach ($results as $value) {
      $datas[$value->id] = trim($value->code) .' - '. trim($value->label);
    }
    $_SESSION['referentiel_extranet_data_codes'][$tables] = $datas;
  }
  db_set_active();
}

/**
 *
 * @param String $url
 * @param int $id_dgf
 * @return UpdateQuery
 */
function save_step_url($id_dgf,$step) {
  db_set_active(@DB_EXTRANET);
  $checkOk = false;

  $data = shared_db_select(@DB_EXTRANET, 'dgf', 'd', array('etape_demande'), array(array("id" , $id_dgf , "=")));

  $current_step = 2;

  if ($data && $data[0]->etape_demande){
    $current_step = $data[0]->etape_demande;
  }

  $aSteps[2] = "/dgf/demande/contrat-pro/stagiaire";
  $aSteps[3] = "/dgf/demande/contrat";
  $aSteps[4] = "/dgf/demande/formation";
  $aSteps[5] = "/dgf/demande/organisme-formation";
  $aSteps[6] = "/dgf/demande/contrat-pro/tuteur";
  $aSteps[7] = "/dgf/demande/contrat-pro/cerfa";
  $aSteps[8] = "/dgf/demande/justificatif";
    if (($step >= $current_step ) && (( $step-1 == $current_step) || ($step == 6 && $step-2 == $current_step))){
        $checkOk = true;
    }

  if($step <=  $current_step || !$checkOk )
  {
    return ;
  }

  db_set_active();
  db_set_active(@DB_EXTRANET);

  $query = db_update('dgf');
  $query->fields(array('etape_demande' => $step));
   $query->condition('id', $id_dgf, '=');

  $query->execute();
  db_set_active();
  return $query;
}

/**
 * Passe la colonne is_delete à 1 et met à jour l'id user et la date
 *
 * @param string $table
 * @param int $id_dgf
 */
function shared_mark_as_deleted($table, $id_dgf) {

  global $user;
  db_set_active(@DB_EXTRANET);
  $query = db_update($table);
  $query->fields(array(
      'is_delete' => 1,
      'id_user_delete' => $user->uid,
      'date_delete' => shared_send_to_mssql_date(null, 'datetime'),
  ));
  if ($table != 'dgf') {
    $query->condition('id_dgf', $id_dgf, '=');
  } else {
    $query->condition('id', $id_dgf, '=');
  }

  $query->execute();
  db_set_active();
}

/**
 * Retourne le libellé en corrélation avec le code saisi
 * Il faut donner la class "field-code" au premier champ et "field-libelle" au second
 * et ajouter un champ hidden à la suite pour y insérer l'id si besoin pour la requête de submit
 * Appelée par la fonction jQuery autoSettingLibelleFromCode() dans script.js
 * 
 * @param string $table
 * @param string $code
 * @param string $libelle
 * 
 * @return json
 */
function shared_get_libelle_from_code() {//$field_value, $table, $code, $libelle) {
  $table = arg(3);
  $code = arg(4);
  $libelle = arg(5);
  $field_value = arg(6);

  // Tableau contenant les tables ayant les champs est_valide et est_actif
  $got_est_x = array('nafs', 'types_de_contrats', 'nafs', 'v_secteurs_activite');
  db_set_active(@DB_SLAVE);
  $query = db_select($table, 't');
  $query->fields('t', array($libelle, 'id'));
  $query->condition($code, $field_value, '=');

  if (in_array($table, $got_est_x)) {
    $query->condition('est_actif', 1, '=');
    $query->condition('est_valide', 1, '=');
  }

  $result = $query->execute()->fetchAssoc();

  db_set_active();
  $data = array();
  $data['label'] = rtrim($result[$libelle]);
  $data['value'] = rtrim($result[$libelle]);
  $data['data'] = array('id' => rtrim($result['id']));
   
  drupal_json_output($data);
  // echo parce que return renvoit toute la page
  // et le retour drupal_json_output() est mal géré côté js
//   echo $libelle;
}

/**
 * Retourne le libellé (autocomplété) et le code en corrélation avec le code saisi
 * Il faut donner la class "field-code" au premier champ et "field-libelle" au second
 * et ajouter un champ hidden à la suite pour y insérer l'id si besoin pour la requête de submit
 * Appelée par la fonction jQuery autocompleteLibelleAndGetCode() dans script.js
 * 
 * @param string $table
 * @param string $code
 * @param string $libelle
 * 
 * @return json
 */
function shared_autocomplete_libelle_get_code() {
  $table = arg(3);
  $code = arg(4);
  $libelle = arg(5);
  $field_value = arg(6);

  // Tableau contenant les tables ayant les champs est_valide et est_actif
  $got_est_x = array('nafs', 'types_de_contrats', 'nafs', 'v_secteurs_activite');
  db_set_active(@DB_SLAVE);
  $query = db_select($table, 't');
  $query->fields('t', array($libelle, $code, 'id'));
  $query->condition($libelle, $field_value .'%', 'LIKE');

  if (in_array($table, $got_est_x)) {
    $query->condition('est_actif', 1, '=');
    $query->condition('est_valide', 1, '=');
  }

  $results = $query->execute()->fetchAll();
  db_set_active();
  $data = array();
  foreach ($results as $result) {
    $data[] = array(
        'label' => rtrim($result->$libelle),
        'value' => rtrim($result->$libelle),
        'data' => array('code' => rtrim($result->$code), 'id' => rtrim($result->id)),
    );
  }
  drupal_json_output($data);
}



/**
//  * Recherche un libelle ou un code sur la table indiqué dans le référenciel 
//  *
//  * @return json
//  */
function shared_autocomplete_code_label() {
  $data = array();
  
  if(isset($_GET["referentiel"])) {
    $referentiel = $_GET["referentiel"];
    if($_GET["referentiel"] == 'referentiel') {
      $db = @DB_SLAVE;
    }
    else { // extranet
      $db = @DB_EXTRANET;
    }
  }  
  db_set_active($db);

  if(isset($_GET["table"])) {
    $table = $_GET["table"];
  }
  
  if (isset($_GET["code"]) or isset($_GET["label"])) {
    $code = $_GET["code"];
    $label = $_GET["label"];
  }

  if($referentiel == 'referentiel') {
    $champ_libelle = 'libelle';
  }
  else {
    $champ_libelle = 'label';
  }

  if($table) {
      try {
          // select
          $sql = db_select($table, 't');
          $sql->fields('t')->distinct();

          // where
          if ($referentiel == 'referentiel') {
              $sql->condition('est_actif', 1, '=');
          }
          if ($code != '') {
              $sql->condition('code', db_like($code) . '%', 'LIKE');
          }
          if ($label != '') {
              $sql->condition($champ_libelle, db_like($label) . '%', 'LIKE');
          }
          $values = $sql->execute()->fetchAll();
          db_set_active();

          foreach ($values as $item) {
              if ($referentiel == 'referentiel') {
                  $libelle = trim($item->libelle);
              } else {
                  $libelle = trim($item->label);
              }

              $data[] = array(
                  'label' => trim($item->code) . ' - ' . $libelle,
                  'value' => ($code != '') ? trim($item->code) : $libelle,
                  'data' => array(
                      'code' => trim($item->code),
                      'libelle' => $libelle,
                      'id' => trim($item->id),
                  ),
              );
          }
      }catch (PDOException $e){
            drupal_json_output(array());;
      }
  }
  drupal_json_output($data);
}

/**
 //  * Recherche un libelle ou un code sur la table indiqué dans le référenciel
 //  * @param $referentiel indique l'environnement à utiliser
     * @param $table indique la table à utiliser
     * @param $id valeur de l'id recherché
 //  * @return values contient les données extraites
 //  */
function share_get_code_label($referentiel, $table, $id) {
  if($referentiel == 'referentiel') {
    $db = @DB_SLAVE;
    $values = array(
        'code' => '',
        'libelle' => '',
    );
  }
  else { // extranet
    $db = @DB_EXTRANET;
    $values = array(
        'code' => '',
        'label' => '',
    );
  }
  
  db_set_active($db);  

  $query = db_select($table, 't');
  if($referentiel == 'referentiel') {
    $query->fields('t', array('code', 'libelle'));
    $query->condition('est_actif', 1, '=');
  }
  else {
    $query->fields('t', array('code', 'label'));
  }
  $query->condition('t.id', $id, '=');
  $result = $query->execute()->fetchAssoc();
  if($result ) {
    $values['code'] = trim($result['code']);
    if($referentiel == 'referentiel') {
      $values['libelle'] = trim($result['libelle']);
    }
    else {
      $values['label'] = trim($result['label']);
    }
  }
    
  db_set_active();

  return $values;
}
