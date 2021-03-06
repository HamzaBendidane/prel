<?php

/**
 * Fonction d'ecritures des codes postales
 */
function csv_to_db($filename='', $delimiter=',', $table='')
{
  if ($table != '') {
    db_set_active(@DB_EXTRANET);
    if(!file_exists($filename) || !is_readable($filename))
      return FALSE;
  
    $header = NULL;
    $data = array();
    if (($handle = fopen($filename, 'r')) !== FALSE)
    {
      while (($row = fgetcsv($handle, 1000, $delimiter)) !== FALSE)
      {
        if(!$header)
          $header = $row;
        else{
          $query = db_insert($table)
          ->fields(array(
              'code_postal' => trim($row[0]),
              'ville' => trim($row[1])
          ));
          $query->execute();
        }
      }
      fclose($handle);
    }
    db_set_active();
  }
  return true;
}

/**
 * Fonction d'import des codes postales
 */
function shared_update_code_postal() {

  $path_file = drupal_get_path('module', 'shared').'/files/code_postaux.csv';
  $tab_code_postal_ville = csv_to_db($path_file, ';', 'code_postal_ville');
}


/**
 * Recherche d'une ville ou d'un code postal
 *
 * @return json
*/
function shared_search_code_postal_ville() {
  
  db_set_active(@DB_EXTRANET);  // Connection à l'extranet

  if (!isset($code_postal) or !isset($ville)) {
     $code_postal = $_GET["code_postal"];
     $ville = $_GET["ville"];
  }
  
  $sql = db_select('code_postal_ville', 'cdv');//  Requête SQL pour trouver un numéro de siret

  $sql->fields('cdv')
      ->distinct();
  if ($code_postal) {
    $sql->condition('code_postal',  db_like($code_postal), '=');
  }
  if ($ville) {
    $sql->condition('ville',  db_like($ville), '=');
  }
  
  $values = $sql->execute()->fetchAll();
  $data = array();

  foreach ($values as $items) {
    $data[] = array(
      'code_postal' => trim($items->code_postal),
      'ville' => trim($items->ville),
    );
  }
  db_set_active(); // Fermeture de la connexion

  drupal_json_output($data); // Renvoie des résultats en json
}


/**
 * Fonction d'autoccompletion sur les codes postaux
 *
 * @return json
*/
function shared_autocomplete_code_postal() {
  
  db_set_active(@DB_EXTRANET);  // Connection à l'extranet

  if(isset($_GET['term'])) {
    $term = $_GET['term'];
  }
  
  $sql = db_select('code_postal_ville', 'cdv');//  Requête SQL pour trouver un numéro de siret

  $sql->fields('cdv')
      ->distinct();
  if ($term) {
    $sql->condition('code_postal', db_like($term) . '%', 'LIKE');
  }
  
  $values = $sql->execute()->fetchAll();
  $data = array();

  foreach ($values as $item) {
    $data[] = array(
        'label' => trim($item->code_postal) . ' - ' . trim($item->ville),
        'value' => trim($item->code_postal),
        'data' => $item,
    );
  }
  db_set_active(); // Fermeture de la connexion
  drupal_json_output($data); // Renvoie des résultats en json
}

/**
 * Fonction d'autoccompletion sur les ville
 *
 * @return json
*/
function shared_autocomplete_ville() {

  db_set_active(@DB_EXTRANET);  // Connection à l'extranet

  if(isset($_GET['term'])) {
    $term = $_GET['term'];
  }

  $sql = db_select('code_postal_ville', 'cdv');//  Requête SQL pour trouver un numéro de siret

  $sql->fields('cdv')
  ->distinct();
  if ($term) {
    $sql->condition('ville', db_like($term) . '%', 'LIKE');
  }

  $values = $sql->execute()->fetchAll();
  $data = array();

  foreach ($values as $item) {
    $data[] = array(
        'label' => trim($item->code_postal) . ' - ' . trim($item->ville),
        'value' => trim($item->ville),
        'data' => $item,
    );
  }
  db_set_active(); // Fermeture de la connexion
  drupal_json_output($data); // Renvoie des résultats en json
}
