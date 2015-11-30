<?php

/**
 * _administration_utilisateurs_creation_require_once
 *
 * Fonction qui gère les fichiers à inclure
 */
function _administration_utilisateurs_creation_require_once() {
  require_once drupal_get_path('module', 'administration_utilisateurs')
    .'/common/administration_utilisateurs_common_controller.inc';
}

/**
 * administration_utilisateurs_creation_page
 *
 * Fonction qui permet de faire l'affichage de la page création
 *
 * @param unknown $id_drupal_user
 * @return Ambigous <An, string>
 */
function administration_utilisateurs_creation_page($id_drupal_user) {
  _administration_utilisateurs_creation_require_once();

  $return = administration_utilisateurs_common_controller_get_infos($id_drupal_user, 'creation');
  $variables =  array(
      'form' => $return['form'],
      'table_rows' => $return['table_rows'],
      'id_drupal_user' => $id_drupal_user,
      'page' => 'creation'
  );

  $output = theme('administration_utilisateurs_creation_page_theme', $variables);

  return $output;
}