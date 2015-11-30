<?php

/**
 * _administration_utilisateurs_modification_require_once
 *
 * Charge les différents fichiers nécessaires
 */
function _administration_utilisateurs_common_require_once() {
  require_once 'inc/_administration_utilisateurs_common_db.inc';
  require_once 'inc/_administration_utilisateurs_common_form.inc';
  require_once 'inc/_administration_utilisateurs_common_submit.inc';
  require_once 'inc/_administration_utilisateurs_common_validate.inc';
}

/**
 * administration_utilisateurs_common_controller_get_infos
 *
 * Fcontion qui permet de construire
 *
 * @param unknown $id_drupal_user
 * @return multitype:multitype:multitype:string   multitype:multitype:unknown Ambigous <unknown, mixed>
 */
function administration_utilisateurs_common_controller_get_infos($id_drupal_user, $page) {
  global $user;

  _administration_utilisateurs_common_require_once();

   if (arg(3)) shared_security_access_user(3,'UTILIS');

  // On récupère les établissements de l'utilisateur
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

    if (!$entreprise) {
      continue;
    }

    $id_etablissement = trim($entreprise->id);
    $modif = has_role_admin() || has_role_opcaim() ;
      
      if (!$modif) {
          $mes_entreprises = shared_db_functions_get_ref_esclave_entreprise();
          $modif = array_key_exists($id_etablissement, (array)$mes_entreprises);
      }

    if ($lien->est_valide == 0) {
      $statut_rattachement = '<span class="en-attente-validation">Rattachement en attente de validation</span>';
      if ($modif) {
        $bouton_rattachement = l(
            t('Valider le rattachement'),
            '/opcaim-admin/utilisateurs/'.$id_drupal_user.'/etablissement/'.$id_etablissement.'/valider/'.$page
        );
        $bouton_rattachement .= '<br />' . l(
            t('Refuser le rattachement'),
            '/opcaim-admin/utilisateurs/'.$id_drupal_user.'/etablissement/'.$id_etablissement.'/refuser/'.$page
        );
      } else {
        $bouton_rattachement = '';
      }
    } else {
      $statut_rattachement = '<b>Rattachement validé</b>';
      if ($modif || arg(0) == 'mon-compte') {
        $class_mon_compte = arg(0) == 'mon-compte' ? 'retirer-mon-compte' : '';
        $bouton_rattachement = l(
            t('Retirer cet établissement'),
            '/opcaim-admin/utilisateurs/'.$id_drupal_user.'/etablissement/'.$id_etablissement.'/retirer/'.$page,
            array('attributes' => array('class' => $class_mon_compte))
        );
        if (arg(0) == 'mon-compte') {
          $bouton_rattachement .= '<br />' . l(
              t('Modifier cet établissement'),
              '/gestion/etablissement/modifier/'.$id_etablissement,
              array('query' => array('destination' => '/mon-compte/modifier'))
          );
        }
      } else {
        $bouton_rattachement = '';
      }
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
        . $bouton_rattachement
    );
  }

  return array(
      'table_rows' => $table_rows,
      'form' => drupal_get_form('administration_utilisateurs_common_form')
  );
}