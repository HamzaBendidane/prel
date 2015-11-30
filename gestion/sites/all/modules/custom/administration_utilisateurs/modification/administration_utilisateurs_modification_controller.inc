<?php

/**
 * _administration_utilisateurs_modification_require_once
 *
 * Charge les différents fichiers nécessaires
 */
function _administration_utilisateurs_modification_require_once() {
  require_once drupal_get_path('module', 'administration_utilisateurs')
    .'/common/administration_utilisateurs_common_controller.inc';
}

function _administration_utilisateurs_modification_require_js_css() {
    drupal_add_js(drupal_get_path('module', 'administration_utilisateurs') . '/modification/js/administration_utilisateurs_modification.js' );
//     drupal_add_css(drupal_get_path('module', 'administration_utilisateurs') . '/liste/css/administration_utilisateurs_liste.css' );
}

/**
 * administration_utilisateurs_modification_page
 *
 * Fcontion qui permet d'afficher la page modification d'un utilisateur
 *
 * @param unknown $id_drupal_user
 * @return Ambigous <An, string>
 */
function administration_utilisateurs_modification_page($id_drupal_user) {
  _administration_utilisateurs_modification_require_once();
  _administration_utilisateurs_modification_require_js_css();

  $return = administration_utilisateurs_common_controller_get_infos($id_drupal_user, 'modifier');

  $variables =  array(
      'form' => $return['form'],
      'table_rows' => $return['table_rows'],
      'id_drupal_user' => $id_drupal_user,
      'page' => 'modifier'
  );

  $output = theme('administration_utilisateurs_modification_page_theme', $variables);

  return $output;
}