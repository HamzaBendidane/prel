<?php

/**
 * Implements hook_init().
 */
function administration_parametres_require() {
  require_once 'parametres_db.inc';
  require_once 'parametres_form.inc';
  require_once 'parametres_langs.inc'; // Gestion des langues
  require_once 'parametres_submit.inc'; // Envoie des données
  require_once 'parametres_validate.inc'; // Validation
}

function parametres_page() {
  drupal_add_css(drupal_get_path('module', 'administration_parametres' ) . '/inc/css/parametres.css' );
  drupal_add_js(drupal_get_path('module', 'administration_parametres' ) . '/inc/js/parametres.js' );
  administration_parametres_require();
  $parametres_form = drupal_get_form('parametres_form');

  $variables =  array(
      'parametres_form' => $parametres_form,
  );

  $output = theme('parametres_page_theme', $variables);

  return $output;
}

function _get_header_data($referentiel_selected) {
  if ($referentiel_selected == 'ref_nature_demande' || $referentiel_selected == 'ref_nature_formation') {
    // Table header
    $header = array(
        array('data' => 'Label'),
        array('data' => 'Action'),
    );
  } else if ($referentiel_selected == 'ref_justificatif') {
    // Table header
    $header = array(
        array('data' => 'Nature de demande'),
        array('data' => 'Code'),
        array('data' => 'Label'),
        array('data' => 'Obligatoire'),
        array('data' => 'Action'),
    );
  } else {
    // Table header
    $header = array(
        array('data' => 'Code'),
        array('data' => 'Label'),
        array('data' => 'Action'),
    );
  }

  return $header;
}

function parametres_data() {
  administration_parametres_require();
  if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    drupal_goto('/opcaim-admin/parametres');
  }
  $header = _get_header_data($_POST['referentiel_selected']);

  if ($_POST['referentiel_selected'] == 'ref_justificatif') {
    $rows = parametres_db_get_data_list_justificatifs($_POST);
  } else {
    $rows = parametres_db_get_data_list($_POST);
  }

  $variables =  array(
      'referentiel_selected' => $referentiel_selected,
      'header' => $header,
      'rows' => $rows,
  );

  $output = theme('parametres_content_theme', $variables);

  // TODO : remplacer le print par un return + theme sans header/footer si possible
  print $output;
}