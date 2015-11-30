<?php

function _administration_utilisateurs_suppression_require_once() {
  require_once 'inc/_administration_utilisateurs_suppression_db.inc';
}

/**
 * administration_utilisateurs_bloquer_callback
 *
 * @param unknown $id_drupal_user
 */
function administration_utilisateurs_bloquer_callback($id_drupal_user) {
  _administration_utilisateurs_suppression_require_once();

  $return_suppression = administration_utilisateurs_suppression_db_bloquer($id_drupal_user);
  if (false === $return_suppression['error']) {
    drupal_set_message('L\'utilisateur ' . $return_suppression['nom'] . ' a bien été supprimé
        (compte utilisateur bloqué)', 'status');
  } else {
    drupal_set_message('Une erreur est intervenue pendant la suppression de l\'utilisateur '
        . $return_suppression['nom'], 'error');
  }

  drupal_goto('opcaim-admin/utilisateurs');
}

/**
 * administration_utilisateurs_suppression_callback
 *
 * @param unknown $id_drupal_user
 */
function administration_utilisateurs_suppression_callback($id_drupal_user) {
  _administration_utilisateurs_suppression_require_once();

  $user_infos = shared_db_utilisateurs_get_users_infos($id_drupal_user);

  $from = variable_get('site_mail', 'admin@opcaim.com');

  $param_utilisateur = array(
      'name' => $user_infos->first_name . ' ' . $user_infos->last_name,
  );

  $return_suppression = administration_utilisateurs_suppression_db_supprimer($id_drupal_user);

  if (false === $return_suppression['error']) {
    drupal_set_message('L\'utilisateur ' . $return_suppression['nom'] . ' a bien été refusé', 'status');
    // send mail
    // $send_mail = drupal_mail('administration_utilisateurs', 'refuse_account', $user_infos->mail, language_default(),
    //     $param_utilisateur, $from, TRUE);
    /*
     * Création de la notification_event
     */
    $data = array (
            'name_utilisateur' => $param_utilisateur['name'],
            'callback_param' => array(
                'name' => $param_utilisateur['name'],
                'email' => $user_infos->mail
            )
    );
    
    create_notification_event('MAIL_CRE_USR_SUP', $data);
    
  } else {
    drupal_set_message('Une erreur est intervenue pendant la suppression de l\'utilisateur '
        . $return_suppression['nom'], 'status');
  }

  drupal_goto('opcaim-admin/utilisateurs');
}