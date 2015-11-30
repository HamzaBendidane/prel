<?php

/**
 * _administration_utilisateurs_modification_require_once
 *
 * Charge les différents fichiers nécessaires
 */
function _administration_utilisateurs_mon_compte_require_once() {
  require_once drupal_get_path('module', 'administration_utilisateurs')
    .'/common/administration_utilisateurs_common_controller.inc';
}

function _administration_utilisateurs_mon_compte_require_js_css() {
    drupal_add_js(drupal_get_path('module', 'administration_utilisateurs') . '/modification/js/administration_utilisateurs_modification.js' );
//     drupal_add_css(drupal_get_path('module', 'administration_utilisateurs') . '/m/css/administration_utilisateurs_liste.css' );
}

/**
 * administration_utilisateurs_modification_page
 *
 * Fcontion qui permet d'afficher la page modification d'un utilisateur
 *
 * @param unknown $id_drupal_user
 * @return Ambigous <An, string>
 */
function administration_utilisateurs_mon_compte_page() {
  global $user;
  _administration_utilisateurs_mon_compte_require_once();
  _administration_utilisateurs_mon_compte_require_js_css();

  $id_drupal_user = shared_get_drupal_user_id($user->uid);

  if (arg(1) === 'modifier') {
    $variables = _administration_utilisateurs_mon_compte_modifier_infos($id_drupal_user);
    $output = theme('administration_utilisateurs_mon_compte_modifier_page_theme', $variables);
  } else {
    $variables = _administration_utilisateurs_mon_compte_infos($id_drupal_user);
    $output = theme('administration_utilisateurs_mon_compte_page_theme', $variables);
  }
  return $output;
}

function _administration_utilisateurs_mon_compte_modifier_infos($id_drupal_user) {
  $return = administration_utilisateurs_common_controller_get_infos($id_drupal_user, 'mon-compte');

  $variables =  array(
      'form' => $return['form'],
      'table_rows' => $return['table_rows'],
      'id_drupal_user' => $id_drupal_user,
      'page' => 'mon-compte'
  );

  return $variables;
}

function _administration_utilisateurs_mon_compte_infos($id_drupal_user) {
  $user_infos = shared_users_verify_get_infos_from_id($id_drupal_user);
  if ($user_infos) {
    $user_infos = $user_infos[0];
  }
  $user_infos->civilite_label = trim(shared_db_get_civilite_from_id($user_infos->civilite));
  $user_infos->fonction_label = trim(shared_db_get_fonction_from_id($user_infos->fonction));
  $habilitations = shared_get_habilitation();
  $user_habilitations = shared_db_get_user_habilitations($user_infos->id);

  $lien_user_entreprise_ref_esclave_entreprise = shared_db_get_lien_user_entreprise_ref_esclave_entreprise(
      $id_drupal_user);

  $etablissements = array();
  $table_rows = array();
  foreach ($lien_user_entreprise_ref_esclave_entreprise as $lien) {
    if (!$lien->est_actif) {
      continue;
    }

    $entreprise = shared_db_get_entreprise_data($lien->id_ref_esclave_entreprise);
    $company_adefim_id = shared_get_id_adefim_from_id_entreprise($lien->id_ref_esclave_entreprise);
    $company_adefim_infos = shared_get_adefim_from_id($company_adefim_id);

    $etablissements[] = array(
        'lien' => $lien,
        'entreprise' => $entreprise,
        'adefim' => $company_adefim_infos,
    );

    $id_etablissement = trim($entreprise->id);

    if ($lien->est_valide == 0) {
      $statut_rattachement = '<span class="en-attente-validation">Rattachement en attente de validation</span>';
    } else {
      $statut_rattachement = '<b>Rattachement validé</b>';
    }
    if ($entreprise->est_valide) {
      $statut_etablissement = '<span class="etab-valide">Etablissement validé</span>';
    } else {
      $statut_etablissement = '<span class="etab-a-valider">Etablissement à valider</span>';
    }

    $table_rows[] = array(
        $entreprise->raison_sociale .' <br />'
        . $entreprise->siret .' <br />'
        . $entreprise->rue . ' ' . $entreprise->code_postal . ' ' . $entreprise->ville,
        $company_adefim_infos['raison_sociale'] .' <br />'
        . $company_adefim_infos['telephone_principal'] .' <br />'
        . $company_adefim_infos['email'],
        $statut_rattachement . '<br />'
        . $statut_etablissement . '<br />'
    );
  }

  $variables =  array(
      'user_infos' => $user_infos,
      'user_habilitations' => $user_habilitations,
      'habilitations' => $habilitations,
      'table_rows' => $table_rows,
      'id_drupal_user' => $id_drupal_user,
  );

  return $variables;
}