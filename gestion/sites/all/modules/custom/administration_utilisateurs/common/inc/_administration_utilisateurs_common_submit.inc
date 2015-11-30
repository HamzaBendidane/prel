<?php

/**
 * administration_utilisateurs_modification_form_submit
 *
 * @param unknown $form
 * @param unknown $form_state
 */
function administration_utilisateurs_common_form_submit($form, &$form_state) {
  $user_surname = $form_state['values']['utilisateur_prenom'];
  $user_name = $form_state['values']['utilisateur_nom'];

  switch ($form_state['triggering_element']['#id']) {
    case 'edit-modifier':
      // Récupération des anciens habilitations pour création de notification
      $id_drupal_user = arg(3);
      $old_habilitations = shared_db_get_user_habilitations($id_drupal_user);

      administration_utilisateurs_common_db_modifier($form_state['values']);
      drupal_set_message(t('L\'utilisateur ' . $user_surname . ' ' . $user_name . ' a bien été modifié'), 'status');

      $new_habilitations = shared_db_get_user_habilitations($id_drupal_user);


      /*
       * creation de la notification_event si utilisateur attaché à une entreprise
       */
      // On crée la notification que si les droits ont changé
      if ($old_habilitations != $new_habilitations) {

          $id_entreprises = array();

          $lien_user_entreprise_ref_esclave_entreprise = shared_db_get_lien_user_entreprise_ref_esclave_entreprise(
                  $id_drupal_user);

          foreach ($lien_user_entreprise_ref_esclave_entreprise as $lien) {
              $id_entreprises[] = rtrim($lien->id_ref_esclave_entreprise);
          }

          $data = array (
                  'id_user' => $id_drupal_user,
                  'callback_param' => array(
                          'id_entreprises' => $id_entreprises,
                          'id_user' => $id_drupal_user
                  )
          );

          if (user_has_role(5)) {
              // Si ADMIN Entreprise

              //Création des notification_event
              create_notification_event('GST_MOD_DRO', $data);
          } else if (has_role_adefim() || has_role_opcaim()) {
              // Si USER ADEFIM ou OPCAIM

              //Création des notification_event
              create_notification_event('GST_MOD_DRO_INF', $data);
              create_notification_event('GST_MOD_DRO_USR', $data);
          }
      }

      if (arg(0) === 'mon-compte') {
        drupal_goto('/mon-compte/modifier');
      } else {
        drupal_goto('/opcaim-admin/utilisateurs');
      }
      break;
//     case 'edit-refuser':
//       administration_utilisateurs_common_db_refuser();
//       drupal_set_message(t('L\'utilisateur ' . $user_surname . ' ' . $user_name . ' a bien été refusé'), 'status');
//       break;
    case 'edit-valider':
      administration_utilisateurs_common_db_valider($form_state['values']);
      drupal_set_message(t('L\'utilisateur ' . $user_surname . ' ' . $user_name . ' a bien été validé'), 'status');

      /*
       * creation de la notification_event si utilisateur attaché à une entreprise
       */
      $id_drupal_user = arg(3);
      $id_entreprises = array();

      $lien_user_entreprise_ref_esclave_entreprise = shared_db_get_lien_user_entreprise_ref_esclave_entreprise(
              $id_drupal_user);

      foreach ($lien_user_entreprise_ref_esclave_entreprise as $lien) {
          $id_entreprises[] = rtrim($lien->id_ref_esclave_entreprise);
      }

      //  On crée la notification que si l'utilisateur est rataché à une etp
      if (count($id_entreprises) > 0) {
          $data = array (
                  'id_user' => $id_drupal_user,
                  'callback_param' => array(
                          'id_entreprises' => $id_entreprises,
                          'id_user' => $id_drupal_user
                  )
          );

          if (user_has_role(5)) {
              // Si ADMIN Entreprise

              //Création des notification_event
              create_notification_event('GST_CRE_ETP_VAL', $data);
          } else if (has_role_adefim() || has_role_opcaim()) {
              // Si USER ADEFIM ou OPCAIM

              //Création des notification_event
              create_notification_event('GST_CRE_ETP_INF', $data);
          }
      }


      drupal_goto('/opcaim-admin/utilisateurs');
      break;
    case 'edit-ajouter':
      $id_extranet_drupal_user = administration_utilisateurs_common_db_ajouter($form_state['values']);
      drupal_set_message(t('L\'utilisateur ' . $user_surname . ' ' . $user_name . ' a bien été ajouté'), 'status');
      drupal_goto('/opcaim-admin/utilisateurs/modifier/'.$id_extranet_drupal_user);
      break;
    default:
      drupal_set_message('Aucune modification n\'a été effectué');
      break;
  }
}