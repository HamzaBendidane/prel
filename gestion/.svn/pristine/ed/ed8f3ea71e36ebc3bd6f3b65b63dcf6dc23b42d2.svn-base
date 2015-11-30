<?php

function _administration_utilisateurs_liste_require_once() {
  require_once 'inc/_administration_utilisateurs_liste_db.inc';
  require_once 'inc/_administration_utilisateurs_liste_form.inc';
  require_once 'inc/_administration_utilisateurs_liste_langs.inc'; // Gestion des langues
  require_once 'inc/_administration_utilisateurs_liste_submit.inc'; // Envoie des données
  require_once 'inc/_administration_utilisateurs_liste_validate.inc'; // Validation
}

function _administration_utilisateurs_liste_require_js_css() {
  drupal_add_js(drupal_get_path('module', 'administration_utilisateurs' ) . '/liste/js/administration_utilisateurs_liste.js' );
  drupal_add_css(drupal_get_path('module', 'administration_utilisateurs' ) . '/liste/css/administration_utilisateurs_liste.css' );
}

function administration_utilisateurs_liste_page() {
  global $user;

  _administration_utilisateurs_liste_require_once();
  _administration_utilisateurs_liste_require_js_css();

  $liste_filtre_form = drupal_get_form('administration_utilisateurs_liste_filtre_form');

  $header  = array('Numero demande', 'Nom', 'Type de compte', 'Email', 'Siret', 'Statut', 'Dernière connexion', 'Action');

  $post_data = isset($_SESSION['administration_utilisateurs_filter']) ? $_SESSION['administration_utilisateurs_filter'] : null;

  $rows    = administration_utilisateurs_db_get_utilisateurs($post_data);

  $variables =  array(
      'liste_filtre_form' => $liste_filtre_form,
      'header' => $header,
      'rows' => $rows,
  );

  $output = theme('administration_utilisateurs_liste_page_theme', $variables);

  return $output;
}