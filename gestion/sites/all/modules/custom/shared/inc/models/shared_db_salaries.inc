<?php

function shared_autocomplete_salarie() {
  $name = $_GET["term"];

  db_set_active(@DB_SLAVE);
  $query = db_select('salaries', 'sa');
  $query->fields('sa', array('nom', 'prenom', 'id'));

  $query->condition(
      db_or()
      ->condition('nom', '%'.$name.'%', 'LIKE')
      ->condition('prenom', $name.'%', 'LIKE')
  );
  $results = $query->execute()->fetchAll();
  $data = array();
  foreach ($results as $result) {
    $data[] = array(
        'data' => $result,
        'value' => trim($result->id),
        'label'  => trim($result->nom) . ' ' . trim($result->prenom),
    );
  }

  db_set_active();
  drupal_json_output($data);
}

function shared_get_salarie_by_name($name) {
    db_set_active(@DB_SLAVE);
    $query = db_select('salaries', 'sa');
    $query->fields('sa', array('nom', 'prenom', 'id'));

    $query->condition(
        db_or()
            ->condition('nom', '%'.$name.'%', 'LIKE')
            ->condition('prenom', $name.'%', 'LIKE')
    );
    $results = $query->execute()->fetchAll();
    $return[] = 'XXXX';
    foreach($results as $value){
        $return[] = $value->id;
    }
    db_set_active();
    return $return;
}

function shared_db_get_infos_salarie($id) {
    // On récupère les informations de la table v_organismes_de_formation
    db_set_active(@DB_SLAVE);
    $result = db_select('v_salaries', 'vof')
        ->fields('vof')
        ->condition('id', shared_isset_trim($id), '=')
      //  ->condition('est_actif', 1, '=')
        ->execute()
        ->fetchAssoc();

    db_set_active();
    return $result;
}