<?php
function parametres_db_get_data_list($post_data) {
  db_set_active(@DB_EXTRANET );

//   _manage_sort_order($post_data, $order, $sort);
  $referentiel_selected = trim($post_data['referentiel_selected']);

  $query = db_select($referentiel_selected, 'r' );
  $query->fields('r');
  $query->condition('is_delete', 0, '=' );

  // Set order by
  if ($order) {
    $query->orderBy($order, $sort );
  }
  else {
    $query->orderBy('r.label', $sort );
  }
  // Executing query
  $result = $query->execute();




  // Fermeture de la connexion BDD
  db_set_active();

  // Looping for filling the table rows
  $results = array();

  while ($data = $result->fetchObject()) {
    if ($referentiel_selected == 'ref_nature_demande' || $referentiel_selected == 'ref_nature_formation') {
      $actionEdit = '<a class="action edit-edit-button" data-id="' . $data->id . '" data-element-name="' . $data->label . '"
          data-label="' . $data->label . '" href=""><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>';
      $actionDelete = '<a class="action edit-delete-button" data-id="' . $data->id . '" data-element-name="' . $data->label . '" href="">' . '<span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a>';

      $results[] = array(
        $data->label,
        '<div class="center">' . $actionEdit . $actionDelete . '</div>');
    }
    else {
      $actionEdit = '<a class="action edit-edit-button" data-id="' . $data->id . '" data-element-name="' . $data->label . '"
         data-code="' . trim($data->code ) . '" data-label="' . $data->label . '" href="">' . '<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>';
      $actionDelete = '<a class="action edit-delete-button" data-id="' . $data->id . '" data-element-name="' . $data->label . '" href="">' . '<span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a>';

      $results[] = array(
        $data->code,
        $data->label,
        '<div class="center">' . $actionEdit . $actionDelete . '</div>');
    }
  }

  return $results;
}
function parametres_db_get_data_list_justificatifs($post_data) {
  db_set_active(@DB_EXTRANET );

  _manage_sort_order($post_data, $order, $sort);
  $referentiel_selected = $post_data['referentiel_selected'];

  $query = db_select($referentiel_selected, 'r' );
  $query->leftJoin('ref_nature_demande', 'rnd', 'rnd.id = r.id_ref_nature_demande' );
  $query->addField('r', 'id', 'id_justificatif' );
  $query->addField('r', 'code', 'code_justificatif' );
  $query->addField('r', 'label', 'label_justificatif' );
  $query->addField('r', 'is_mandatory', 'is_mandatory' );
  $query->addField('rnd', 'id', 'id_ref_nature_demande' );
  $query->addField('rnd', 'label', 'label_nature_demande' );
  $query->condition('r.is_delete', 0, '=' );

  // Set order by
  if ($order) {
    $query->orderBy($order, $sort );
  }
  else {
    $query->orderBy('rnd.label', $sort );
    $query->orderBy('r.is_mandatory', 'DESC' );
    $query->orderBy('r.code', $sort );
  }

  // Executing query
  $result = $query->execute();

  // Fermeture de la connexion BDD
  db_set_active();

  // Looping for filling the table rows
  $results = array();
  while ($data = $result->fetchObject()) {
    $actionEdit = '<a class="action edit-edit-button" data-id="' . $data->id_justificatif . '" data-element-name="' . $data->label_justificatif . '"
       data-code="' . trim($data->code_justificatif ) . '" data-label="' . $data->label_justificatif . '"
            data-id-nature-demande="' . $data->id_ref_nature_demande . '" data-is-mandatory="' . $data->is_mandatory . '" href="">' . '<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>';
    $actionDelete = '<a class="action edit-delete-button" data-id="' . $data->id_justificatif . '" data-element-name="' . $data->label_justificatif . '" href="">' . '<span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a>';

    $results[] = array(
      $data->label_nature_demande,
      $data->code_justificatif,
      $data->label_justificatif,
      $data->is_mandatory,
      '<div class="center">' . $actionEdit . $actionDelete . '</div>');
  }

  return $results;
}

function _manage_sort_order($post_data, &$order, &$sort) {
  // Setting the sort conditions
  if (isset($post_data['sort']) && $post_data['sort'] != '' && isset($post_data['order']) && $post_data['order'] != '') {
    // Sort it Ascending or Descending?
    if ($post_data['sort'] == 'asc') {
      $sort = 'ASC';
    } else {
      $sort = 'DESC';
    }

    // Which column will be sorted
    switch($post_data['order']) {
    	case 'Nature de demande':
    	  $order = 'rnd.id';
    	  break;
    	case 'Code':
    	  $order = 'r.code';
    	  break;
    	case 'Label':
    	  $order = 'r.label';
    	  break;
    	case 'Obligatoire':
    	  $order = 'r.is_mandatory';
    	  break;
    	default:
    	  $order = 'r.label';
    }
  }
}

/**
 * Met à jour une référence
 *
 * @param $id -
 *          $table
 *
 *
 */
function parametres_db_update_ref($id, $code, $label, $table) {
  global $user;

  db_set_active(@DB_EXTRANET );

  if ($table != 'ref_nature_demande' && $table != 'ref_nature_formation') {
    $fields_update = array(
      'code' => $code,
      'label' => $label,
      'date_last_edit' => shared_send_to_mssql_date(null, 'datetime' ),
      'id_user_last_edit' => $user->uid);
  }
  else {
    $fields_update = array(
      'label' => $label,
      'date_last_edit' => shared_send_to_mssql_date(null, 'datetime' ),
      'id_user_last_edit' => $user->uid);
  }

  // Rêquete de mise à jour
  $query = db_update($table )->fields($fields_update )->condition('id', $id, '=' )->execute();

  db_set_active();

  return $label;
}
function parametres_db_update_ref_justificatif($id, $nature_demande, $code, $label, $is_mandatory) {
  global $user;

  db_set_active(@DB_EXTRANET );

  $fields_update = array(
    'code' => $code,
    'label' => $label,
    'id_ref_nature_demande' => $nature_demande,
    'is_mandatory' => $is_mandatory,
    'date_last_edit' => shared_send_to_mssql_date(null, 'datetime' ),
    'id_user_last_edit' => $user->uid);

  // Rêquete de mise à jour
  $query = db_update('ref_justificatif' )->fields($fields_update )->condition('id', $id, '=' )->execute();

  db_set_active();

  return $label;
}

/**
 * Créer une référence
 * $table: Table de la référence
 *
 * $label: Label à insérer
 *
 * @param $table, $label
 *
 *
 */
function parametres_db_insert_ref($table, $code, $label) {
  global $user;

  db_set_active(@DB_EXTRANET );

  if ($table != 'ref_nature_demande' && $table != 'ref_nature_formation') {
    $inserts = array(
      'code' => $code,
      'label' => $label,
      'date_creation' => shared_send_to_mssql_date(null, 'datetime' ),
      'id_user_creation' => $user->uid);
  }
  else {
    $inserts = array(
      'label' => $label,
      'date_creation' => shared_send_to_mssql_date(null, 'datetime' ),
      'id_user_creation' => $user->uid);
  }

  // Requête d'insertion
  $query = db_insert($table )->fields($inserts )->execute();

  db_set_active();

  return $label;
}
function parametres_db_insert_ref_justificatif($nature_demande, $code, $label, $is_mandatory) {
  global $user;

  db_set_active(@DB_EXTRANET );

  $fields_inserts = array(
    'code' => $code,
    'label' => $label,
    'id_ref_nature_demande' => $nature_demande,
    'is_mandatory' => $is_mandatory,
    'date_creation' => shared_send_to_mssql_date(null, 'datetime' ),
    'id_user_creation' => $user->uid);

  // Requête d'insertion
  $query = db_insert('ref_justificatif' )->fields($fields_inserts )->execute();

  db_set_active();

  return $label;
}

/*
 * Supprime une référence
 */
function parametres_db_delete_ref($table, $id) {
  global $user;

  db_set_active(@DB_EXTRANET );

  // Requête de suppression d'une référence
  $query = db_update($table )->fields(array(
    'is_delete' => 1,
    'date_delete' => shared_send_to_mssql_date(null, 'datetime' ),
    'id_user_delete' => $user->uid) )->condition('id', $id, '=' )->execute();

  $query = db_select($table, 't' );
  $query->fields('t', array(
    'label') );
  $query->condition('id', $id, '=' );
  $label = $query->execute()->fetchField();

  db_set_active();

  return $label;
}
function parametres_db_get_nature_demande() {
  db_set_active(@DB_EXTRANET );

  $results = db_select('ref_nature_demande', 'rnd' )->fields('rnd', array(
    'id',
    'label') )->condition('is_delete', 0, '=' )->execute()->fetchAllKeyed();

  db_set_active();

  return $results;
}