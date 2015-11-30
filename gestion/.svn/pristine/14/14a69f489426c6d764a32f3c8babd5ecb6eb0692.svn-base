<?php
function organisme_formation_db_get_temp_dgf_form_organisme_formation($id_dgf) {
    // On récupère les informations de la table temp_dgf_form_organisme_formation
    db_set_active(@DB_EXTRANET);

    $result = db_select('temp_dgf_form_organisme_formation', 'temp_of')
        ->fields('temp_of')
        ->condition('id_dgf', $id_dgf, '=')
        ->condition('is_delete', 0, '=')
        ->execute()
        ->fetchAssoc();

    db_set_active();

    return $result;
}

/**
 * Retourne les données d'une organisme de formation
 * @author Gael GALBAS-FRONTINOIS
 * @param id_organisme_formation : id du référentiel esclave de l'organisme de formation
 * @return les données de l'organisme de formation
 */
function shared_db_get_organisme_formation($id_organisme_formation) {
  // On récupère les informations de la table v_organismes_de_formation
  db_set_active(@DB_SLAVE);
  $result = db_select('v_organismes_de_formation', 'vof')
  ->fields('vof')
  ->condition('id', $id_organisme_formation, '=')
  ->condition('est_actif', 1, '=')
  //     ->condition('est_valide', 1, '=')
  ->execute()
  ->fetchAssoc();

  db_set_active();

  return $result;
}

/**
 * Retourne les données d'une organisme de formation
 * @author Gael GALBAS-FRONTINOIS
 * @param id_organisme_formation : id du référentiel esclave de l'organisme de formation
 * @return les données de l'organisme de formation
 */
function shared_db_get_organisme_formation_from_siret($siret_organisme_formation) {
  // On récupère les informations de la table v_organismes_de_formation
  db_set_active(@DB_SLAVE);
  $result = db_select('v_organismes_de_formation', 'vof')
  ->fields('vof')
  ->condition('siret', $siret_organisme_formation, '=')
  ->condition('est_actif', 1, '=')
  //     ->condition('est_valide', 1, '=')
  ->execute()
  ->fetchAssoc();

  db_set_active();

  return $result;
}

 /**
 * Fonction des autocomplétions sur les orgnismes de formation
 */
function shared_autocomplete_organisme_formation(){
  db_set_active(@DB_SLAVE);  // Connection au référentiel

  if (!isset($term)) {
     $term = $_GET["term"];
  }
  $sql = db_select('entreprises', 'e');//  Requête SQL pour trouver un numéro de siret

  $sql->join('adresses_entreprises' , 'a' , 'e.id = a.id_entreprise');

  $sql->fields('e')
      ->fields('a')
      ->distinct()
      ->condition('siret',  db_like($term) . '%' , 'LIKE');

  $values = $sql->execute()->fetchAll();

  $data = array();

  foreach ($values as $items) {
    $data[] = array(
      'label' => trim($items->siret),
      'value' => trim($items->id),
      'data' =>  $items,
    );
  }
  db_set_active(); // Fermeture de la connexion

  drupal_json_output($data); // Renvoie des résultats en json
}
