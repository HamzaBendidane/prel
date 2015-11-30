<?php

function _administration_utilisateurs_ajax_require_once() {
  require_once 'inc/_administration_utilisateurs_ajax_db.inc';
}

/**
 * administration_utilisateurs_ajax_attacher
 *
 * fonction qui permet d'ajouter un établissement à un utilisateur
 */
function administration_utilisateurs_ajax_attacher() {
  _administration_utilisateurs_ajax_require_once();

  $mon_compte = arg(7) == 'true';

  $id_drupal_user = arg(2);
  $page = arg(5);
  $id_ref_entreprise = arg(6);

  $return = _administration_utilisateurs_ajax_db_attacher($id_drupal_user, $id_ref_entreprise, $mon_compte);

  if($return['status']) {
    $raison_sociale = shared_get_raison_sociale_entreprise($id_ref_entreprise);
    drupal_set_message('Le rattachement à l\'établissement ' . $raison_sociale . ' a bien été ajouté.', 'status');

    /*
     * creation de la notification_event
     */
    $data = array (
            'id_user' => $id_drupal_user,
            'callback_param' => array(
                    'id_entreprises' => array($id_ref_entreprise),
                    'id_user' => $id_drupal_user
            )
    );

    if (user_has_role(5)) {
        // Si ADMIN Entreprise

        //Création des notification_event
        create_notification_event('GST_AJO_SIRET_INF', $data);
    } else if (has_role_adefim() || has_role_opcaim()) {
        // Si USER ADEFIM ou OPCAIM

        //Création des notification_event
        create_notification_event('GST_MOD_SIRET_INF', $data);
        create_notification_event('GST_MOD_SIRET_USR', $data);
    }


  } else {
    drupal_set_message('Une erreur est intervenue. Veuillez contacter votre administrateur.', 'error');
  }
  if ($page === 'mon-compte') {
    drupal_goto('/mon-compte/modifier');
  } else {
    drupal_goto('/opcaim-admin/utilisateurs/' . $page . '/' . $id_drupal_user);
  }
}

/**
 * administration_utilisateurs_ajax_attacher
 *
 * fonction qui permet de retirer le rattachement d'un établissement à un utilisateur
 */
function administration_utilisateurs_ajax_retirer() {
  _administration_utilisateurs_ajax_require_once();

  $id_drupal_user = arg(2);
  $id_ref_entreprise = arg(4);
  $page = arg(6);

  $return = _administration_utilisateurs_ajax_db_retirer($id_drupal_user, $id_ref_entreprise);

  if($return['status']) {
    $raison_sociale = shared_get_raison_sociale_entreprise($id_ref_entreprise);
    drupal_set_message('Le rattachement à l\'établissement ' . $raison_sociale . ' a bien été retiré.', 'status');

    /*
     * creation de la notification_event
     */
    $data = array (
            'id_user' => $id_drupal_user,
            'callback_param' => array(
                    'id_entreprises' => array($id_ref_entreprise),
                    'id_user' => $id_drupal_user
            )
    );

    if (user_has_role(5)) {
        // Si ADMIN Entreprise

        //Création des notification_event
        create_notification_event('GST_AJO_SIRET_INF', $data);
    } else if (has_role_adefim() || has_role_opcaim()) {
        // Si USER ADEFIM ou OPCAIM

        //Création des notification_event
        create_notification_event('GST_MOD_SIRET_INF', $data);
        create_notification_event('GST_MOD_SIRET_USR', $data);
    }


  } else {
    drupal_set_message('Une erreur est intervenue. Veuillez contacter votre administrateur.', 'error');
  }
  if ($page === 'mon-compte') {
    drupal_goto('/mon-compte/modifier');
  } else {
    drupal_goto('/opcaim-admin/utilisateurs/' . $page . '/' . $id_drupal_user);
  }
}

/**
 * administration_utilisateurs_ajax_attacher
 *
 * fonction qui permet de valider le rattachement d'un établissement à un utilisateur
 */
function administration_utilisateurs_ajax_valider() {
  _administration_utilisateurs_ajax_require_once();

  $id_drupal_user = arg(2);
  $id_ref_entreprise = arg(4);
  $page = arg(6);

  $return = _administration_utilisateurs_ajax_db_valider($id_drupal_user, $id_ref_entreprise);

  if($return['status']) {
    $raison_sociale = shared_get_raison_sociale_entreprise($id_ref_entreprise);
    drupal_set_message('Le rattachement à l\'établissement ' . $raison_sociale . ' a bien été validé.', 'status');
  } else {
    drupal_set_message('Une erreur est intervenue. Veuillez contacter votre administrateur.', 'error');
  }
  drupal_goto('/opcaim-admin/utilisateurs/' . $page . '/' . $id_drupal_user);
}

/**
 * administration_utilisateurs_ajax_refuser
 *
 * fonction qui permet de refuser le rattachement d'un établissement à un utilisateur
 */
function administration_utilisateurs_ajax_refuser() {
  _administration_utilisateurs_ajax_require_once();

  $id_drupal_user = arg(2);
  $id_ref_entreprise = arg(4);
  $page = arg(6);

  $return = _administration_utilisateurs_ajax_db_refuser($id_drupal_user, $id_ref_entreprise);

  if($return['status']) {
    $raison_sociale = shared_get_raison_sociale_entreprise($id_ref_entreprise);
    drupal_set_message('Le rattachement à l\'établissement ' . $raison_sociale . ' a bien été refusé.', 'status');
  } else {
    drupal_set_message('Une erreur est intervenue. Veuillez contacter votre administrateur.', 'error');
  }
  drupal_goto('/opcaim-admin/utilisateurs/' . $page . '/' . $id_drupal_user);
}