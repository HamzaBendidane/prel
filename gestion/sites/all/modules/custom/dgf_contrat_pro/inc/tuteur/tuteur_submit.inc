<?php

function dgf_contrat_pro_tuteur_form_submit($form, &$form_state) {
  // Si il y a des erreurs, on réaffiche le formulaire avec les erreurs
  if (form_get_errors()) {
    drupal_goto('/dgf/demande/contrat-pro/tuteur/'.$form_state['values']['id_dgf']);
  } else {
      try {
          // Sinon on sauvegarde les infos générales du tuteur et on redirige vers le formulaire avec affichage de la bonne
          // pop-up
          if ($form_state['values']['id_dgf_tuteur'] === '') {
              // On insert dans la table referentiel salarié par la procédure stockée
              $id_ref_esclave_salarie = stagiaire_db_sp_sauver_salarie($form_state, 'tuteur');

              // On insert dans la table temp_dgf_form_tuteur
              $id_form_tuteur = tuteur_db_insert_temp_dgf_form_tuteur($form_state, $id_ref_esclave_salarie);
          } else {
              // On insert dans la table referentiel salarié par la procédure stockée
              $id_ref_esclave_salarie = stagiaire_db_sp_sauver_salarie($form_state, 'tuteur');

              // On update dans la table temp_dgf_form_tuteur
              tuteur_db_update_temp_dgf_form_tuteur($form_state, $id_ref_esclave_salarie);
          }

          // On redirige l'utilisateur à la page d'accueil
          if ($form_state['triggering_element']['#id'] == 'edit-modal-save') {
              drupal_goto('/dashboard');
          }

          // On affiche la bonne popup : certification tuteur ou message info finale
          if (isset($_GET['modal']) && $_GET['modal'] == 'message_information_final') {
              drupal_goto('/dgf/demande/contrat-pro/tuteur/' . $form_state['values']['id_dgf'],
                  array('query' => array('modal' => 'message_information_final')));
          } else {
              drupal_goto('/dgf/demande/contrat-pro/tuteur/' . $form_state['values']['id_dgf'],
                  array('query' => array('modal' => 'certification_tuteur')));
          }

      }catch (Exception $e){
          db_set_active();
          drupal_set_message('erreur PROC STOCK : texte à définir<br/>'.$e->getMessage());
          drupal_goto($_SERVER['HTTP_REFERER']);
      }
  }
}

function dgf_contrat_pro_tuteur_attestation_form_submit($form, &$form_state) {
  // On redirige l'utilisateur vers le bon écran
  if ($form_state['triggering_element']['#id'] == 'edit-modal-save'){
    drupal_goto('/dashboard');
  } else if ($form_state['triggering_element']['#id'] == 'edit-modal-save-attestation') {
    // On insert dans la table referentiel salarié par la procédure stockée
    $id_ref_esclave_salarie = stagiaire_db_sp_sauver_salarie($form_state);

    // On update dans la table temp_dgf_form_tuteur
    tuteur_db_update_temp_dgf_form_tuteur($form_state, $id_ref_esclave_salarie);

    // On redirige l'utilisateur vers le form tuteur et on affiche la pop-up message info final
    drupal_goto('/dgf/demande/contrat-pro/tuteur/'.$form_state['values']['id_dgf'],
      array('query'=>array('modal' => 'message_information_final')));
  }
}

function dgf_contrat_pro_tuteur_message_info_finale_form_submit($form, &$form_state) {
  if ($form_state['triggering_element']['#id'] == 'edit-goto-cerfa') {
    // Redirection vers l'url du cerfa
    drupal_goto('/dgf/demande/contrat-pro/cerfa/'.$form_state['values']['id_dgf']);
  }
}