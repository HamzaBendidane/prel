<?php

// ----------------------------------------------------------------------------
// Fonctions de mise en mémoire et de sauvegarde en BDD pour OF
// ----------------------------------------------------------------------------

/**
 * Submit for the trainee step
 *
 * @param type $form
 * @param type $form_state
 */
function dgf_organisme_formation_form_submit($form, &$form_state) {

  global $user; // User Drupal

  $id_dgf = shared_security_access_user(3, 'DGF');
  $id_ref_esclave_organisme_de_formation = trim(get_id_if_siret_already_exist($form_state['values']['siret_number']));
  $id_ref_esclave_contact_organisme_de_formation = null;

  // Si l'organisme de formation n'a pas été sélectionné, on le créé
  if ($id_ref_esclave_organisme_de_formation == false) {
    // on appelle la procédure création de l'organisme de formation
    $id_ref_esclave_organisme_de_formation = organisme_formation_db_sp_sauver_organisme_de_formation($form_state);
    // on appelle la procédure création de l'adresse de l'organisme de formation
    $id_ref_esclave_adresse_organisme_de_formation = organisme_formation_db_sp_sauver_adresse_organisme_de_formation(
        $form_state, $id_ref_esclave_organisme_de_formation);
    // on appelle la procédure création du contact de l'organisme de formation
    if ($form_state['values']['new_contact_lastname']) {
      $id_ref_esclave_contact_organisme_de_formation = organisme_formation_db_sp_sauver_contact_organisme_de_formation(
          $form_state, $id_ref_esclave_organisme_de_formation);
    }
  } else {
    // Sinon on ne sauvegarde pas l'of et son adresse
    // Si l'utilisateur a sélectionné un contact, on récupère son id
    if ($form_state['values']['select_contact']) {
      $id_ref_esclave_contact_organisme_de_formation = $form_state['values']['select_contact'];
    }
  }

  $temp_dgf_form_organisme_formation = organisme_formation_db_get_temp_dgf_form_organisme_formation($id_dgf);
  // Si l'utilisateur avait déjà rempli ce formulaire update temp_dgf_form_organisme_formation
  if ($temp_dgf_form_organisme_formation) {
    organisme_formation_db_update_temp_dgf_form_organisme_formation($id_dgf, $id_ref_esclave_organisme_de_formation,
      $id_ref_esclave_contact_organisme_de_formation, $form_state);
  } else {
    // Sinon on insert dans la BDD temp_dgf_form_organisme_formation
    organisme_formation_db_create_temp_dgf_form_organisme_formation($id_dgf, $id_ref_esclave_organisme_de_formation,
      $id_ref_esclave_contact_organisme_de_formation, $form_state);
  }

  // On redirige l'utilisateur vers le bon écran
  if ($form_state['triggering_element']['#id'] == 'edit-modal-save'){
      drupal_goto('/dashboard');
  } else if ($form_state['triggering_element']['#id'] == 'edit-next') {
      drupal_goto('/dgf/demande/contrat-pro/tuteur/'.$id_dgf);
  }

}
